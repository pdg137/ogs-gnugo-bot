# Build this to install a OGS GnuGo bot. Run it like this:
#
#  APIKEY=<apikey> nix-build

let
  pkgs = import <nixpkgs> {};
  gtp2ogs = import ./gtp2ogs.nix pkgs;
  fuego = import ./fuego.nix pkgs;
  apikey = builtins.getEnv "APIKEY";
in
with pkgs;

  stdenv.mkDerivation rec {
    name = "ogs-fuego-bot";

    config =
      assert apikey != "";
      assert gnugo.name == "gnugo-3.8";
      writeTextFile {
        name = "gtp2ogs-config.json";
        text = ''
          {
            apikey: "${apikey}",
            bot: {
              command: ["${fuego}/bin/fuego"]
            },
            ending_bot: {
              command: ["${gnugo}/bin/gnugo", "--mode", "gtp"],
              moves_to_allow_before_checking_ratio: 0.1,
              send_chats: false
            },
            greeting: {
              en: "Hi! I am a bot powered by ${fuego.name}, ${gtp2ogs.name}, and nixos-${builtins.substring 0 5 pkgs.lib.version}."
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
