execute pathogen#infect()
syntax enable 
filetype plugin indent on

let mapleader = ','                                             "default leader is \ change it to comma
set nocompatible                                                "Disable vi-compatibility
set linespace=15                                               "LINE HEIGHT
set number                                                      "turn on line numbers
set visualbell
set noerrorbells
set ignorecase
set mouse=a
set wrapmargin=0
set textwidth=0

"----------tabs-------"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


"----------------Visuals--------------"
colorscheme 256-jungle
"set guifont=Fira_Code:h18
"set macligatures 						"allow fancy symbols
"set background=dark   					 	" Setting dark mode
"let g:gruvbox_contrast_dark = "hard"

set ruler
set guioptions-=e						"we dont want gui tabs
set guioptions=l						"hide macvim scrollbars
set guioptions=L
set guioptions=r
set guioptions=R


" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif


if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif
    



"--------------Search--------------"
set hlsearch
set incsearch

"-----------------Mappings--------------"
"make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/
nmap <Leader><space> :nohlsearch<cr>						"remove search highlighting

nmap <Leader>f :tag<space>

"-----------------Split Managment--------------"
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"--------------Plugins--------------"
"/
"/ NERDTree
"/
let NERDTreeHiJackNetrw =2 
let NERDTreeShowHidden=1
"map <D-1> :NERDTreeToggle<cr>
map <Leader>1 :NERDTreeToggle<cr>

"/
"/ CtrlP 
"/
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/**/*,*/\.git/*
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\vendor|git'
"let g:ctrlp_custom_ignore = '\v[\/]\.git'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_map = '<leader>p'

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('Ag')
      let g:ctrlp_user_command = 'Ag %s -l --nocolor -g ""'
endif

" Familiar commands for file/symbol browsing
nmap <leader>e :CtrlPMRUFiles<cr>
"nmap <S-p> :CtrlP<cr>
nmap <leader>p :CtrlP<cr>
nmap <leader>r :CtrlPBufTag<cr>


"/
"/ Emmet 
"/
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"-----------------Auto Commands--------------"
"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup end


"-------------Auto use imports at the top --------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
    
	
"-------------Laravel-Specific--------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader>la :!php artisan:
nmap <Leader><Leader>c :CtrlP<cr>app/Http/Controllers/
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :CtrlP<cr>resources/views/

" Notes and tips
" ctrl + ] -> takes you to highlighted tag
" zz -> centers line where cursor is located
" ctrl + ^ -> go back to the last file
