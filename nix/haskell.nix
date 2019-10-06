self: super: 
let 
  myHaskellPackages = hs: with hs; [ 
    Cabal
    QuickCheck
    aeson
    bytestring
    cassava
    directory
    free
    hspec
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

    dirtree
    jreduce
    jvmhs
    javaq
    jvm-binary
    reduce
    reduce-util
  ];

  myHaskellTools = hs: with hs; [ 
    stylish-haskell
    hlint
    ghcid
    hpack
    hspec-discover
    cabal-install
    cabal2nix
    pandoc
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
        (ghcWith (hs: myHaskellPackages hs ++ myHaskellTools hs)) 
      ] ++ tools;
    };

in { 
  haskellEnvHoogle = haskellEnvFun {
    name = "haskellEnvHoogle";
    withHoogle = true;
    tools = [ ghcide-nix.ghcide-ghc864 ];
  };
}
