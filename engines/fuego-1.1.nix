# Derivation that builds Fuego-1.1, the last released version of
# Fuego, with minimal patches for compatibility with the latest
# Nixpkgs build tools.  Also installs fuego_unittest, which you can
# run to test the build.
#
# See: https://fuego.sourceforge.net/

{pkgs ? (import <nixpkgs> {})}:
let

  boost = pkgs.boost;

in

  pkgs.stdenv.mkDerivation {
    name = "fuego-1.1";

    buildInputs = [
      boost
    ];

    src = pkgs.fetchurl {
      url = "https://master.dl.sourceforge.net/project/fuego/fuego/1.1/fuego-1.1.tar.gz";
      hash = "sha256-xh0YKTZww83ozIt7KK4DeoWkuAGIJ/Kg+T40sWW8Fs4=";
    };

    # Patch to fix a few mistakes that broke compilations. Some
    # changes might only be necessary for it to work on more recent
    # nixpkgs versions, which we did not fully get to work.
    patch = ./fuego-1.1.patch;

    patchPhase = ''
      patch -p1 < $patch
      '';

    # Autoconf does not seem to be able to identify the Boost version
    # without these explicit arguments.
    configureArgs = [
      "--with-boost=${boost.dev}"
      "--with-boost-libdir=${boost}/lib"
    ];

    configurePhase = ''
      CXXFLAGS=-fpermissive ./configure --prefix=$out $configureArgs
      '';

    buildPhase = ''
      make
      make -C unittestmain/ fuego_unittest
      '';

    installPhase = ''
      mkdir -p $out/bin
      make install
      cp unittestmain/fuego_unittest $out/bin
      '';
  }
