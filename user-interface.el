;; personal user interface customization

;; macosx keybind fix
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)

;; minimalista

;; Remove scrollbars, menu bars, and toolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; cool frame title with currently edited buffer name
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))


;; disable auto-save and auto-backup
;;(setq auto-save-default nil)
;;(setq make-backup-files nil)
;; (setq auto-save-default t)
;; bypassiamo la schermata di benvenuto
(setq inhibit-startup-message t)
;; impostiamo il tab di default a 2 caratteri
(setq-default tab-width 2)
;; usiamo gli spazi al posto dei tab !!!
(setq-default indent-tabs-mode nil)
;; basta y/n e non yes/no ... su dai
;;
(fset 'yes-or-no-p 'y-or-n-p)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;
(load-theme 'zenburn)

;; show column number in mode-line
(setq column-number-mode t)

;; fun :D
(require 'nyan-mode)
(nyan-mode)

;; flat !
(set-face-attribute 'header-line nil :box nil)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; smart-mode-line
(setq sml/theme 'dark)
(sml/setup)

(set-frame-font "Source Code Pro-11")

;; Highlight Current Line
(global-hl-line-mode +1)
(require 'highlight-indentation)

(setq frame-char (frame-char-width (selected-frame)))

;; (set-face-attribute 'highlight-indentation-face nil
;;                     :stipple (list frame-char (/ frame-char 2) (string (* frame-char 2) 0 0 0))
;;                      :inherit nil
;;                      :foreground "grey"
;;                      )

;; (set-face-attribute 'highlight-indentation-current-column-face nil
;;                     :stipple (list frame-char (/ frame-char 2) (string (* frame-char 2) 0 0 0))
;;                     :inherit nil
;;                     :foreground "yellow")

;; disabilito la acapo automatico
(global-visual-line-mode t)

;; use fuzzy style matching for commands aswell
(require 'smex)
(smex-initialize)

;; project-explorer
(require 'project-explorer)

;; enable Projectile globally
(require 'projectile)
(projectile-global-mode)

(require 'find-temp-file)

;; Show the current function name in the header line
(which-function-mode)
(setq which-func-unknown "n/a")
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
      ;; We remove Which Function Mode from the mode line, because it's mostly
      ;; invisible here anyway.
      (assq-delete-all 'which-func-mode mode-line-misc-info))


;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; tramp, for sudo access
(require 'tramp)
;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")

;; line numbering with linum (WTF it's not activated by defaults?!)
(global-linum-mode 1)
(setq linum-disabled-modes-list '(mu4e-headers-mode))
(defun linum-on ()
  (unless (or (minibufferp) (member major-mode linum-disabled-modes-list))
    (linum-mode 1)))
;; disable linum for speedbar
(add-hook 'speedbar-mode-hook  '(lambda () (linum-mode 0)))

(require 'diff-hl)
(global-diff-hl-mode 1)
;; ido mode per il completamento dei file e dir
(ido-mode 1)
(ido-everywhere 1)
;; flx mode .. like sublimeText cmd-T
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
;; preferisco il vertical !
(ido-vertical-mode t)

(require 'workgroups2)
;; autoload/autosave:
;; if you start Emacs as "emacs --daemon" - turn off autoloading of workgroups:
(setq wg-use-default-session-file t)

;; utf-8 powaa!!
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-input-method nil)


(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; salvo in automatico quello che avevo aperto, cosi' al prossimo riavvio
;; ho di nuovo tutto quello che mi serve
;; activate desktop save mode and load a saved desktop if it exists


;; uniquify buffer names
(require 'uniquify) ; bundled with GNU emacs 23.2.1 or before. On in 24.4
(setq uniquify-buffer-name-style 'post-forward-angle-brackets) ; emacs 24.4 style ⁖ cat.png<dirName>

;; save/restore opened files and windows config
(desktop-save-mode +1) ; 0 for off

;; (require 'desktop)
;; ;; Automatically save and restore sessions
;; (setq desktop-dirname             user-emacs-directory
;;       desktop-base-file-name      ".emacs.desktop"
;;       desktop-base-lock-name      "lock"
;;       desktop-path                (list desktop-dirname)
;;       desktop-save                t
;;       desktop-files-not-to-save   "^$" ;reload tramp paths
;;       desktop-load-locked-desktop nil)
;; (desktop-save-mode +1)
(desktop-read)

;; salviamo la posizione del cursore quando chiudo un buffer
;; in modo da ripristinarla
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "saveplace"))

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; quando ho un testo selezionato, questo viene sovrascritto da quello che scrivo :D
(delete-selection-mode t)
;; cursore lampeggiante
(blink-cursor-mode t)
;; evidenziamo le parentesi
(show-paren-mode t)

;; http://20seven.org/journal/2008/11/02/distraction-free-programming-with-gnu-emacs/
;; full screen toggle using command+[RET]
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))

;; How to copy from one dired dir to the next dired dir shown in a split window?
(setq dired-dwim-target t)

(when (require 'multi-term nil t)
  (global-set-key (kbd "<f5>") 'multi-term)
  (global-set-key (kbd "<C-next>") 'multi-term-next)
  (global-set-key (kbd "<C-prior>") 'multi-term-prev)
  (setq multi-term-buffer-name "term"
        multi-term-program "/bin/zsh"))


;; visual-regexp
(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)

;; rimuoviamo gli spazi vuoti prima di salvare
(add-hook 'before-save-hook 'whitespace-cleanup)

;; shorter aliases for ack-and-a-half commands
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; undoooo
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】

;; EDITOR
(global-auto-revert-mode 1)

;; Highlight Comment Annotations
;;http://emacsredux.com/blog/2013/07/24/highlight-comment-annotations/
(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.

This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'font-lock-comment-annotations)


;; auto indentamento
;; (electric-indent-mode t)

;; linea di identazione
(require 'indent-guide)
(setq-default indent-guide-mode t)
(indent-guide-global-mode)

(require 'smartparens-config)
(smartparens-global-mode)
(show-smartparens-global-mode t)

;; change color of bracket, curly
;; (require 'parenface)
;; (eval-after-load 'parenface
;;   (progn
;;     (set-face-foreground 'parenface-paren-face "dark gray")
;;     (set-face-foreground 'parenface-bracket-face "gray")
;;     (set-face-foreground 'parenface-curly-face "gray")))

;; (add-hook 'lisp-mode-hook 'paren-face-add-keyword)
;; ;; (add-hook 'js2-mode-hook 'paren-face-add-keyword)
;; ;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; (add-hook 'emacs-lisp-mode-hook 'paren-face-add-keyword)


;; ASPELL !!!
;; $ sudo port -v selfupdate
;; $ sudo port install aspell-dict-en
(setq ispell-program-name "/opt/local/bin/aspell")
;; correttore ortografico
(require 'flyspell)
(flyspell-mode 1)
(setq flyspell-issue-message-flg nil)
(add-hook 'enh-ruby-mode-hook
          (lambda () (flyspell-prog-mode)))

(add-hook 'web-mode-hook
          (lambda () (flyspell-prog-mode)))

;; EDITOR : WEB
(flycheck-color-mode-line-mode 1)

;; CSHARP
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
  (setq auto-mode-alist
     (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(setq whitespace-line-column 119) ;; limit line length

(require 'rainbow-mode)
;; colorize hexa color in css
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'mmm-mode-hook 'rainbow-mode)
(add-hook 'web-mode-hook 'rainbow-mode)



(require 'rlaszlo-mode (concat user-emacs-directory "rlaszlo-mode.el"))
;; ;; use rslaszlo-mode to rlzx file
(add-to-list 'auto-mode-alist '("\\.rlzx" . rlaszlo-mode))


(require 'smartparens-ruby)
(sp-with-modes '(rhtml-mode)
         (sp-local-pair "<" ">")
         (sp-local-pair "<%" "%>"))



;; OPENLASZLO
(setq auto-mode-alist
      (cons '("\\.\\(lzx\\|dbk\\|xml\\|xsl\\|xslt\\|rng\\)\\'" . nxml-mode)
            auto-mode-alist))

;; personl Openlaszlo
(require 'lzx (concat user-emacs-directory "lzx.el"))

;; org-mode
;; HACK: http://nickhigham.wordpress.com/2013/07/05/emacs-org-mode-version-8/
;;
;; fix org-mode 8:
;; start emacs without custom (emacs -Q)
;; delete org (rm -rf ~/.emacs.d/elpa/org-TAB)
;; M-x package-install org

;; Include the latex-exporter
(require 'ox-latex)
;; Add minted to the defaults packages to include when exporting.
(add-to-list 'org-latex-packages-alist '("" "minted"))
;; Tell the latex export to use the minted package for source
;; code coloration.
(setq org-latex-listings 't)
(setq org-latex-listings 'minted)

;; #+LATEX_HEADER: \input{ABSOLUTEPATH\lib.tex}

;; Let the exporter use the -shell-escape option to let latex
;; execute external programs.
;; This obviously and can be dangerous to activate!
(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; org-mode syntax color for code block :D
(setq org-src-fontify-natively t)

;; EX zencode... C-j per attivare la preview del autocompletamento
;;(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.

;; (eval-after-load 'auto-complete
;;   '(add-to-list 'ac-modes 'inf-ruby-mode))
;; (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)

;; If use bundled typescript.el,

;; first install : nodejs npm nodejs-legacy
;; npm packages: typescript typescript-tools

(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tss)

;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
(tss-config-default)

;; JS-mode !!!!
(require 'flycheck)
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))
(add-hook 'js2-mode-hook
          (lambda () (flycheck-mode t)))

(require 'js-doc)
;; javascript => http://melpa.milkbox.net/#/js2-refactor
(require 'js2-refactor)
(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 )
(setq js-basic-indent 2)
(setq-default js2-basic-indent 2)

(setq-default js2-basic-offset 2)
(setq-default js2-auto-indent-p t)
(setq-default js2-cleanup-whitespace t)
(setq-default js2-enter-indents-newline t)
(setq-default js2-global-externs "jQuery $")
(setq-default js2-indent-on-enter-key t)
(setq-default js2-mode-indent-ignore-first-tab t)

(setq-default js2-global-externs '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))

;; We'll let fly do the error parsing...
(setq-default js2-show-parse-errors nil)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(font-lock-add-keywords
 'js2-mode `(("\\(function *\\)("
             (0 (progn (compose-region (match-beginning 1) (match-end 1) "ƒ")
                       nil)))))

(font-lock-add-keywords 'js2-mode
                        '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
                           1 font-lock-warning-face t)))

(add-hook 'js2-mode-hook 'color-identifiers-mode)

;; set global color enable
;; (require 'color-identifiers-mode)
;; (setq color-identifiers-mode t)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tt2\\'" . web-mode))
(add-to-list 'auto-mode-alist
'("/\\(views\\|html\\|theme\\|templates\\)/.*\\.php\\'" . web-mode))

(set-face-attribute 'web-mode-html-attr-engine-face nil  :foreground "light sea green")
;; (setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
;; (setq web-mode-enable-block-face t)
(setq web-mode-enable-part-face t)
(setq web-mode-enable-comment-keywords t)

(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-indent-style 4)


;; RUBY
;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.podspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . ruby-mode))

;; PYTHON

(elpy-enable)
;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)
(setq elpy-rpc-backend "jedi")

(workgroups-mode 1)
