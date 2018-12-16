" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Basic configurations (Luke-Smith inspired)
set nocompatible
filetype plugin on
" syntax on
set encoding=utf-8
set number relativenumber

map <F6> :setlocal spell! spelllang=fr<CR>
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

"map <Up> <Esc>gki
"map <Down> <Esc>gji
map <C-Up> g<Up>
map <C-Down> g<Down>
imap <C-Up> <C-[> g<Up>i
imap <C-Down> <C-[> g<Down>i

nnoremap <c-l> :nohl<cr><c-l>

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
 silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" VIM-PLUG SECTION
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" vimtex
 Plug 'lervag/vimtex'
" vim-latex aka latex-suite
" Plug 'vim-latex/vim-latex'

" Neo-Snipet
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1
"
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'

" Ultisnips
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'vim-scripts/vim-auto-save'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug '~/.fzf'

" Surroundind
Plug 'tpope/vim-surround'
"Plug 'machakann/vim-sandwich'

" ColorSchemes
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'

" Initialize plugin system
call plug#end()
" VIM-PLUG SECTION END

" map NERDTree
map <C-n> :NERDTreeToggle<CR>
" Powerline options
set  rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
let g:powerline_pycmd="py3"

" Auto-Save options
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" TeX/LaTeX configurations
let g:tex_flavor = "latex"

" vimtex plugin configuration
"let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_view_general_options_latexmk = '--unique'
"let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_view_general_viewer = 'zathura'

" NeoSnippet Option"s
"" Plugin key-mappings.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
""imap <expr><TAB>
"" \ pumvisible() ? "\<C-n>" :
"" \ neosnippet#expandable_or_jumpable() ?
"" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" For conceal markers.
"if has('conceal')
  "set conceallevel=2 concealcursor=niv
"endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>'] "Default
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<space><space>"
let g:UltiSnipsJumpBackwardTrigger="<space><BS>"

let g:UltiSnipsSnippetsDir="~/.vim/snips"
let g:UltiSnipsSnippetDirectories=["snips", "UltiSnips"]
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"Open UltiSnips edit function
nmap <space>ue :UltiSnipsEdit<cr>
nmap <space>ds :vsp<SPACE>~/dotfiles/vim/.vim/plugged/vim-snippets/snippets/tex.snippets<CR>:sp<SPACE>~/dotfiles/vim/.vim/plugged/vim-snippets/UltiSnips/tex.snippets<CR>

set autochdir

" Commandes latex mode math
vmap m di$<SPACE><Esc>gpi<SPACE>$
vmap M di[\<SPACE><Esc>gpi<SPACE>\]

let maplocalleader="\<Space>"
let g:vimtex_imaps_leader="è"

