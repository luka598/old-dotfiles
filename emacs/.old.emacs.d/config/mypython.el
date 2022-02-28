(require 'lsp-mode)
(require 'lsp-pyright)

;; Python mode settings
(add-hook 'python-mode-hook
	'(lambda ()
		(lsp)
		(yas-minor-mode)
		(ispell-minor-mode)
		(use-tabs)
		(linum-mode))
	)
