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
(require 'highlight-indent-guides)

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

(defun set-font-size (font-size)
  "Sets config to use tabs"
  (interactive)
  (set-face-attribute 'default nil
                    :family "Ubuntu Mono"
                    :height (* font-size 10)
                    :Weight 'normal
                    :width 'normal)
  )

;; Commands
;;; Ido
(ido-mode 1) ;; Command auto-complete
;;; Smex - mod key auto-complete
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Smooth scrolling - make window follow cursor or something like that
(smooth-scrolling-mode 1)
(pwd)

;; Enable treemacs at start
(treemacs)

;; Change auto-save default directory
;; (setq backup-directory-alist
;;       `((".*" . "~/.saves")))
;; (setq auto-save-file-name-transforms
;;       `((".*" "~/.saves" t)))
										;
;; Disable auto-save and backup
;; Disable backup
(setq backup-inhibited t)
;; Disable auto save
(setq auto-save-default nil)
;; Prevents creation of lockfiles
(setq create-lockfiles nil)

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

;; Indent guides | Doesn't work in terminal
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'fill)

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
;; TODO: Find out what this does
(setq company-dabbrev-downcase 0)
;; Autocomplete on backtab (shitf + tab)
(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas-minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(global-set-key [backtab] 'company-complete-common)

;; Load my python configuration
(load "mypython.el")
;;(require 'mypython)

;; Load my c config
(load "myc.el")

;; Load my svelte config
(load "mysvelte.el")

;; Load my jsx config
(load "myjsx.el")

;; Load my vue config
(load "myvue.el")

;; EOF
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-origami origami evil evil-tutor god-mode highlight-indent-guides react-snippets flycheck prettier-js add-node-modules-path undo-tree lsp-tailwindcss yasnippet svelte-mode ac-emmet company-math emmet-mode ac-html 2048-game web-beautify web-mode auto-complete treemacs smooth-scrolling smex lsp-pyright gruvbox-theme company-web company-fuzzy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
