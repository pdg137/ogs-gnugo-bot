# Derivation that builds GnuGo-3.8, the last released version of
# GnuGo.  This is included in nixpkgs so there's nothing to do here
# except assert that the version is 3.8 (just in case another version
# is released someday.)
#
# See: https://www.gnu.org/software/gnugo/

{pkgs ? (import <nixpkgs> {})}:

assert pkgs.gnugo.name == "gnugo-3.8";
pkgs.gnugo
