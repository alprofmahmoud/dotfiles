" ============================
" Markdown Preview Settings
" ============================

" Auto-close preview when switching buffer
let g:mkdp_auto_close = 1

" Open preview in new tab
let g:mkdp_open_to_the_world = 0

" Use default browser
let g:mkdp_browser = ''

" Preview server port
let g:mkdp_port = '8080'

" Page title
let g:mkdp_page_title = '「${name}」'

" Sync scroll
let g:mkdp_preview_options = {
    \ 'sync_scroll_type': 'middle',
    \ 'disable_sync_scroll': 0,
    \ }

" ============================
" Vim Markdown Settings
" ============================
" Disable auto-folding sections
let g:vim_markdown_folding_disabled = 1

" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1

" ============================
" IndentLine Settings
" ============================
let g:indentLine_setConceal = 0

" ============================
" Key Mappings
" ============================
nnoremap <leader>mp :MarkdownPreview<CR>
nnoremap <leader>ms :MarkdownPreviewStop<CR>
nnoremap <leader>mt :MarkdownPreviewToggle<CR>

" ============================
" Markdown File Settings
" ============================
augroup MarkdownSettings
    autocmd!
    " Set textwidth for markdown files
    autocmd FileType markdown setlocal textwidth=80
    
    " Wrap lines in markdown
    autocmd FileType markdown setlocal wrap

    " Disable concealing to show raw markdown syntax
    autocmd FileType markdown setlocal conceallevel=0
augroup END
