;; Most of code snippets taken from:
;; https://gist.github.com/CodyReichert/9dbc8bd2a104780b64891d8736682cea

(require 'web-mode)
(require 'flycheck)
(require 'add-node-modules-path)
(require 'prettier-js)
(require 'emmet-mode)

;;;;; Set up web-mode
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
(add-to-list 'auto-mode-alist '("\\.tsx?$" . web-mode))

(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
(setq web-mode-content-types-alist '(("jsx" . "\\.ts[x]?\\'")))

(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 1))
  
(add-hook 'web-mode-hook  'web-mode-init-hook)

;;;; Live eslint errors

;; (setq-default flycheck-disabled-checkers
;;               (append flycheck-disabled-checkers
;;                       '(javascript-jshint json-jsonlist)))

;; Enable eslint checker for web-mode
;;(flycheck-add-mode 'javascript-eslint 'web-mode)
;; Enable flycheck globally
;; (add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'flycheck-mode-hook 'add-node-modules-path)

;;;; preattier-js

;;(add-hook 'web-mode-hook 'prettier-js-mode)

;; (defun enable-minor-mode (my-pair)
;;   "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
;;   (if (buffer-file-name)
;;       (if (string-match (car my-pair) buffer-file-name)
;;       (funcall (cdr my-pair)))))

;; (eval-after-load 'web-mode
;;     '(progn
;;        (add-hook 'web-mode-hook #'add-node-modules-path)
;;        (add-hook 'web-mode-hook #'prettier-js-mode)))

;; (add-hook 'web-mode-hook #'(lambda ()
;;                             (enable-minor-mode
;;                              '("\\.js[x]?\\'" . prettier-js-mode))))

;; (add-hook 'web-mode-hook #'(lambda ()
;;                             (enable-minor-mode
;;                              '("\\.ts[x]?\\'" . prettier-js-mode))))

;;;; Emmet mode

(add-hook 'web-mode-hook  'emmet-mode)
