# Build this to install a OGS GnuGo bot. Run it like this:
#
#  APIKEY=<apikey> nix-build

let
  pkgs = import <nixpkgs> {};
  gtp2ogs = import ./gtp2ogs.nix pkgs;
  apikey = builtins.getEnv "APIKEY";
  gnugo-level1 = import ./gnugo-level1.nix;
in
with pkgs;

  stdenv.mkDerivation rec {
    name = "ogs-gnugo-bot";

    config =
      assert apikey != "";
      assert gnugo-level1.name == "gnugo-3.8";
      writeTextFile {
        name = "gtp2ogs-config.json";
        text = ''
          {
            apikey: "${apikey}",
            bot: {
              command: ["${gnugo-level1}/bin/gnugo", "--mode", "gtp"]
            },
            greeting: {
              en: "Hi! I am a bot powered by ${gnugo-level1.name}, ${gtp2ogs.name}, and nixos-${builtins.substring 0 5 pkgs.lib.version}."
            },
            farewell: {
              en: "Thanks for the game!"
            },
          }
        '';
      };

    ogs-gnugo-bot = writeShellScript "ogs-gnugo-bot" ''
      ${gtp2ogs}/bin/gtp2ogs -c ${config} --beta
    '';

    builder = writeShellScript "builder.sh" ''
      source $stdenv/setup
      cp ${ogs-gnugo-bot} $out
    '';
  }
