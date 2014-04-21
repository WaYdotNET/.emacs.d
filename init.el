;; my personal emacs environment
;;

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

