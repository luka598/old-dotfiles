(add-to-list 'auto-mode-alist '("\\.svelte$" . web-mode))
  
(add-hook 'web-mode-hook  '(lambda ()
							 (lsp)
							 (yas-minor-mode)
							 (linum-mode)
							 (emmet-mode)
							 ))
