pkgs:
let

  # We build with nixpkgs release-15.09, the last one to include boost
  # 1.57, which is the last verison that seems to work with Fuego.
  old-nixpkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/cc7c26173149348ba43f0799fac3f3823a2d21fc.tar.gz";
    sha256 = "sha256:1pgsqjw7qfsiivy5hvvslw48mamq5w3zs2jnwaixn657rh509v86";
  });

  old-pkgs = old-nixpkgs {};

  boost = old-pkgs.boost157;

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

    # Patch to fix a few mistakes
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
