# Build this to install a (basic, very weak) OGS Katago bot.
# Run it like this:
#
# APIKEY=<apikey> nix-build ogs-katago-bot.nix -o ogs-katago-bot

let
  pkgs = import <nixpkgs> {};
  gtp2ogs = import ./gtp2ogs.nix {pkgs = pkgs;};
  katago = import ./engines/katago.nix {pkgs = pkgs;};
  apikey = builtins.getEnv "APIKEY";

  config =
    pkgs.writeTextFile {
      name = "gtp2ogs-config.json";
      text = ''
        {
           apikey: "${apikey}",
           bot: {
             command: ["${katago}/bin/katago", "gtp"]
           },
           greeting: {
             en: "Hi! I am a bot powered by ${katago.name}, ${gtp2ogs.name}, and nixos-${builtins.substring 0 5 pkgs.lib.version}."
           },
           farewell: {
             en: "Thanks for the game!"
           },
           allowed_board_sizes: "square"
        }
      '';
    };

in
  assert apikey != "";
  {
    ogs-katago-bot =
      pkgs.writeShellScript "ogs-katago-bot" ''
        ${gtp2ogs}/bin/gtp2ogs -c ${config} --beta
      '';
  }
