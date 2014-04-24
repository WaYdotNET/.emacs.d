;;
;; list package i need !!!
(defvar required-packages
  '(
    ;; basic package
    f
    dash
    tramp
    ;; custom ui
    ace-jump-mode
    flx
    flx-ido
    ido-vertical-mode
    color-theme-sanityinc-tomorrow
    color-identifiers-mode
    idle-highlight-mode
    ;; powerline
    ;;sr-speedbar
    project-explorer
    visual-regexp
    zenburn-theme
    flatland-theme
    workgroups2

    ;; editor
    yasnippet
    helm
    indent-guide
    expand-region
    flycheck
    flycheck-color-mode-line
    multiple-cursors
    parenface
    projectile
    smartparens
    rainbow-mode
    ;;rainbow-delimiters
    markdown-mode

    ;; editor : web
    web-mode
    js2-mode
    js2-refactor
    emmet-mode
    coffee-mode
    htmlize
    mmm-mode
    ac-inf-ruby
    enh-ruby-mode
    rubocop
    ruby-compilation
    ruby-tools
    yaml-mode
    skewer-mode

    ;; package usefull
    multi-term
    magit
    git-commit-mode
    git-rebase-mode
    dired+
    full-ack
    smex
    undo-tree
    dsvn
    diff-hl

    ;; auto complete system
    auto-complete
    ac-js2
    auto-complete-nxml
    popup

    ;; fun
    nyan-mode

    )
  "a list of packages to ensure are installed at lauch.")
