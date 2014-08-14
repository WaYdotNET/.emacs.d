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
    idle-highlight-mode
    project-explorer
    visual-regexp
    zenburn-theme
    color-theme-solarized
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
    smart-mode-line
    rainbow-mode
    rainbow-blocks
    rainbow-delimiters
    markdown-mode
    find-temp-file

    ;; editor : web
    web-mode
    js2-mode
    js-doc
    js2-refactor
    emmet-mode
    coffee-mode
    htmlize
    mmm-mode
    skewer-mode
    csharp-mode
    json-mode
    color-identifiers-mode
    typescript
    tss

    ;; ruby
    enh-ruby-mode
    rubocop
    ac-inf-ruby
    ruby-compilation
    ruby-tools
    yaml-mode
    slim-mode
    haml-mode

    ;; python
    elpy

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
;;    mode-Company

    ;; org-mode
    org
    org-ac
    org-page
    org-pandoc
    org-screenshot
    org-trello

    ;; fun
    nyan-mode
    )
  "a list of packages to ensure are installed at lauch.")
