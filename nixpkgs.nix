{
  allowUnfree = true; # Sadly
  allowBroken = true;

  firefox = {
    enableAdobeFlash = true;
  };

  chromium = {
    enablePepperFlash = true;
    enablePepperPdf = true;
    enableWideVine = true;
  };

  packageOverrides = let
    z3hsk =
      { mkDerivation, base, containers, hspec, mtl, QuickCheck, stdenv, z3}:
      mkDerivation {
        pname = "z3";
        version = "4.1.0";
        sha256 = "1vpmwizxcab1mlz7vp3hp72ddla7805jn0lq60fmkjgmj95ryvq9";
        isLibrary = true;
        isExecutable = true;
        libraryHaskellDepends = [ base containers mtl ];
        librarySystemDepends = [ z3 ];
        testHaskellDepends = [ base hspec QuickCheck ];
        preBuild = ''
          export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:${z3}/lib
        '';
        homepage = "http://bitbucket.org/iago/z3-haskell";
        description = "Bindings for the Z3 Theorem Prover";
        license = stdenv.lib.licenses.bsd3;
      };
  in super: let
    self = super.pkgs;
    # z3 = self.haskellPackages.callPackage z3hsk { z3 = super.z3; };
  in rec {
    all = with self; buildEnv {
      name = "all";
      paths = [
        myPythonEvn
        python35
        myHaskellEnv
        jdk8

        fasd
        ranger
        tree

        git
        # mercury
        
        aspell

        zsh
        wget

        silver-searcher
        gnuplot
        jq
        ledger
      ];
    };

    myPythonEvn = self.myEnvFun {
      name = "mypython";
      buildInputs = with self; [
        python27
        python27Packages.pexif
        python27Packages.pillow
      ];
    };

    python3ext = self.myEnvFun {
      name = "python3ext";
      buildInputs = with self; [
        python35
        python35Packages.pillow
      ];
    };

    myHaskellEnv = self.haskellPackages.ghcWithPackages
      ( p: with p;
        [ cabal-install ghc-mod
          attoparsec
          conduit
          resourcet
          vector
          QuickCheck
          hspec
          z3
          binary
          docopt
          lens
        ]
      );
  };
}
