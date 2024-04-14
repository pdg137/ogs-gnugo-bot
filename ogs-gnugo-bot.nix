# Build this to install a OGS GnuGo bot. Run it like this:
#
# APIKEY=<apikey> nix-build ogs-gnugo-bot.nix -o ogs-gnugo-bot

let
  pkgs = import <nixpkgs> {};
  gtp2ogs = import ./gtp2ogs.nix  {pkgs = pkgs;};
  gnugo = import ./engines/gnugo-3.8.nix {pkgs = pkgs;};
  apikey = builtins.getEnv "APIKEY";

  config =
    pkgs.writeTextFile {
      name = "gtp2ogs-config.json";
      text = ''
        {
           apikey: "${apikey}",
           bot: {
             command: ["${gnugo}/bin/gnugo", "--mode", "gtp"],
           },
           greeting: {
             en: "Hi! I am a bot powered by ${gnugo.name}, ${gtp2ogs.name}, and nixos-${builtins.substring 0 5 pkgs.lib.version}."
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
  pkgs.writeShellScript "ogs-gnugo-bot" ''
    ${gtp2ogs}/bin/gtp2ogs -c ${config} --beta
  ''
