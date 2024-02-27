pkgs:
let

  boost = pkgs.boost;

in

  pkgs.stdenv.mkDerivation {
    name = "fuego-r2038";

    buildInputs = [
      boost
      pkgs.autoconf
      pkgs.automake
    ];

    src = pkgs.fetchsvn {
      url = "https://svn.code.sf.net/p/fuego/code/trunk";
      rev = "2038";
      hash = "sha256-ZuPuX+WrW/iRj9hgiOGpY26jFkQY9i7ocDuEi56Y5r8=";
    };

    # Autoconf does not seem to be able to identify the Boost version
    # without these explicit arguments.
    configureArgs = [
      "--with-boost=${boost.dev}"
      "--with-boost-libdir=${boost}/lib"
    ];

    configurePhase = ''
      aclocal
      autoheader
      autoreconf -i
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
