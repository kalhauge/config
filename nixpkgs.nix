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
  in with self;
  let
    haskellTools = with haskellPackages; [
      stack 
      ghcid
      stylish-haskell
      hindent
      hspec-discover
      hlint
      cabal2nix
      pandoc-crossref
      hledger
    ];
  in rec {
    all = buildEnv {
      name = "all";
      paths = [
        coq_8_5
        jdk8 ant gradle
        sbcl

        fasd
        # ranger
        tree
        tmux
        reattach-to-user-namespace
        pv 
        entr

        # mutt
        neomutt
        offlineimap
        msmtp
        notmuch
        urlview


        pandoc

        coreutils

        emacs

        elmPackages.elm

        # python3 # .withPackages (packages: with packages; [ numpy ])

        # nodejs
        # nodePackages.grunt-cli
        # nodePackages.gulp
        # nodePackages.bower

        gnuplot
        graphviz 

        git

        aspell
        aspellDicts.da
        aspellDicts.en

        zsh
        wget

        silver-searcher
        jq
        httpie
        ledger
        taskwarrior
      ] ++ haskellTools ;
    };
    my-python = python3.withPackages 
      (pkgs: with pkgs; [ numpy matplotlib scipy tabulate pygraphviz pandocfilters pandas ipython notebook pylint]);
  };
}
