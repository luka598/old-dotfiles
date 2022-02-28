(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))

(add-hook 'web-mode-hook  '(lambda ()
							 (lsp)
							 (yas-minor-mode)
							 (linum-mode)
							 (emmet-mode)
							 (setq-default indent-tabs-mode nil)))
