let
  pkgs = import <nixpkgs> {};

in
  pkgs.stdenv.mkDerivation rec {
    name = "ogs-gnugo-bot";

    gnugo = import ./gnugo.nix pkgs;
    gtp2ogs-source = import ./gtp2ogs-source.nix pkgs;
    gtp2ogs = (import ./gtp2ogs.nix {}).gtp2ogs;

    buildInputs = with pkgs; [
      nodejs
    ];

    config = pkgs.writeTextFile {
      name = "gtp2ogs-config.json";
      text = ''
        {
          engine: "GNU Go 3.8",
          bot: {
            command: ["${gnugo}/bin/gnugo", "--mode", "gtp"]
          }
        }
      '';
    };


    builder = pkgs.writeShellScript "builder.sh"
      ''
      source $stdenv/setup
      set -xe
      # what to do here? 
      '';
  }
