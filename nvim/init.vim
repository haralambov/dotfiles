" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

Plug 'tpope/vim-surround'

Plug 'hoob3rt/lualine.nvim'
Plug 'romainl/vim-cool'

" Initialize plugin system
call plug#end()

let mapleader=" "
inoremap jj <Esc>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>
set mouse=a

let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeWinSize=40
let NERDTreeMinimalUI=1

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff && s:is_coc_action == 0
        NERDTreeFind
        wincmd p
    endif
    let s:is_coc_action=0
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

let s:is_coc_action=0

" Sets a custom flag, later on used by the SyncTree
" so that wincmd doesn't mess up the whole screen
" when entering a new buffer due to CoC actions
function! CoCAction(actionName)
    let s:is_coc_action=1
    call CocActionAsync(a:actionName)
endfunction

" GoTo code navigation.
nmap <silent> gd :call CoCAction("jumpDefinition")<CR>
nmap <silent> gy :call CoCAction("jumpTypeDefinition")<CR>
nmap <silent> gi :call CoCAction("jumpImplementation")<CR>
nmap <silent> gr :call CoCAction("jumpReferences")<CR>

" Highlights the current cursor word after updatetime period
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for applying codeAction to the current buffer.
nmap <leader>a  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)
" Ctrl + P to show signature help
inoremap <C-P> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)
nnoremap <leader>fm :call CocAction('format')<CR>

let g:coc_snippet_next = '<tab>'

" coc plugins config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-rls',
  \ 'coc-rust-analyzer'
  \ ]

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let NERDTreeShowHidden=1
nnoremap <C-n> :NERDTreeToggle<CR><C-w>l
vmap <C-_> <Plug>NERDCommenterToggle
" comment and go to the next line (mind the J at the end)
nmap <C-_> <Plug>NERDCommenterTogglej 

lua << EOF
require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = {'', ''},
        section_separators = {'', ''},
        disabled_filetypes = {}
        },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
        },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
        },
    tabline = {},
    extensions = {}
    }
EOF

" open a terminal in a new tab
nnoremap <leader>T :tabnew<CR>:terminal<CR>a
nnoremap <leader>t :15sp<CR>:terminal<CR>a
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" save all files
nnoremap <leader>s :wa<CR>

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_light='hard'

set number
set relativenumber

set cursorline
set colorcolumn=80
highlight ColorColumn ctermbg=238

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set path+=**
set noerrorbells
set hidden
set nowrap
set smartcase
set ignorecase
set incsearch
" set nohlsearch
set noswapfile
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set scrolloff=5
set list
set splitbelow
set splitright
set clipboard=unnamedplus
set signcolumn=yes
set spell

" Use alt + hjkl to resize windows
nnoremap <A-j>    :resize -2<CR>
nnoremap <A-k>    :resize +2<CR>
nnoremap <A-l>    :vertical resize -2<CR>
nnoremap <A-h>    :vertical resize +2<CR>

" Use Ctrl + H/J/K/L to change windows
nnoremap <C-h>    <C-w><C-h>
nnoremap <C-j>    <C-w><C-j>
nnoremap <C-k>    <C-w><C-k>
nnoremap <C-l>    <C-w><C-l>

nnoremap <C-e>    3<C-e>
nnoremap <C-y>    3<C-y>

" backspace - cycle between current and most recent file
nnoremap <BS> <C-^>

nnoremap <leader>h :noh<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar

au! BufWritePost $MYVIMRC source % " automatically loads the config on write
