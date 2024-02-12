# This is identical to the nixpkgs version of gnugo but with an extra
# patch applied to allow a true level 1.

pkgs:
with pkgs;
stdenv.mkDerivation rec {
  pname = "gnugo";
  version = "3.8";

  src = fetchurl {
    url = "mirror://gnu/gnugo/gnugo-${version}.tar.gz";
    sha256 = "0wkahvqpzq6lzl5r49a4sd4p52frdmphnqsfdv7gdp24bykdfs6s";
  };

  patches = [
    # Pull patch pending upstream inclusion for -fno-common toolchain support:
    #   https://savannah.gnu.org/patch/index.php?10208
    (fetchpatch {
      name = "fno-common.patch";
      url = "https://savannah.gnu.org/patch/download.php?file_id=53240";
      sha256 = "0s96qvmx244vq5pv2nzf7x863kq2y5skzjhbpyzaajfkldbj0sw4";
    })
    ./gnugo-level1.patch
  ];

  hardeningDisable = [ "format" ];

  meta = {
    description = "GNU Go - A computer go player";
    homepage = "https://www.gnu.org/software/gnugo/";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
  };
}
