# Build this derivation to generate an updated yarn.nix.

let
  pkgs = import <nixpkgs> {};

in
  pkgs.stdenv.mkDerivation {
    name = "yarn.nix";
    gtp2ogs = import ./gtp2ogs.nix pkgs;
    buildInputs = [ pkgs.yarn2nix ];

    builder = pkgs.writeShellScript "builder.sh"
      ''
        source $stdenv/setup
        cd $gtp2ogs
        yarn2nix > $out
      '';
  }
