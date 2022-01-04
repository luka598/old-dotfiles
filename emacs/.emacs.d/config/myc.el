(require 'lsp-mode)

(add-hook 'c-mode-hook
		  (lambda ()
			(lsp)
			(yas-minior-mode)
			(use-tabs)
			(linum-mode)
			)
)
