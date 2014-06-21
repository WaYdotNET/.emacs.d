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

(load "server")
(unless (server-running-p) (server-start))

;; my name :D
(setq user-full-name "Carlo Bertini [WaYdotNET]"
      user-mail-address (concat "waydotnet@" "gmail" ".com")
      )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "6fe6ab4abe97a4f13533e47ae59fbba7f2919583f9162b440dd06707b01f7794" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "025354235e98db5e7fd9c1a74622ff53ad31b7bde537d290ff68d85665213d85" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" "b1471d88b39cad028bd621ae7ae1e8e3e3fca2c973f0dfe3fd6658c194a542ff" "5ceb2e85215142caad4c2abc1061c0bade80348c4eb323934a909e36f864d5bc" "c2cfe2f1440d9ef4bfd3ef4cf15bfe35ff40e6d431264b1e24af64f145cffb11" "cd70962b469931807533f5ab78293e901253f5eeb133a46c2965359f23bfb2ea" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
