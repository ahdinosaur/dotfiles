set nocompatible        " Use Vim defaults (much better!)
set bs=2                " Allow backspacing over everything in insert mode
set ai                  " Always set auto-indenting on
" set backup             " Keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file -- limit to only 50
set history=50          " keep 50 lines of command history
set ruler               " Show the cursor position all the time
set ts=4                " 4 space wide tabs
set sw=4
set softtabstop=4       "makes backspacing over spaced out tabs work real nice
set expandtab           "expand tabs to spaces
set ignorecase
set background=dark     "awesome for terminals with crappy colors (putty!)
set tagstack            "lets you push and pop your jumps with ctrl+]
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>   "when you're pasting stuff this keeps it from getting
                        "all whacked out with indentation
set foldmethod=manual   "enable code folding

set clipboard=unnamedplus,autoselect " Use + register (X Window clipboard) as unnmed register

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" rot13 dmca-grade encryption
" this is useful to obfuscate whatever it is that you're working on temporarily
" if someone walks by (vim pr0n?)
map <F3> mzggVGg?`z

" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

let g:pydiction_location = '$HOME/bin/complete-dict'

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END


" Settings for VimClojure
let g:clj_highlight_bultins=1   " Highlight Clojure's builtins
let vimclojure#ParenRainbow = 1       " Rainbow parentheses'!

nmap <F8> :SCCompile<cr>
nmap <F9> :SCCompileRun<cr>
