# pkgs:
let
  # nixpkgs release-14.12
  old-nixpkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/770822493e3962d795739fafd522e771bfe06e3d.tar.gz";
    sha256 = "sha256:197y3gqs0rzlwkr9i1hazrhkmg81kz6za3rn1ljw789x5zabh3dg";
  });

  old-pkgs = old-nixpkgs {};

  boost = old-pkgs.boost;

  pkgs = import <nixpkgs> {};

  in
  old-pkgs.stdenv.mkDerivation {
    name = "fuego";
    buildInputs = [
      boost
    ];

    src = pkgs.fetchurl {
      url = "https://master.dl.sourceforge.net/project/fuego/fuego/1.1/fuego-1.1.tar.gz";
      hash = "sha256-xh0YKTZww83ozIt7KK4DeoWkuAGIJ/Kg+T40sWW8Fs4=";
    };

    # 1. Disables threading support. Fuego still needs Boost to
    # configure, but I think it won't use it.
    #
    # 2. Fixes mistakes in smartgame library.
    patch = ./fuego-1.1.patch;

    patchPhase = ''
      patch -p1 < $patch
      '';

    # Autoconf does not seem to be able to identify the Boost version
    # without these explicit arguments.
    configureArgs = [
      "--with-boost=${boost}"
      "--with-boost-libdir=${boost.lib}/lib"
    ];

    configurePhase = ''
      CXXFLAGS=-fpermissive ./configure --prefix=$out $configureArgs
      '';
  }
