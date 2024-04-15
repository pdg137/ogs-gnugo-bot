# This installs gtp2ogs using node2nix, similarly to how it would be
# installed if it were a supported npm package in nixpkgs.
#
# Maybe later we can add it to the official list.
#
# See https://www.npmjs.com/package/gtp2ogs for updates and update the
# version string below as necessary. Make sure to clear out the hash
# to force Nix to download new files and compute a new one.

{pkgs ? (import <nixpkgs> {})}:
with pkgs;
let
  version = "8.0.4";
  hash = "sha256-UccWcFR/Pm6YQZ4SvY+VJmBr2b/iG1iYqz7UxsXYMFY=";

  gtp2ogs-builder = runCommand "gtp2ogs-builder" {
    node2nix = node2nix;
    package = writeTextFile {
      name = "gtp2ogs-package.json";
      text = ''[{"gtp2ogs":"${version}"}]'';
    };

    # Required settings for downloading to work.
    buildInputs = [ cacert ];
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = hash;
  } ''
    mkdir $out
    cd $out
    echo $node2nix/bin/node2nix -i $package --pkg-name nodejs_18
    $node2nix/bin/node2nix -i $package --pkg-name nodejs_18
  '';
in
(import gtp2ogs-builder.outPath {})."gtp2ogs-${version}"
