{
  allowUnfree = true; # Sadly
  allowBroken = true;

  firefox = {
    enableAdobeFlash = true;
  };

  chromium = {
    enablePepperFlash = true;
    enableWideVine = true;
  };

  packageOverrides = super:
  let
    self = super.pkgs;
  in with self;
  rec {
    all = buildEnv {
      name = "all";
      paths = [
        coq_8_5
        jdk8 ant gradle
        sbcl

        neovim
        fasd
        # ranger
        tree
        tmux
        reattach-to-user-namespace
        pv 
        entr

        # mutt
        ninja
        neomutt
        offlineimap
        msmtp
        notmuch
        urlview

        ruby
        bundler

        gnupg20

        coreutils

        cairo

        emacs

        # elmPackages.elm

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

        ffmpeg
      ];
    };
    my-python = python3.withPackages 
      (pkgs: with pkgs; [ 
        numpy matplotlib scipy tabulate pygraphviz pandocfilters pandas ipython
        notebook pylint graph-tool pygments
        pydub
        ]);
  };
}
