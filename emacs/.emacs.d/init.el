;; Add config directory to loadpath
(add-to-list 'load-path "~/.emacs.d/config")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;(when (not package-archive-contents) (package-refresh-contents)) ;; Refresh package list

;; Requirements
(require 'gruvbox-theme)
(require 'smex)
(require 'company)
(require 'smooth-scrolling)
(require 'treemacs)

;; Style
(setq inhibit-startup-screen t) ;; Remove start screen
(menu-bar-mode 0) ;; Remove menu bar
(tool-bar-mode 0) ;; Remove tool bar
(load-theme 'gruvbox-dark-hard t) ;; Load theme

;; Font
(set-face-attribute 'default nil
                    :family "Ubuntu Mono"
                    :height '120
                    :weight 'normal
                    :width 'normal)
;; Commands
;;; Ido
(ido-mode 1) ;; Command auto-complete
;;; Smex - mod key auto-complete
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Smooth scroling - make window folow cursor or something like that
(smooth-scrolling-mode 1)
(pwd)

;; Enable treemacs at start
(treemacs)

;; File saving
;;(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;; Tabs
(setq-default
  indent-tabs-mode t
  tab-width 4
  tab-stop-list (quote (4))
  )

(defun use-tabs ()
  "Sets config to use tabs"
  (interactive)
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t
		tab-width 4
		tab-stop-list (quote (4))
		python-indent 4)
  )

;; Delete marked text when you press a key
(delete-selection-mode t)

;; Reload init.el
(defun reload-init-file ()
  "Reloads init file"
  (interactive)
  (load-file user-init-file)
  )

;; After change major mode hook
(add-hook 'after-change-major-mode-hook
		  '(lambda ()
			 ;; (message "Changed major mode")
			 ;; (use-tabs)
			 (electric-pair-mode)
			 (show-paren-mode)
			 )
		  )

;; Company mode config
(global-company-mode)
;;; No delay in showing suggestions
(setq company-idle-delay 0)
;;; Show suggestions after entering one character
(setq company-minimum-prefix-length 1)
;;; Wrap cursor around suggestions
(setq company-selection-wrap-around t)
;;; Use tab key to cycle through suggestions
;; (company-tng-configure-default)

;; Load my python configuration
(load "mypython.el")
;;(require 'mypython)

;; Load my c config
(load "myc.el")

;; EOF
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-tailwindcss yasnippet svelte-mode ac-emmet company-math emmet-mode ac-html 2048-game web-beautify web-mode auto-complete treemacs smooth-scrolling smex lsp-pyright gruvbox-theme company-web company-fuzzy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
