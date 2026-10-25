" ============================
" Termux-Specific Settings
" ============================

" Clipboard integration with Termux
set clipboard^=unnamed,unnamedplus

" Auto-copy to Termux clipboard on yank
augroup TermuxClipboard
    autocmd!
    autocmd TextYankPost * call jobstart(['termux-clipboard-set', @"])
augroup END

" Auto-sync clipboard when returning to Neovim
augroup TermuxPaste
    autocmd!
    autocmd FocusGained * call jobstart(['termux-clipboard-get'], {'on_stdout': {j,d,e -> setreg('"', join(d))}})
augroup END

" Clipboard mappings for Termux
vnoremap <C-x> :!termux-clipboard-set<CR>
vnoremap <C-c> :!termux-clipboard-set<CR>
inoremap <C-v> <ESC>:read !termux-clipboard-get<CR>i
nnoremap <leader>v :read !termux-clipboard-get<CR>

" Termux storage permissions reminder
if !isdirectory(expand('~/storage'))
    echohl WarningMsg
    echo 'Termux: Run "termux-setup-storage" to access device storage'
    echohl None
endif

" Termux-specific backup directory
set backupdir=~/.local/share/nvim/backup-termux//
if !isdirectory(expand('~/.local/share/nvim/backup-termux'))
    call mkdir(expand('~/.local/share/nvim/backup-termux'), 'p')
endif

" Reduce key timeout for better Android keyboard response
set ttimeoutlen=50

" Termux file access warning
if !executable('termux-clipboard-set')
    echohl ErrorMsg
    echo 'Termux: termux-clipboard-set not found! Install: pkg install termux-api'
    echohl None
endif
