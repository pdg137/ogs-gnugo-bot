# Build this to install a OGS GnuGo bot. Run it like this:
#
# APIKEY=<apikey> nix-build ogs-fuego-bot.nix -o ogs-fuego-bot

let
  pkgs = import <nixpkgs> {};
  gtp2ogs = import ./gtp2ogs.nix pkgs;
  fuego = import ./engines/fuego-latest.nix pkgs;
  gnugo = import ./engines/gnugo-3.8.nix pkgs;
  apikey = builtins.getEnv "APIKEY";

  config =
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
             moves_to_allow_before_checking_ratio: 0.2,
             send_chats: false
           },
           greeting: {
             en: "Hi! I am a bot powered by ${fuego.name}, ${gtp2ogs.name}, and nixos-${builtins.substring 0 5 pkgs.lib.version}.  I use ${gnugo.name} to help with passing and resigning."
           },
           farewell: {
             en: "Thanks for the game!"
           },
           allowed_board_sizes: "square",
        }
      '';
    };

in
  assert apikey != "";
  {
    ogs-fuego-bot =
      pkgs.writeShellScript "ogs-fuego-bot" ''
        ${gtp2ogs}/bin/gtp2ogs -c ${config} --beta
      '';
  }
