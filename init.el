;; my personal emacs environment
;; load packages system !
(load (concat user-emacs-directory "packages-loader.el"))

;; after load packages.... load customization
(add-hook 'after-init-hook '(lambda ()
                              ;; loader custom function
                              (load (concat user-emacs-directory "function.el"))
                              ;; loader custom key-bindings
                              (load (concat user-emacs-directory "binding.el"))
                              ;; loader custom UI
                              (load (concat user-emacs-directory "user-interface.el"))
                              ))

;; my name :D
(setq user-full-name "Carlo Bertini [WaYdotNET]"
      user-mail-address (concat "waydotnet@" "gmail" ".com")
      )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("cd70962b469931807533f5ab78293e901253f5eeb133a46c2965359f23bfb2ea" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
