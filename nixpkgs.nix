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

  packageOverrides = super:
  let
    self = super.pkgs;
  in rec {
    all = with self; buildEnv {
      name = "all";
      paths = [
        myPythonEvn
        python35
        myHaskellEnv
        stack
        jdk8 ant
        sbcl

        fasd
        ranger
        tree

        coreutils

        graphviz 

        git
        # mercury

        aspell
        aspellDicts.da
        aspellDicts.en

        zsh
        wget

        silver-searcher
        gnuplot
        jq
        httpie
        ledger

        python27Packages.platformio
      ];
    };

    myPythonEvn = self.myEnvFun {
      name = "mypython";
      buildInputs = with self; [
        python27
        python27Packages.pexif
        python27Packages.yapf
        python27Packages.platformio
        python27Packages.pip
        # python27Packages.pillow
      ];
    };

    python3ext = self.myEnvFun {
      name = "python3ext";
      buildInputs = with self; [
        python35
        python35Packages.pillow
        python35Packages.platformio
      ];
    };

    myHaskellEnv = (self.haskellPackages.override {
      overrides = self: super: {
        mkDerivation = args: super.mkDerivation (args // {
          doCheck = false; 
          enableLibraryProfiling = true;
          # enableExecutableProfiling = true;
        });
      };
    }).ghcWithHoogle
      ( p: with p;
        [ cabal-install ghc-mod
          attoparsec
          conduit
          resourcet
          vector
          QuickCheck
          hspec
          (if (!self.stdenv.isDarwin)
          then z3
          else z3.overrideDerivation (drv: {
            preBuild = ''
            export DYLD_LIBRARY_PATH=${self.z3}/lib
            '';

            postBuild = ''
            unset DYLD_LIBRARY_PATH
            '';
            }))
          profunctors
          cabal2nix
          binary
          docopt
          lens
          transformers
          pipes
          pipes-bytestring
          pipes-binary
          monad-parallel
          stylish-haskell
          zlib
        ]
      );
  };
}
