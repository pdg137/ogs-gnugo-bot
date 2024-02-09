# Build this to install a OGS GnuGo bot. Run it like this:
#
#  APIKEY=<apikey> nix-build

let
  pkgs = import <nixpkgs> {};

in
  pkgs.stdenv.mkDerivation rec {
    name = "ogs-gnugo-bot";
    buildInputs = with pkgs; [ ];

    # Import packages locked to specific versions.
    gtp2ogs = import ./gtp2ogs.nix pkgs;
    gnugo = import ./gnugo38.nix pkgs;

    config =
      let
        apikey = builtins.getEnv "APIKEY";
      in
        assert apikey != "";
        pkgs.writeTextFile {
          name = "gtp2ogs-config.json";
          text = ''
            {
              apikey: "${apikey}",
              engine: "GNU Go 3.8",
              bot: {
                command: ["${gnugo}/bin/gnugo", "--mode", "gtp"]
              },
            }
          '';
        };

    ogs-gnugo-bot = pkgs.writeShellScript "ogs-gnugo-bot" ''
      ${gtp2ogs}/bin/gtp2ogs -c ${config} --beta
    '';

    builder = pkgs.writeShellScript "builder.sh" ''
      source $stdenv/setup
      cp ${ogs-gnugo-bot} $out
    '';
  }
