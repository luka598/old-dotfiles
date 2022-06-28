nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" --- COC commands
"  :CocInstall coc-python
"  :CocInstall coc-clangd
"  :CocInstall coc-snippets

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
