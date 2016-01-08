set shell=bash

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Autosave
Plugin 'vim-auto-save'

" Editing
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ervandew/supertab'
Plugin 'Shougo/vimproc.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'dkprice/vim-easygrep'
Plugin 'isRuslan/vim-es6'

" UI
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'ap/vim-css-color'
Plugin 'AnsiEsc.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'roman/golden-ratio'
Plugin 'nathanaelkane/vim-indent-guides'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jgdavey/tslime.vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'sjl/vitality.vim'

Plugin 'dermusikman/sonicpi.vim'

" Documentation
Plugin 'rizzatti/dash.vim'

call vundle#end()

" Set the theme
colorscheme vimbrant
" set background=light


" -- Options --

" No wrapping please
set nowrap

" Redraw less for vroom vroom
set lazyredraw

" Encoding
set encoding=utf-8

" Linenumbers
set number
set relativenumber

" Better seaching
set hlsearch
set ignorecase
set smartcase

" 4 space tabs
set expandtab
set tabstop=4
set shiftwidth=4

" Splits
set splitright
set splitbelow

" Mouse
set mouse=a
set ttyfast
set t_Co=256

" History
set nowritebackup
set history=10000
set noswapfile
set nobackup

" Use system clipboard
set clipboard=unnamed

" Highlight long lines
set synmaxcol=512

" Watch files
set autoread

" Save on changing buffers
set autowrite

" Display command
set showcmd

" visual autocomplete for command menu
set wildmenu

" Extend our undoable steps and preserve over restart (if available)
if has('persistent_undo')
  set undodir=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp
  set undofile
  set undoreload=10000
end
set undolevels=10000

" Show tabs
:set listchars=tab:▸-,

"Invisible character colors 
autocmd VimEnter,Colorscheme * :hi NonText ctermfg=0
autocmd VimEnter,Colorscheme * :hi SpecialKey ctermfg=0

" Indent guides config
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235


" netrw config
let g:netrw_liststyle=3

" vim-spec options
let g:rspec_command = ':call Send_to_Tmux("spec {spec}\n")'

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_javascript_checkers = ['standard']

"airline
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"vim-auto-save
let g:auto_save = 1  " enable AutoSave
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1  " do not display the auto-save notification

"Command t
let g:CommandTMaxHeight = 25
let g:CommandTFileScanner = 'watchman'

"Navigator
let g:tmux_navigator_save_on_switch = 1

" Indent lines
let g:indentLine_color_term = 000

" Set leader to space
nmap <space> <leader>
nmap <space><space> <leader><leader>
" xmap includes Visual mode but not Select mode (which we don't often use, but
" if we did we'd expect hitting space to replace the selected text with a
" space char).
xmap <space> <leader>

" -- Shortcuts --

" allow easier buffer switching
noremap <C-}> :bnext<CR>
noremap <C-{> :bprevious<CR>

" kj to exit insert mode and save
inoremap kj <Esc>:w<CR>

" format the entire file
nmap <leader>fef ggVG=

" close buffer
nmap <leader>x :q<CR>

" FZF
noremap <c-p> :FZF<CR>
let g:fzf_source = 'find . -type f | grep -v "node_modules/"'

" Use v to expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" insert lines without entering insert mode
noremap <leader>o o<Esc>k
noremap <leader>O O<Esc>j

" Run specs
noremap <BS> :call RunCurrentSpecFile()<CR>
noremap \ :call RunNearestSpec()<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Restore the enter key in the quick fix panel
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Add a ruler at 80 characters
" augroup BgHighlight
"     autocmd!
"     autocmd WinEnter * set colorcolumn=80
"     autocmd WinLeave * set colorcolumn=0
" augroup END

" Save on focus lost
au FocusLost * silent! wa

nmap <leader><leader> :call Send_to_Tmux("tst\n")<cr>
nmap <leader>w :w <cr>

noremap <leader>e :e! <cr>

" Autocomplete tags
iabbrev </<leader> </<C-X><C-O>

" Add a semicolon to end of line when pressing ;
nmap ; A;kj

" Add a comma to end of line when pressing ,
nmap , A,kj

" Set async completion.
let g:monster#completion#rcodetools#backend = "async_rct_complete"

" Search dash
nmap <silent> <leader>d <Plug>DashSearch

" Allow . in visual mode
vnoremap . :norm.<CR>
