" ============================
" Instant Markdown Settings
" ============================
" The following settings are recommended for a more secure and controlled
" experience with the Instant Markdown plugin. Adjust them according to your
" needs. 
let g:instant_markdown_slow = 1
" Disable auto-starting the preview when opening a markdown file
let g:instant_markdown_autostart = 0
" Disable opening the preview to the world (only accessible from localhost)
let g:instant_markdown_open_to_the_world = 0
" Disable allowing unsafe content in the preview
let g:instant_markdown_allow_unsafe_content = 0
" Set the port for the preview server (default is 8090)
let g:instant_markdown_port = 8090

" ============================
" Key Mappings
" ============================
nnoremap <leader>mi :InstantMarkdownPreview<CR>
nnoremap <leader>mx :InstantMarkdownStop<CR>

" Preview markdown file with glow
nnoremap <F9> :!glow %<CR>
