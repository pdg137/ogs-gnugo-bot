# Derivation that builds random-move-bot.
#
# See: https://github.com/pdg137/random-move-bot
#
# Usage: import ./random-move-bot.nix

{pkgs ? (import <nixpkgs> {})}:

let
  version = "1.2";

  source = pkgs.fetchFromGitHub {
    owner = "pdg137";
    repo = "random-move-bot";
    rev = version;
    hash = "sha256-o8iKHMx2tTd66SDB3A60M7vVfzqxlRi2/SrOR6ut+KI=";
  };

in

  pkgs.writeScript "random-move-bot-${version}" ''
    ${pkgs.python3}/bin/python3 ${source}/random-move-bot.py
  ''
