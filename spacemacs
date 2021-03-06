;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(;; rust
     javascript
     yaml
     elm
     ;; javascript
     purescript
     csv
     html
     helm
     auto-completion
     better-defaults

     osx
     finance

     ;; Languages
     java
     ( haskell :variables
               haskell-enable-hindent-style "johan-tibell"
               haskell-process-type 'stack-ghci
               )
     python
     nixos
     clojure
     emacs-lisp
     common-lisp
     (coq :variables
          proof-general-path
          "~/.emacs.d/private/local/PG/generic/proof-site")
     latex
     bibtex
     git
     github
     graphviz
     (org :variables
          ;; org-enable-github-support t
          org-enable-bootstrap-support t
          org-enable-org-journal-support t
          )
     pandoc
     markdown
     spotify
     spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(parinfer)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Meslo LG M DZ for Powerline"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq create-lockfiles nil)
  (setq evil-want-abbrev-expand-on-insert-exit nil)

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (add-hook 'java-mode-hook
            (lambda () (setq c-basic-offset 2)))

  (setq
   eclim-eclipse-dirs "~/.p2/pool/"
   eclim-executable "~/.p2/pool/plugins/org.eclim_2.7.0/bin/eclim"
   ;; Use another eclimd executable
   eclimd-executable "~/.p2/pool/plugins/org.eclim_2.7.0/bin/eclimd"
   ;; Specify the workspace to use by default
   ;; Whether or not to block emacs until eclimd is ready
   eclimd-wait-for-process nil)

  ;; (setq-default dotspacemacs-configuration-layers
  ;;               '((haskell :variables haskell-process-type 'stack-ghci)))


  (when (configuration-layer/package-usedp 'haskell)
    (add-hook 'haskell-interactive-mode-hook
              (lambda ()
                (setq-local evil-move-cursor-back nil))))

  ;; (when (configuration-layer/package-usedp 'haskell)
  ;;   (defadvice haskell-interactive-switch (after spacemacs/haskell-interactive-switch-advice activate)
  ;;     (when (eq dotspacemacs-editing-style 'vim)
  ;;       (call-interactively 'evil-insert))))

  (setq-default TeX-master nil)
  ;; (setq-default
  ;;  dotspacemacs-configuration-layers
  ;;  '((auto-completion :variables
  ;;                     spacemacs-default-company-backends '(company-files
  ;;                                                          company-capf :with
  ;;                                                          company-dabbrev))))
  (setq-default dotspacemacs-configuration-layers
                '(auto-completion
                  (haskell :variables haskell-completion-backend 'intero)))
  (setq-default dotspacemacs-configuration-layers
                '((haskell :variables haskell-process-type 'stack-ghci)))

  (remove-hook 'prog-mode-hook #'smartparens-mode)
  (spacemacs/toggle-smartparens-globally-off)

  (setq org-journal-dir "~/Dropbox/Journal/")

  (setq org-journal-date-prefix "#+TITLE: ")
  (setq org-journal-date-format "%A, %Y-%m-%d")

  (setq spacemacs-indent-sensitive-modes
        (add-to-list 'spacemacs-indent-sensitive-modes 'nix-mode))

  (spacemacs/add-to-hooks 'parinfer-mode '(lisp-mode-hook))

  (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))

  (setq my/ledger-file "~/Dropbox/Economy/ledger.dat")

  (defun my/ledger-find ()
    (interactive)
    (find-file my/ledger-file)
    (goto-char (point-max)))

  (spacemacs/declare-prefix "=" "private bindings")
  (spacemacs/declare-prefix "=l" "ledger")
  (spacemacs/set-leader-keys
    "=lf" 'my/ledger-find)

  (require 'ob-dot)
  (require 'ob-python)
  (require 'ob-haskell)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)
     ; (sh . t)
     (python . t)
     (haskell . t)
     (lisp . t)
     (dot . t)
     ))

  (defun my-org-confirm-babel-evaluate (lang body)
    (not (string= lang "python")))
  (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

  (with-eval-after-load 'org
    (setq org-startup-indented t)
    ;; Disable line-numbers
    (add-hook 'org-mode-hook
              (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
    ;; (setq org-confirm-babel-evaluate nil)
    (setq org-clock-persist 'history)
    (org-clock-persistence-insinuate)
    (spacemacs/set-leader-keys-for-major-mode 'org-mode
      "c" nil
      "cc" 'org-edit-src-code
      "ce" 'org-babel-execute-maybe
      "cx" 'org-babel-execute-buffer))
  ;; (setq org-format-latex-options :scale 2.0)

  (setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

  (setq org-agenda-custom-commands
        '(("c" . "My Custom Agendas")
          ("cu" "Unscheduled TODO"
           ((todo ""
                  ((org-agenda-overriding-header "\nUnscheduled TODO")
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'timestamp)))))
           nil nil)
          ("ca" "Agenda"
           ((agenda "" ((org-agenda-ndays 4)))
            (tags-todo "-CANCELLED/!NEXT"
                       ((org-agenda-overriding-header "\nNEXT tasks")
                        (org-tags-match-list-sublevels t)))
            )
           ((org-agenda-compact-blocks t)))))


  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")))

  (defun org-meta-return* (&optional ignore)
    "context respecting org-insert"
    (interactive "P")
    (if ignore
        (org-return-indent)
      (cond
       ;; checkbox
       ((org-at-item-checkbox-p) (org-insert-todo-heading nil))
       ;; item
       ((org-at-item-p) (org-insert-item))
       ;; todo element
       ((org-element-property :todo-keyword (org-element-context))
        (org-insert-todo-heading 4))
       ;; heading
       ((org-at-heading-p) (org-insert-heading-respect-content))
       ;; plain text item
       ((string-or-null-p (org-context))
        (progn
          (let ((org-list-use-circular-motion t))
            (org-beginning-of-item)
            (end-of-line)
            (org-meta-return*))))
       ;; fall-through case
       (t (org-return-indent)))))

  (evil-define-key 'insert org-mode-map (kbd "M-RET") #'org-meta-return*)
  (evil-define-key 'insert org-mode-map (kbd "RET") #'org-return-indent)
  (evil-define-key 'insert org-mode-map (kbd "<S-return>") #'org-return)


  (setq org-agenda-compact-blocks t)

  (defvar my/notes-file "~/Dropbox/Notes/notes.org" "My Notes file")
  (defvar my/task-template "* TODO %^{Task}
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
:END:
Captured %<%Y-%m-%d %H:%M>
%?

%i" "Task-template")

  (setq
   org-enforce-todo-dependencies t
   org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM"
   org-capture-templates
   `(
     ("t" "Task" entry
      (file+headline ,my/notes-file "Inbox")
      ,my/task-template
      )
     ("T" "Quick task" entry
      (file+headline ,my/notes-file "Inbox")
      "* TODO %^{Task}\nSCHEDULED: %t\n"
      :immediate-finish t)
     ("i" "Interrupting task" entry
      (file+headline ,my/notes-file "Inbox")
      "* STARTED %?\n"
      :clock-in t
      :clock-resume t)
     ("n" "Add a note to the current Task" entry
      (clock)
      "* %?"
      :unnarrowed t
      )
     ("e" "Event" entry
      (file+headline ,my/notes-file "Events")
      "* %^{Event}\nSCHEDULED: %^t\n%?"
      )
     ("s" "Add a subtask to the current task" entry
      (clock)
      ,my/task-template
      :unnarrowed t
      )
     ("j" "Journal Entry" plain
      (file+datetree+prompt ,my/notes-file)
      "%?"
      :unnarrowed t
      :prepend t
      )
     ("l" "Ledger entries")
     ("lc" "Cash" plain
      (file ,my/ledger-file)
      "%(org-read-date) * %^{Payee}
    Expenses:Cash
    Expenses:%^{Account}  %^{Amount}
  ")
     )))

;; (defun my/ledger ()
;;   (defun matches-in-buffer (regexp &optional buffer)
;;     "return a list of matches of REGEXP in BUFFER or the current buffer if not given."
;;     (let ((matches))
;;       (save-match-data
;;         (save-excursion
;;           (with-current-buffer (or buffer (current-buffer))
;;             (save-restriction
;;               (widen)
;;               (goto-char 1)
;;               (while (search-forward-regexp regexp nil t 1)
;;                 (push (match-string-no-properties 1) matches)))))


;;   (setenv "PAGER" "/bin/cat")

;;   (defun my-ledger (command &optional regex file)
;;     (remove ""
;;             (split-string
;;              (shell-command-to-string
;;               (format "ledger -f %s %s %s"
;;                       (or file my-ledger-file)
;;                       command
;;                       (or regex ".*")))
;;              "\n")))

;;   (defun my-ledger-find-accounts (&optional regex file)
;;     (my-ledger "accounts" regex file))

;;   (defun my-ledger-split ()
;;     (interactive)
;;     (message "hello %s" 1))

;;   (defun my-ledger-find-payees (&optional regex file)
;;     (my-ledger "payees" regex file))

;;   (setq helm-source-ledger-accounts
;;         '((name . "accounts:")
;;           (candidates . my-ledger-find-accounts)
;;           (action . identity)
;;           ))

;;   (setq helm-source-ledger-payees
;;         '((name . "payees: ")
;;           (candidates . my-ledger-find-payees)
;;           (action . identity)))

;;   (defun helm-ledger-accounts ()
;;     (helm :sources helm-source-ledger-accounts))

;;   (defun helm-ledger-payees ()
;;     (helm :sources helm-source-ledger-payees))

;;   (defun my-ledger-add-transaction ()
;;     (interactive)
;;     (let* ((account (helm-ledger-accounts))
;;            (payee (ido-completing-read "Payee: " (my-ledger-find-payees))))
;;     (my-ledger-find)
;;     (insert "\n")
;;     (insert (format-time-string "%Y/%m/%d "))
;;     (insert payee)
;;     (insert "\n    ")
;;     (save-excursion
;;       (let ()
;;         (insert "\n    " account)
;;         ))
;;     (evil-insert-state)))

;;   ;; (with-eval-after-load 'ledger-mode
;;   ;;   (define-key ledger-reconcile-mode-map
;;   ;;     (kbd "C-c C-t") 'ledger-reconcile-toggle)
;;   ;;   (define-key ledger-reconcile-mode-map
;;   ;;     (kbd "C-c C-b") 'ledger-display-balance)
;;   ;;   (define-key ledger-reconcile-mode-map
;;   ;;     (kbd "C-c C-f") 'ledger-reconcile-finish)
;;   ;;   (define-key ledger-reconcile-mode-map
;;   ;;     (kbd "C-c C-a") 'ledger-reconcile-add))

;;   )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ledger-reports
   (quote
    ((#("buget" 0 5
        (ws-butler-chg chg))
      "ledger budget -f %(ledger-file)")
     ("reg" "ledger -f %(ledger-file) reg -V")
     ("bal" "ledger -f %(ledger-file) bal  not Equity")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)"))))
 '(org-agenda-files
   (quote
    ("~/Dropbox/Notes/School/CS239/CS239.org" "~/Dropbox/Notes/Projects/wiretap.org" "~/Dropbox/Notes/notes.org")))
 '(package-selected-packages
   (quote
    (xah-math-input unfill mwim org-category-capture parent-mode multi gitignore-mode marshal logito pcache flx goto-chg diminish nixos-options eval-sexp-fu packed graphviz-dot-mode yaml-mode winum fuzzy elm-mode livid-mode json-mode company-tern web-beautify skewer-mode simple-httpd json-snatcher json-reformat js2-refactor js2-mode js-doc tern coffee-mode company-coq company-math math-symbol-lists psci purescript-mode psc-ide dash-functional dash eclim bind-map gh bind-key inflections edn multiple-cursors paredit peg cider seq spinner queue ghc magit magit-popup git-commit helm pkg-info epl powerline markdown-mode flycheck hydra with-editor iedit clojure-mode auto-complete auctex haskell-mode yasnippet highlight anzu smartparens evil undo-tree flyspell-correct async ht request helm-core popup avy projectile f company s slime-company hide-comnt helm-purpose window-purpose imenu-list csv-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data srefactor alert log4e gntp org yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic parinfer slime common-lisp-snippets auctex-latexmk ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spotify spacemacs-theme spaceline smeargle reveal-in-osx-finder restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el pbcopy paradox ox-twbs ox-gfm osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file nix-mode neotree move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum linum-relative link-hint ledger-mode launchctl intero info+ indent-guide ido-vertical-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-spotify helm-projectile helm-nixos-options helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md flyspell-correct-helm flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu elisp-slime-nav dumb-jump company-statistics company-nixos-options company-ghci company-ghc company-emacs-eclim company-cabal company-auctex column-enforce-mode cmm-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(proof-eager-annotation-face ((t (:background "medium blue"))))
 '(proof-error-face ((t (:background "dark red"))))
 '(proof-warning-face ((t (:background "indianred3")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ledger-reports
   (quote
    ((#("buget" 0 5
        (ws-butler-chg chg))
      "ledger budget -f %(ledger-file)")
     ("reg" "ledger -f %(ledger-file) reg -V")
     ("bal" "ledger -f %(ledger-file) bal  not Equity")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)"))))
 '(org-agenda-files
   (quote
    ("~/Dropbox/Notes/School/CS239/CS239.org" "~/Dropbox/Notes/Projects/wiretap.org" "~/Dropbox/Notes/notes.org")))
 '(package-selected-packages
   (quote
    (visual-fill-column xah-math-input unfill mwim org-category-capture parent-mode multi gitignore-mode marshal logito pcache flx goto-chg diminish nixos-options eval-sexp-fu packed graphviz-dot-mode yaml-mode winum fuzzy elm-mode livid-mode json-mode company-tern web-beautify skewer-mode simple-httpd json-snatcher json-reformat js2-refactor js2-mode js-doc tern coffee-mode company-coq company-math math-symbol-lists psci purescript-mode psc-ide dash-functional dash eclim bind-map gh bind-key inflections edn multiple-cursors paredit peg cider seq spinner queue ghc magit magit-popup git-commit helm pkg-info epl powerline markdown-mode flycheck hydra with-editor iedit clojure-mode auto-complete auctex haskell-mode yasnippet highlight anzu smartparens evil undo-tree flyspell-correct async ht request helm-core popup avy projectile f company s slime-company hide-comnt helm-purpose window-purpose imenu-list csv-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data srefactor alert log4e gntp org yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic parinfer slime common-lisp-snippets auctex-latexmk ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spotify spacemacs-theme spaceline smeargle reveal-in-osx-finder restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el pbcopy paradox ox-twbs ox-gfm osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file nix-mode neotree move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum linum-relative link-hint ledger-mode launchctl intero info+ indent-guide ido-vertical-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-spotify helm-projectile helm-nixos-options helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md flyspell-correct-helm flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu elisp-slime-nav dumb-jump company-statistics company-nixos-options company-ghci company-ghc company-emacs-eclim company-cabal company-auctex column-enforce-mode cmm-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(proof-eager-annotation-face ((t (:background "medium blue"))))
 '(proof-error-face ((t (:background "dark red"))))
 '(proof-warning-face ((t (:background "indianred3")))))
)
