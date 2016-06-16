let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"------------------------
"VIMPLUG
"------------------------
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/flazz/vim-colorschemes.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'dracula/vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/raichoo/haskell-vim.git'
Plug 'https://github.com/tomasr/molokai.git'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
" Plug 'jeaye/color_coded'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/owickstrom/vim-colors-paramount.git'
Plug 'https://github.com/gerw/vim-HiLinkTrace.git' "Plugin for tracing syntax groups
call plug#end()

"------------------------
"MISC
"------------------------
"Change leader key to space!
let mapleader=" "

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB
set expandtab
set shiftround
syntax enable
syntax on
" set number
" Highlight search results
set hlsearch
:set nowrap

" endif
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '~/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

set clipboard=unnamedplus

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"
:set noswapfile

filetype on
filetype indent on
filetype plugin on

let g:indentLine_char = ' '
" let g:indentLine_char = '¦'
" let g:indentLine_char = '┆'
" let g:indentLine_char = '│'
" let g:indentLine_char = '.'
" let g:indentLine_char = '»'
"  of ¦, ┆, or │ t
" set listchars=eol:¬
" set list
" ,tab:>-,trail:~,extends:>,precedes:<

" let g:cpp_experimental_template_highlight = 1
let g:cpp_class_scope_highlight = 1

"------------------------
" Haskell
"------------------------
let g:haskell_indent_if    = 4
let g:haskell_indent_case  = 4
let g:haskell_indent_let   = 4
" let g:haskell_indent_where = 4
let g:haskell_indent_where = 0
let g:haskell_indent_do    = 4
let g:haskell_indent_in    = 4
let g:cabal_indent_section = 4

"------------------------
" Keymapping
"------------------------
set timeoutlen=1000 ttimeoutlen=0
set laststatus=2
imap jj <Esc>
nnoremap <Leader>r :%s/\s\+$//e<CR>
imap <C-l> λ

" Alt based shortcuts, uses Esc, thus some things, like visual mode, require
" pressing Esc twice it sees...
map <M-k> {
map <M-j> }
:nnoremap <M-l> :bnext<CR>
:nnoremap <M-h> :bprevious<CR>
:tnoremap <M-l> <C-\><C-n>:bnext<CR>
:tnoremap <M-h> <C-\><C-n>:bprevious<CR>

tnoremap <ESC><ESC> <C-\><C-N>

"nnoremap <C-l> :bnext<CR>
"nnoremap <C-h> :bprevious<CR>
"map <C-k> {
"map <C-j> }

:set wildignore+=*uasset,*.o,*.obj,*.meta,*.mat,*.hi,*.jpg,*.png,*.psd,*.controller,*.fbx,*.anim,*.unity,*.db,*.pdf,*.prefab,*.tif,**/.git/*,**/.svn/*,*.tga,*.dll,*.sln,*.zip,*.lnk,*.assets,*.bmp,*.TTF,*.apk,*.wavm,*.lib,*.dyn_hi,*.dyn_o,**/dist

"Find .h or .cpp files
map <LEADER>f :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <LEADER>u :%s/\r/\r/g<CR>

map <LEADER>t :FZF<CR>

let g:tcommentMapLeaderOp1 = '<Leader>c'
let g:tcommentMapLeaderOp2 = '<Leader>c'

"Paste without filling buffer
xnoremap p pgvy

"------------------------
" Splits
"------------------------
set splitright

nnoremap <LEADER>h :wincmd h<CR>
nnoremap <LEADER>j :wincmd j<CR>
nnoremap <LEADER>k :wincmd k<CR>
nnoremap <LEADER>l :wincmd l<CR>

"------------------------
" COLORSCHEME
"------------------------

" Customize some colors in dracula
colorscheme dracula " For some reason molokai has a bug where the current tab is blank unless you set a different colorscheme first....
" hi Normal guibg=#1B1F20
" hi Operator ctermfg=LightBlue guifg=#2EAfCf
" hi Delimiter ctermfg=LightGreen guifg=#00E080

colorscheme paramount
" colorscheme molokai
" colorscheme jellybeans
" colorscheme wolfpack
" colorscheme muon
" colorscheme sky
" colorscheme inkpot
" :set cursorline

" Make custom colorscheme?
hi Normal ctermbg=None guibg=None
hi Operator ctermfg=DarkGrey guifg=#4070A0

hi Delimiter ctermfg=White guifg=#20A0C0
hi cCustomParen ctermfg=White guifg=#20A0C0

hi Identifier gui=italic guifg=#406090

hi cStorageClass guifg=#B03030
hi Structure guifg=#B03030
hi label guifg=#B03030
hi cInclude guifg=#B03030

hi cCustomClass guifg=#767676
hi cType guifg=#767676
hi Type guifg=#767676

" hi Normal guibg=#1F1F1F

"------------------------
" AIRLINE
"------------------------
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_sep = '>'
" let g:airline_right_sep = '<'
let g:airline_right_sep = ''
let g:airline_left_sep = ''
" let g:airline_theme='lucius'
let g:airline_theme='zenburn'
" let g:airline_theme='simple'
" let g:airline_theme='sky'
" let g:airline_theme='wolfpack'
