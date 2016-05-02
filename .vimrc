set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'kien/ctrlp.vim'
Plugin 'whatyouhide/vim-gotham'
Plugin 'vim-scripts/colorsupport.vim'
Plugin 'morhetz/gruvbox'
Plugin 'sheerun/vim-polyglot'
Plugin 'powerline/powerline'
Plugin 'rking/ag.vim'

call vundle#end()


syntax on
filetype plugin on
filetype plugin indent on

set t_Co=256
set clipboard+=unnamed "yank and copy to X clipboard
set encoding=utf-8

let mapleader=" "
map <leader>e :Explore<cr>
let g:netrw_liststyle=3

"Syntax:
let g:gruvbox_italic=0
"colorscheme gruvbox
colorscheme gotham
"colorscheme shobogenzo
"colorscheme badwolf

"Searching:
set hlsearch "highlight search
set ignorecase
set smartcase
set showmatch "show matching brackets

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"Russian keyboard (Ctrl-^ to switch layouts in insert mode)
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"Foldings:

"Save foldings upon exit" 
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"Toggle foldings by F9 and create in visual mode
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

:nnoremap <F4> :buffers<CR>:buffer<Space>

"Line numbering
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE

"Encoding order
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

"Number of scrolled pages
set scrolloff=3

"Status Line
set statusline=%t\ %y%m%r[%{&fileencoding}]%<[%{strftime(\"%d.%m.%y\",getftime(expand(\"%:p\")))}]%k%=%-14.(%l,%c%V%)\ %P

"Tabs & indenting:
set tabstop=4 "use 4 spaces
set shiftwidth=4 
set expandtab 

map <C-J> <C-W>j
"<C-W>_
map <C-K> <C-W>k
map <C-H> <C-W>-
map <C-L> <C-W>+

nnoremap    <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

let g:pep8_ignore="E501"

"set tags=./tags;/

set relativenumber 
set number

" Keep all the temporary and backup files in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"Easytags
let g:easytags_file = '~/.vim/tags'

"Ctrl-P
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  " Use Ag over Grep*/
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -u --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor*/
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>*/

