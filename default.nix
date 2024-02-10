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
              hidden: true,
              bot: {
                command: ["${gnugo}/bin/gnugo", "--mode", "gtp"]
              },
              greeting: {
                en: "Hi! I am a bot powered by ${gnugo.name}, ${gtp2ogs.name}, and nixos-${builtins.substring 0 5 pkgs.lib.version}."
              },
              farewell: {
                en: "Thanks for the game!"
              },
            }
          '';
        };

    ogs-gnugo-bot = pkgs.writeShellScript "ogs-gnugo-bot" ''
      ${gtp2ogs}/bin/gtp2ogs -c ${config}
    '';

    builder = pkgs.writeShellScript "builder.sh" ''
      source $stdenv/setup
      cp ${ogs-gnugo-bot} $out
    '';
  }
