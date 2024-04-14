# Build this to install an OGS random move bot.
# Run it like this:
#
# APIKEY=<apikey> nix-build ogs-random-move-bot.nix -o ogs-random-move-bot

let
  pkgs = import <nixpkgs> {};
  gtp2ogs = import ./gtp2ogs.nix {pkgs = pkgs;};
  random-move-bot = import ./engines/random-move-bot.nix {pkgs = pkgs;};
  gnugo = import ./engines/gnugo-3.8.nix {pkgs = pkgs;};
  apikey = builtins.getEnv "APIKEY";

  config =
    pkgs.writeTextFile {
      name = "gtp2ogs-config.json";
      text = ''
        {
           apikey: "${apikey}",
           bot: {
             command: ["${random-move-bot}/bin/random-move-bot"]
           },
           greeting: {
             en: "Hi! I am a bot powered by ${random-move-bot.name}, ${gtp2ogs.name}, and nixos-${builtins.substring 0 5 pkgs.lib.version}."
           },
           ending_bot: {
             command: ["${gnugo}/bin/gnugo", "--mode", "gtp"],
             moves_to_allow_before_checking_ratio: 0.2,
             allowed_resigns: 3,
             send_chats: false
           },
           farewell: {
             en: "Thanks for the game!"
           },
           allowed_board_sizes: [3,4,5,6,7,8,9,10,11,12,14]
        }
      '';
    };

in
  assert apikey != "";
  {
    ogs-random-move-bot =
      pkgs.writeShellScript "ogs-random-move-bot" ''
        ${gtp2ogs}/bin/gtp2ogs -c ${config} --beta
      '';
  }
