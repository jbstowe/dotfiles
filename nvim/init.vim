call plug#begin()

Plug 'https://github.com/flazz/vim-colorschemes.git'

Plug 'https://github.com/scrooloose/nerdtree.git'

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

Plug 'https://github.com/Yggdroot/indentLine.git'

Plug 'https://github.com/Raimondi/delimitMate.git'

Plug 'https://github.com/vim-scripts/taglist.vim.git'

Plug 'https://github.com/rking/ag.vim.git'

Plug 'https://github.com/tpope/vim-commentary.git'

Plug 'https://github.com/kana/vim-textobj-user.git'

Plug 'https://github.com/kana/vim-textobj-line.git'

Plug 'https://github.com/whatyouhide/vim-textobj-xmlattr.git'

Plug 'https://github.com/vim-airline/vim-airline.git'

Plug 'https://github.com/vim-airline/vim-airline-themes.git'

Plug 'https://github.com/edkolev/tmuxline.vim.git'

Plug 'https://github.com/ervandew/supertab.git'

Plug 'https://github.com/tpope/vim-surround.git'

Plug 'https://github.com/airblade/vim-gitgutter.git'

Plug 'https://github.com/digitaltoad/vim-pug.git'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

Plug 'https://github.com/Shougo/neco-syntax'

" PHP Specific Plugins
Plug 'https://github.com/arnaud-lb/vim-php-namespace.git'

Plug 'https://github.com/jwalton512/vim-blade.git'

"Dev Icons needs to be last to be applied to other plugins
Plug 'https://github.com/ryanoasis/vim-devicons.git'

call plug#end()


let mapleader=','
set encoding=utf8
set number
set visualbell
set noerrorbells
set ignorecase
set wrapmargin=0
set textwidth=0
set autowriteall                                        "autowrite the file when switching buffers"
set complete=.,w,b,u                                    "set autocmplete search"
set nocursorline
"set synmaxcol=140                                     " Syntax coloring lines that are too long just slows down the world
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"
" Remember cursor position between vim sessions
autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
"center buffer around cursor when opening files
autocmd BufRead * normal zz)"')"'

" Visuals
    colorscheme atom-dark-256
" Neovim Settings
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    
" Tabs
    set tabstop=4
	set shiftwidth=4
	set softtabstop=4
	set expandtab
    
" Split Managment
    set splitbelow
    set splitright
    nmap <C-J> <C-W><C-J>
    nmap <C-K> <C-W><C-K>
    nmap <C-H> <C-W><C-H>
    nmap <C-L> <C-W><C-L>
    
" Search
    set hlsearch
    set incsearch
    nmap <Leader><space> :nohlsearch<cr>						"remove search highlighting

" remember open buffers
    :exec 'set viminfo=%,' . &viminfo

" Shortcuts
    nmap <leader><leader>ev :tabedit ~/.config/nvim/init.vim<cr>

" Plugins
    "--- NerdTree ---
    let NERDTreeShowHidden=1
    map <leader>1 :NERDTreeToggle<cr>

    "--- CtrlP ---
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/**/*,*/\.git/*,*/node_modules/**/*
    let g:ctrlp_custom_ignore = 'node_modules\DS_Store\vendor|git'
    let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
    let g:ctrlp_map = '<leader>p'
    let g:ctrlp_show_hidden = 1 

    "let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
    let g:ctrlp_cache_dir = $HOME . '/.cache/neoctrlp'
    " if executable('Ag')
    "       let g:ctrlp_user_command = 'Ag %s -l --nocolor -g ""'
    " endif

    " Familiar commands for file/symbol browsing
    nmap <leader>w :CtrlPMRUFiles<cr>
    nmap <leader>e :CtrlPBuffer<cr>
    nmap <leader>p :CtrlP<cr>
    nmap <leader>r :CtrlPBufTag<cr>


    "--- TagList ---"
    nmap <leader>2 :TlistToggle<cr>
    let Tlist_Use_Right_Window = 1
    let tlist_php_settings = 'php;c:class;f:function'
    let Tlist_GainFocus_On_ToggleOpen = 1
    let Tlist_Close_On_Select = 1


    "--- Auto use imports at the top ---"
    function! IPhpInsertUse()
        call PhpInsertUse()
        call feedkeys('a',  'n')
    endfunction
    autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>m :call PhpExpandClass()<CR>

    "--- Airline Bar ---
    let g:airline_section_warning = ''
    let g:airline_section_y = ''
    let g:airline_theme='base16_ashes'
    set noshowmode


    let g:deoplete#enable_at_startup = 1
    let g:python3_host_prog = '/usr/local/bin/python3'


    let g:phpcomplete_index_composer_command = 'composer'
