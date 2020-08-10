if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'kien/rainbow_parentheses.vim'

":CocInstall coc-json coc-markdownlint coc-python coc-rust-analylzer coc-sql
"coc-tsserver coc-vetur coc-yaml
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'

Plug 'ayu-theme/ayu-vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'jiangmiao/auto-pairs'

call plug#end()

set termguicolors
let ayucolor='mirage'
colorscheme ayu

let NERDTreeShowHidden=1

" Set tab with depending on file type
autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType vue setlocal shiftwidth=2 softtabstop=2 expandtab

" Custom Keymaps
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFocus<CR>

nmap <C-p> :sp<CR>:terminal<CR><C-W>J 10<C-W>_
nmap <C-q> :q<CR>
nmap <C-s> :w<CR>
nmap <M-Right> <C-W><Right>
nmap <M-Left> <C-W><Left>
nmap <M-Down> <C-W><Down>
nmap <M-Up> <C-W><Up>

tnoremap <Esc> <C-\><C-n>

set number

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Show tabs
set list
set listchars=tab:>-,trail:.

" coc configs

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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <F12> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
