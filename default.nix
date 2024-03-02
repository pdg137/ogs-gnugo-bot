# Build this to install a OGS GnuGo bot. Run it like this:
#
#  APIKEY=<apikey> nix-build

let
  pkgs = import <nixpkgs> {};
  gtp2ogs = import ./gtp2ogs.nix pkgs;
  fuego = import ./bots/fuego-latest.nix pkgs;
  gnugo = import ./bots/gnugo-3.8.nix pkgs;
  apikey = builtins.getEnv "APIKEY";
in
  pkgs.stdenv.mkDerivation rec {
    name = "ogs-fuego-bot";

    config =
      assert apikey != "";
      pkgs.writeTextFile {
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
            allowed_board_sizes: "square",
          }
        '';
      };

    bot = pkgs.writeShellScript "ogs-gnugo-bot" ''
      ${gtp2ogs}/bin/gtp2ogs -c ${config} --beta
    '';

    builder = pkgs.writeShellScript "builder.sh" ''
      source $stdenv/setup
      cp ${bot} $out
    '';
  }
