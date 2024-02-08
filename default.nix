let
  pkgs = import <nixpkgs> {};

in
  pkgs.stdenv.mkDerivation rec {
    name = "ogs-gnugo-bot";
    builder = ./builder.sh;

    gnugo = import ./gnugo.nix pkgs;
    gtp2ogs = import ./gtp2ogs.nix pkgs;

    buildInputs = with pkgs; [
      nodejs
      yarn
      yarn2nix
    ];

    config = pkgs.writeTextFile {
      name = "gtp2ogs-config.json";
      text = ''
        {
          engine: "GNU Go 3.8",
          bot: {
            command: ["${gnugo}", "--mode", "gtp"]
          }
        }
      '';
    };
  }
