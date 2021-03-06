set textwidth=80

:inoremap jk <esc>
:inoremap {} {<esc>o}<esc>
:nnoremap ev :e $MYVIMRC<cr>
:nnoremap et :e ~/LIFE/tech/tools<cr>
:nnoremap sv :source $MYVIMRC<cr>
:nnoremap S" viw<esc>a"<esc>bi"<esc>lel
:nnoremap H 0
:nnoremap L $
:nnoremap <space> o<esc>
:nnoremap / /\v
:nnoremap <F2> oDate:<esc>:r !date<cr>kJ
:onoremap p i(
:onoremap in( :<c-u>normal! f(vi(<cr>
:onoremap il( :<c-u>normal! F(vi(<cr>

"normally I use :%s a lot, seldom :s
:nnoremap :s :%s

"exercise in zhejiang univercity pat, using copy whole file a lot
nnoremap gga ggVG"*y
nnoremap ,p "*p
nnoremap [b :bp<CR>
nnoremap ]b :bn<cr>

:iabbrev adn and
:iabbrev waht what
:iabbrev tehn then
:iabbrev @@ mahongtao0x7e0@163.com
:iabbrev cont count
:iabbrev retuen return

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
 endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else


endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
"packadd matchit

noremap <C-L> <Esc>:TlistToggle<CR><c-w>h

:colorscheme industry
"execute pathogen#infect()
