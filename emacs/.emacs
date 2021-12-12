(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Requirements
(require 'gruvbox-theme)
(require 'smex)
(require 'company)
(require 'lsp-mode)
(require 'lsp-pyright)

;; Style
(setq inhibit-startup-screen t) ;; Remove start screen
(menu-bar-mode 0) ;; Remove menu bar
(tool-bar-mode 0) ;; Remove tool bar
(set-default-font "Ubuntu Mono-18") ;; Change font
(load-theme 'gruvbox-dark-hard t) ;; Load theme

;; Commands
;;; Ido
(ido-mode 1) ;; Command autocomplete
;;; Smex - mod key autocomplete
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; File saving
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
