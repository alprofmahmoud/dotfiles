" ============================
" Copilot Settings
" ============================
let g:copilot_no_tab_map = v:true
let g:copilot_enabled = 0

let g:copilot_filetypes = {
    \ 'python': v:true,
    \ 'javascript': v:true,
    \ 'lua': v:true,
    \ 'vim': v:true,
    \ 'sh': v:true,
    \ 'markdown': v:false,
    \ }

" ============================
" Codeium Settings
" ============================
let g:codeium_no_map_tab = v:true
let g:codeium_enabled = v:true

" ============================
" Toggle Functions
" ============================
function! EnableCopilot()
    let g:codeium_enabled = v:false
    Copilot enable
    let g:copilot_enabled = 1
    echo 'Copilot enabled'
endfunction

function! EnableCodeium()
    Copilot disable
    let g:copilot_enabled = 0
    let g:codeium_enabled = v:true
    echo 'Codeium enabled'
endfunction

function! DisableAI()
    Copilot disable
    let g:copilot_enabled = 0
    let g:codeium_enabled = v:false
    echo 'AI completion disabled'
endfunction

nnoremap <leader>cp :call EnableCopilot()<CR>
nnoremap <leader>cd :call EnableCodeium()<CR>
nnoremap <leader>cx :call DisableAI()<CR>

" ============================
" Key Mappings (shared)
" ============================
" Accept suggestion
imap <C-g> <Plug>(copilot-accept-line)
" Accept one word
imap <C-f> <Plug>(copilot-accept-word)
" Next suggestion
imap <M-]> <Plug>(copilot-next)
" Previous suggestion
imap <M-[> <Plug>(copilot-previous)
" Dismiss suggestion
imap <M-x> <Plug>(copilot-dismiss)

" Codeium accept
" imap <C-y> <Cmd>call codeium#Accept()<CR>
imap <script><silent><nowait><expr> <C-e> codeium#Accept()
