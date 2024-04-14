# Derivation that builds random-move-bot.
#
# See: https://github.com/pdg137/random-move-bot
#
# Usage: import ./random-move-bot.nix

{pkgs ? (import <nixpkgs> {})}:

let
  version = "1.0";

  source = pkgs.fetchFromGitHub {
    owner = "pdg137";
    repo = "random-move-bot";
    rev = version;
    hash = "sha256-VdQmbKJpDHCkahbIXp2tim97GKgzb2h+HSyPywEqL4s=";
  };

in

  pkgs.writeScript "random-move-bot-${version}" ''
    ${pkgs.python3}/bin/python3 ${source}/random-move-bot.py
  ''
