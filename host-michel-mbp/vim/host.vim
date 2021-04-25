" Mac OS copy/paste
vnoremap <silent><leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>

" Use light background.
set background=dark   " for solarized dark
"set background=light   " for solarized light
