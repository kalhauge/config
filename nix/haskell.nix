self: super: 
with super.haskell.lib; let 
  myHaskellPackages = hs: with hs; [ 
    Cabal
    QuickCheck
    aeson
    bytestring
    cassava
    directory
    free
    hspec
    hspec-megaparsec
    lens
    lens-action
    megaparsec
    mtl
    optparse-applicative
    parsec
    prettyprinter
    shake
    time
    transformers
    typed-process
    vector
    (dontHaddock vulkan-api)
    GLFW-b
    hakyll
    hnix

    tasty
    hspec-expectations-pretty-diff

    dirtree
    jreduce
    jvmhs
    javaq
    jvm-binary
    reduce
    reduce-util
    nixec
  ];

  myHaskellTools = hs: with hs; [ 
    stylish-haskell
    hlint
    hindent
    brittany
    ghcid
    hpack
    hspec-discover
    cabal-install
    pandoc
    doctest
    profiteur
  ];

  ghcide-nix = import (builtins.fetchTarball "https://github.com/hercules-ci/ghcide-nix/tarball/master") {};
  
  haskellEnvFun = { withHoogle ? false, compiler ? null, name, tools}:
    let 
      hp = 
        if compiler != null
        then self.haskell.packages.${compiler}
        else self.haskellPackages;

      ghcWith = 
        if withHoogle
        then hp.ghcWithHoogle
        else hp.ghcWithPackages;
    in super.buildEnv {
      name = name;
      paths = [
        (ghcWith (hs: myHaskellPackages hs ++ myHaskellTools hs ++ [super.elmPackages.elm ])) 
      ] ++ tools;
    };

in { 
  haskellEnvHoogle = haskellEnvFun {
    name = "haskellEnvHoogle";
    withHoogle = true;
    tools = [ # ghcide-nix.ghcide-ghc864 
    ];
  };
}
