;; my personal emacs environment
;; load packages system !
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))
(desktop-save-mode 1)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; use-package only when not compile
(eval-when-compile
  (require 'use-package))

;; Typing `yes' all the time is a pain
(fset 'yes-or-no-p 'y-or-n-p)

;; my name :D
(setq user-full-name "Carlo Bertini [WaYdotNET]"
      user-mail-address (concat "waydotnet@" "gmail" ".com"))

;; rimuoviamo gli spazi vuoti prima di salvare
(add-hook 'before-save-hook 'whitespace-cleanup)

;; utf-8 powaa!!
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-input-method nil)

;; theme
(use-package zenburn-theme
  :config
  (progn
    (load-theme 'zenburn t))
  :ensure t)

;; show column number in mode-line
(setq column-number-mode t)
;; flat !
(set-face-attribute 'header-line nil :box nil)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(set-frame-font "Source Code Pro-11")

(use-package smex
  :config
  (smex-initialize)
  :ensure t)

(use-package find-temp-file :ensure t)

;; fun :D
(use-package nyan-mode :ensure
  :config
  (nyan-mode))

(use-package highlight-indentation
  :config
  (global-hl-line-mode +1)
  :ensure t)


(use-package magit
  :bind ("C-x g" . magit-status))

;; (use-package git-gutter+
;;   :config
;;   (global-git-gutter+-mode) :ensure t)

(global-linum-mode 1)

;; quando ho un testo selezionato, questo viene sovrascritto da quello che scrivo :D
(delete-selection-mode t)
;; cursore lampeggiante
(blink-cursor-mode t)
;; evidenziamo le parentesi
(show-paren-mode t)


;; disabilito la acapo automatico
(global-visual-line-mode t)
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

(use-package visual-regexp
  :bind (
	 ("C-c r" . vr/replace)
	 ("C-c q" . vr/query-replace)
	 )
  :ensure t)

(use-package full-ack
  :config (progn
	    ;; shorter aliases for ack-and-a-half commands
	    (defalias 'ack 'ack-and-a-half)
	    (defalias 'ack-same 'ack-and-a-half-same)
	    (defalias 'ack-find-file 'ack-and-a-half-find-file)
	    (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same))
  :ensure t)

(use-package diff-hl
  :config
  (global-diff-hl-mode 1)
  :ensure t)
;; (use-package ido-vertical-mode :ensure t)
;; (use-package ido
;;   :config
;;   (
;;    ;; ido mode per il completamento dei file e dir
;;    ;;(ido-mode 1)
;;    (ido-everywhere 1)
;;    ;; flx mode .. like sublimeText cmd-T
;;    (flx-ido-mode 1)
;;    ;; disable ido faces to see flx highlights.
;;    (setq ido-use-faces nil)
;;    ;; preferisco il vertical !
;;    (ido-vertical-mode t))
;;   :ensure t)
(use-package ido
  :init (ido-mode 'both)
  :config
  (progn
    (setq ido-default-buffer-method 'selected-window)
    (setq ido-default-file-method 'selected-window)
    (setq ido-enable-flex-matching t)
    (setq ido-max-directory-size 100000)
    (setq ido-save-directory-list-file "~/.emacs.d/.ido.last")

    (use-package ido-ubiquitous
      :init (ido-ubiquitous-mode 1) :ensure t)

    (use-package ido-vertical-mode
      :init (ido-vertical-mode 1) :ensure t)

    (use-package idomenu
      :bind ("C-x C-i" . idomenu)) :ensure t)
  :ensure t)

(use-package flx
  :commands flx
  :config (progn
	    ;; flx mode .. like sublimeText cmd-T
	    (flx-ido-mode 1))
  :ensure flx-ido)


(use-package indent-guide
  :config
  (progn
    (setq-default indent-guide-mode t)
    (indent-guide-global-mode)
    )
  :ensure t
  )

(use-package undo-tree
  :config
  (progn
    (global-undo-tree-mode 1)
    (defalias 'redo 'undo-tree-redo)
    )
  :bind ("C-z" . undo); 【Ctrl+z】
  :ensure t)

(use-package flycheck
  :config
  (progn
    (add-hook 'js-mode-hook
	      (lambda () (flycheck-mode t)))
    (add-hook 'js2-mode-hook
	      (lambda () (flycheck-mode t))))
  :ensure t)

(use-package color-identifiers-mode
  :ensure t)

(use-package js2-mode
  :config
  (progn
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
    (font-lock-add-keywords
     'js2-mode `(("\\(function *\\)("
		  (0 (progn (compose-region (match-beginning 1) (match-end 1) "ƒ")
			    nil)))))

    (font-lock-add-keywords 'js2-mode
			    '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
			       1 font-lock-warning-face t)))
    ;; We'll let fly do the error parsing...
    (setq-default js2-show-parse-errors nil))
  :mode "\\.js\\'"
  :ensure t)

(use-package flyspell
  :commands flyspell
  :init (progn
	  ;; ASPELL !!!
	  ;; $ sudo port -v selfupdate
	  ;; $ sudo port install aspell-dict-en
	  (setq ispell-program-name "/opt/local/bin/aspell"))
  :config
  (progn
    (flyspell-mode 1)
    (setq flyspell-issue-message-flg nil)
    (add-hook 'enh-ruby-mode-hook
	      (lambda () (flyspell-prog-mode)))
    (add-hook 'web-mode-hook
	      (lambda () (flyspell-prog-mode)))
    ;; EDITOR : WEB
    (flycheck-color-mode-line-mode 1))
  :ensure flycheck-color-mode-line)


(use-package rainbow-mode
  :config
  (progn
    ;; colorize hexa color in css
    (add-hook 'css-mode-hook 'rainbow-mode)
    (add-hook 'html-mode-hook 'rainbow-mode)
    (add-hook 'mmm-mode-hook 'rainbow-mode)
    (add-hook 'web-mode-hook 'rainbow-mode))
  :ensure t)

(use-package web-mode
  :config
  (progn
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
    )
  :ensure t)

  ;; enable Projectile globally
  (use-package projectile
    :config
    (projectile-global-mode)
    :ensure t)

  (use-package yasnippet :ensure t)

  ;; company mode!
  (use-package company
    :config
    (add-hook 'after-init-hook 'global-company-mode)
    :ensure t)



  ;; python
  (use-package company-jedi
    :ensure t)
  (use-package jedi-direx
    :ensure t)
  (use-package anaconda-mode
    :ensure t)

  (use-package python
    :commands jedi:setup
    :config
    (progn
      (add-hook 'python-mode-hook 'jedi:setup)
      (add-hook 'jedi-mode-hook 'jedi-direx:setup)
      (add-hook 'python-mode-hook 'anaconda-mode)
      (add-hook 'prog-mode-hook '(lambda ()
				   (yas-minor-mode)))
      (setq jedi:setup-keys t)
      (setq jedi:complete-on-dot t))
    :bind ("C-c x" . jedi-direx:pop-to-buffer)
    )

  (use-package pony-mode :ensure t)


(load (concat user-emacs-directory "function.el"))
(load (concat user-emacs-directory "binding.el"))
