;; packages system loader:
;; check if packages is installed or not.. and install it if it's missing


(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" .  "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; list packages
(load (concat user-emacs-directory "packages.el"))

;; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  ;; TODO: remove elpa-to-submit once everything's submitted.
  (byte-recompile-directory user-emacs-directory 0)
  (message "%s" "recompile...done!")
  )
;; if not all packages are installed, check one by one and install the mssing ones.
(unless (packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p)))
  ;;(recompile-init)
  )
