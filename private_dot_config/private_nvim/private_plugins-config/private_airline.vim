" ============================
" Airline Configuration
" ============================

" ============================
" Basic Settings
" ============================
" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Hide default mode indicator (airline shows it)
let g:airline_detect_modified = 1

" Enable tabline
let g:airline#extensions#tabline#enabled = 1

" Don't show buffers in tabline
let g:airline#extensions#tabline#show_buffers = 0

" Disable whitespace extension
let g:airline#extensions#whitespace#enabled = 0

" Performance
let g:airline_highlighting_cache = 1
let g:airline_skip_empty_sections = 1

" ============================
" Tabline Settings
" ============================
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ============================
" Extensions
" ============================
" Git
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" ALE
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '✘:'
let g:airline#extensions#ale#warning_symbol = '⚠:'

" nvim-tree
let g:airline#extensions#nvimtree#enabled = 1

" ============================
" Sections
" ============================
" Filename + modified + git branch
let g:airline_section_c = '%t %m'

" File type icon + name
let g:airline_section_x = '%{&filetype}'
" File encoding
let g:airline_section_y = '%{&fileencoding} %{&fileformat}'

" Line/Column/Percentage
let g:airline_section_z = '%l/%L :%v %p%%'

" ============================
" Theme
" ============================
let g:airline_theme = 'base16_solarized'

" ============================
" Symbols
" ============================
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ' '
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ' '
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty = ' ●'
