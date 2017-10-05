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
        coq_8_5
        stack
        jdk8 ant
        sbcl

        fasd
        ranger
        tree
        tmux

        coreutils

        elmPackages.elm

        nodejs
        nodePackages.grunt-cli
        nodePackages.gulp
        nodePackages.bower

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
        taskwarrior
        
        python27Packages.platformio

        (pkgs.python35.withPackages (ps: 
          [ ps.pymongo
            ps.nose
            ps.pillow
            ps.docopt
            ps.sphinx
            (ps.buildPythonPackage rec {
              name = "mongoengine-0.11.0";

              src = pkgs.fetchurl {
                url = "mirror://pypi/m/mongoengine/${name}.tar.gz";
                sha256 = "1ff6q0brknahh209kfa237w2a6dv141fykqppfr3ppi65l6jnlrr";
              };

              buildInputs = with ps; [ pymongo sphinx six ];
              doCheck = false;

              meta = {
                homepage = "https://github.com/MongoEngine/mongoengine";
                # license = licenses.mit;
                description = "MongoEngine is a Python Object-Document Mapper for working with MongoDB";
              };
            })
          ]
        ))
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
        python35Packages.sphinx
        python35Packages.nose
        python35Packages.platformio
      ];
    };

    myHaskell = (self.haskellPackages.override {
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
          blaze-html
          http-types
          scotty
          wai
          wai-websockets
          warp
          websockets

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
          fgl
          pipes-bytestring
          (self.stdenv.lib.overrideDerivation pipes-binary (attr:{
            name = "pipes-binary-fix";
            patches = [./pipes-binary.patch];
          }))
          monad-parallel
          stylish-haskell
          zlib
        ]
      );
  };
}
