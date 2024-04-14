# Derivation that builds KataGo.  Includes the strongest model as of
# 2024-03-05 and a really basic configuration file that should be fast
# and work on any computer but is very weak.
#
# See: https://github.com/lightvector/KataGo

{pkgs ? (import <nixpkgs> {})}:

let
  katago-executable = pkgs.katago.override {
    backend = "eigen"; # One of: "opencl" "cuda" "tensorrt" "eigen"
  };

  katago-model = pkgs.fetchurl {
    url = "https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b18c384nbt-s9432368384-d4165837414.bin.gz";
    hash = "sha256-QrS1hR96GIC5czfoy2PunU99Ork8KQqIuStOuFjpMVc=";
  };

in

  pkgs.stdenv.mkDerivation {
    name = "katago";

    buildDeps = [ katago-executable ];

    src = katago-executable;

    conf = pkgs.writeText "default_gtp.cfg" ''
      # Each run of KataGo will log to a separate file in this dir.
      # This is the default.
      logDir = /tmp

      # Logging options
      logAllGTPCommunication = false
      logSearchInfo = false
      logSearchInfoForChosenMove = false
      logToStderr = false

      rules = chinese

      allowResignation = true
      resignThreshold = -0.90
      resignConsecTurns = 3

      # Configure to be extremely fast and weak by default:
      maxVisits = 10
      ponderingEnabled = false
      lagBuffer = 1.0

      numSearchThreads = 1
      searchFactorAfterOnePass = 0.50
      searchFactorAfterTwoPass = 0.25
      searchFactorWhenWinning = 0.40
      searchFactorWhenWinningThreshold = 0.95
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp $src/bin/katago $out/bin
      cp ${katago-model} $out/bin/default_model.bin.gz
      cp $conf $out/bin/default_gtp.cfg
    '';
  }
