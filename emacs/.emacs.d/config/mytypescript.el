;; Web mode for jsx files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 4))
  
(add-hook 'web-mode-hook  'web-mode-init-hook)

;; Flycheck with eslint
(require 'flycheck)
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))

(require 'add-node-modules-path)
;; Enable eslint checker for web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; Enable flycheck on web mode
(add-hook 'web-mode #'global-flycheck-mode)

(add-hook 'flycheck-mode-hook 'add-node-modules-path)

;; Prettier.js automatic formatting
(require 'prettier-js)
(defun web-mode-init-prettier-hook ()
  (add-node-modules-path)
  (prettier-js-mode))

(add-hook 'web-mode-hook  'web-mode-init-prettier-hook)

;; Emmet mode for tag expansion
(require 'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

;; LSP
(add-hook 'web-mode-hook '(lambda () "" (interactive) (lsp)))
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil)
