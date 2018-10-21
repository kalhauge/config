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
        jdk8 ant gradle
        sbcl

        fasd
        ranger
        tree
        tmux
        reattach-to-user-namespace
        pv 

        pandoc

        coreutils

        emacs

        stack

        elmPackages.elm

        nodejs
        nodePackages.grunt-cli
        nodePackages.gulp
        nodePackages.bower

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
      ];
    };
  };
}
