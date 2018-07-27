"-------------------------------------------------------------------------------{}
" "~/.vimrc" Konfigurations-Datei fuer den Vim
"-------------------------------------------------------------------------------
runtime macros/matchit.vim

set nocompatible
set encoding=utf-8
filetype off

" make ctrl-q and ctrl-s work in vim
silent !stty -ixon > /dev/null 2>/dev/null

" vim-plug {1 "
call plug#begin('~/.vim/plugged')

" github plugins
Plug 'FooSoft/vim-argwrap'
Plug 'ervandew/supertab'
"Plug 'msanders/snipmate.vim'
Plug 'lepture/vim-jinja'
Plug 'SirVer/ultisnips'
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'bronson/vim-visual-star-search'
Plug 'caio/querycommandcomplete.vim'
"Plug 'chrisbra/SudoEdit.vim'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'dbb/vim-gummybears-colorscheme'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'freitass/todo.txt-vim'
"Plug 'gmarik/vundle'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kevinw/pyflakes-vim'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'MicahElliott/Rocannon'
"Plug 'pearofducks/ansible-vim'
"Plug 'rking/ag.vim'
"Plug 'krisajenkins/vim-pipe'
"Plug 'neilhwatson/vim_cf3'
Plug 'rodjek/vim-puppet'
Plug 'scrooloose/nerdtree'
Plug 'sotte/presenting.vim'
"Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'
"Plug 'svenXY/pydoc.vim'
Plug 'svenXY/vim-muttmail'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'brendonrapp/smyck-vim'
" Bexec seems to break Omnicomplete
"Plug 'vim-scripts/Bexec'
"Plug 'vim-scripts/bufkill.vim'
Plug 'vim-scripts/buftabs'
Plug 'vim-scripts/taglist.vim'
"Plug 'vim-scripts/vcscommand.vim'
"Plug 'vim-scripts/vimcommander'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-shell'
Plug 'svenXY/vim-pputil'
Plug 'vim-scripts/Printer-Dialog'
Plug 'Raimondi/delimitMate'
"" local stuff
Plug 'svenXY/own_stuff'

" Non-github plugins
Plug 'http://repo.or.cz/r/vcscommand.git'

call plug#end()
" 1} "


" set the leader
let mapleader = ","
nnoremap \ ,

nnoremap <silent> <F7>  :NERDTreeToggle<CR>

set hidden
set colorcolumn=80
set cursorline

" performance stuff {1 "
set ttyfast
set lazyredraw
" }

" keep more context when scrolling off the end of a buffer
set scrolloff=5

"-------------------------------------------------------------------------------
" Bildschirm-Darstellung
"-------------------------------------------------------------------------------
" Editmodus-Anzeige in Statuszeile (rechts oder links unten)
set showmode

" Hinweis in Statuszeile ab N geänderte/gelöschte/eingefügte Zeilen
set report=0

" Kommando-Wiederholungsfaktoren und Teilkommandos in Statuszeile anzeigen
set showcmd

" Koordinatenanzeige in Statuszeile aktivieren
set ruler

" Datei-Titel in xterm-Titelzeile anzeigen (nicht in allen Terminals mögl.)
set title

" Zeilen nummeriert darstellen (und mit relative)
set number
set relativenumber

" Tabulator, space  und Zeilenende anzeigen (siehe lcs = listchars)
set list listchars=tab:»·,trail:·

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"-------------------------------------------------------------------------------
" Zeilenumbruch
"-------------------------------------------------------------------------------

" Bildschirmrand, innerhalb dem während Texteingabe umgebrochen wird (0=aus)
set wrapmargin=0
"
" auto load files if vim detects they have been changed outside of Vim
set autoread
"-------------------------------------------------------------------------------
" Dateioperationen
"-------------------------------------------------------------------------------

" Automatisch zu erkennende Dateiformate auflisten (auch set ff=...)
" Format (Zeilenende) gemäß Dateiinhalt beibehalten, NICHT festlegen set
set fileformats=unix,dos,mac

" Dateiformat (Zeilenende) beibehalten, NICHT festlegen (auch set ff=...)
" set fileformat=dos|unix|mac

" Mode-Zeilen am Dateianfang/Ende ignorieren (Security!)
" Anzahl erlaubter Zeilen für "modeline" ist LEER
set modeline
set modelines=5

" KEINE Backupdateien erzeugen (Dateiname + "~" dahinter)
set nobackup
set noswapfile

"-------------------------------------------------------------------------------
" Such- und Ersetzungs-Optionen
"-------------------------------------------------------------------------------

"" better use Ag() plugin and keep grep at normal
"set grepprg=ack-grep\ -H\ --nocolor\ --nogroup
"
" Beim Suchen über Textanfang/ende hinausspringen
" (Meldung: "Suche erreichte ANFANG/ENDE und wurde am ENDE/ANFANG fortgesetzt")
set wrapscan

" Suche NICHT case-senitiv, außer ein Grossbuchstabe steht im Suchmuster
" SmartCase, SMARTcase, smartCASE, SmArTcAsE, sMaRtCaSe, smartcase
set ignorecase
set smartcase

" Während Eingabe eines Suchmusters bereits suchen (inkrementell)
" Alle zu einem Suchmuster passenden Textstücke markieren (highlight)
" :nohlsearch schaltet Markierungen wieder ab
set incsearch
set hlsearch

" Flag "g=global" bei Substitute-Kommando (":s") automatisch setzen
set gdefault
"
" always search very magic (i.e. like pcre)
"nnoremap / /\v
"vnoremap / /\v

"-------------------------------------------------------------------------------
" Programmierung
"-------------------------------------------------------------------------------

" Tabstop auf 4 setzen
set tabstop=4
set shiftwidth=4

" Eingegebene Tabulatoren zu Leerzeichen expandieren
set expandtab

" Zeige zugeh. öffnende Klammer bei Eingabe der korresp. Schließenden
set showmatch

" Klammern, die "%" berücksichtigt (Sprung auf korrespondierende Klammer)
set matchpairs=(:),[:],{:},<:>

set autoindent
set smartindent
set nocopyindent
set nopreserveindent

set visualbell
"-------------------------------------------------------------------------------
" Syntax-Highlighting
"-------------------------------------------------------------------------------

" Syntax-Highlighting einschalten (abhängig von Datei-Endung / Shee-Bang-Zeile)
" ("enable" statt "on" macht was anderes!)
"syntax off
syntax on

" Syntaxcoloring-Farb-Schema (stehen in $VIMRUNTIME/colors)
" (16 Stück: blue, darkblue, default, desert, elflord, evening, koehler,
"            morning, murphy, pablo, peachpuff, ron, shine, torte, zellner)
" TIPP: Auflisten mit: :colo TAB...

set t_Co=16
set background=dark
"let g:solarized_termcolors=16
"colorscheme solarized
"hi Normal ctermbg=none
colorscheme smyck
"colorscheme default

"-------------------------------------------------------------------------------
" Faltung ("zusammenklappen" von Programmteilen) steuern
"-------------------------------------------------------------------------------

" Falten NICHT aktivieren
set foldenable

" Spaltenbreite zur Faltungsanzeige (z.B. für Faltungstiefe, -bereich)
set foldcolumn=2
set foldcolumn=0

" Faltungsmethode ("manual", "indent", "expr", "marker", "syntax", "diff")
" (Std: manual, "expr" -> foldexpr-Option, "marker" -> foldmarker-Option)
set foldmethod=syntax
set foldmarker={,}

" Schnelles Folding aktivieren
" (beim Betreten mit Cursor auf, beim Verlassen zu, sehr unruhig)
" set foldopen=all        " Std: block,hor,mark,percent,quickfix,search,tag,undo
" set foldclose=all       " Std: NIX

" Beim Falten zu ignorierende Zeilen (Kommentare)
set foldignore=#

" Text für Darstellung einer Faltung (Std)
set foldtext=foldtext()

" open/close fold with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"-------------------------------------------------------------------------------
" Maus-Konfiguration
"-------------------------------------------------------------------------------
" Cursorsteuerung per Maus einschalten (a=all)
" (Kopieren per Standard-X Window-Methode geht dann zusammen mit SHIFT-Taste!!!)
" set mouse=a

" Maus-Klick aktiviert Fenster bei Verwendung mehrerer Windows im Vim (STRG-W)
" #set mousefocus

" Maus während dem Eintippen verstecken
set mousehide

" Wirkung der Maustasten ("extend", "popup", "popup_setpos")
" #set mousemodel=extend

" Aussehen der Maus (geht nur im "gvim")
" set mouseshape=

" Maximal erlaubte Doppelklick-Verzögerung (in ms, Std: 500)
set mousetime=250

"-------------------------------------------------------------------------------
" Drucker-Einstellungen
"-------------------------------------------------------------------------------

" Ohne Syntaxfärbung, mit Zeilennummern
set printoptions=syntax:n,number:y

" Font: Courier 8 Punkte
set printfont=courier:h8

"-------------------------------------------------------------------------------
" Sonstige Einstellungen
"-------------------------------------------------------------------------------

" Was soll in ".viminfo"-Datei gespeichert werden?
" '50 = Marken für die maximal letzten 50 Dateien speichern
" "50 = Maximal 50 Zeilen pro Register a-z speichern
" h   = hlsearch beim Öffnen einer Datei abschalten
set viminfo=\'50,\"50,h

" Am Zeilenanfang/ende nur mit einigen Tasten zur vorh./nächste Zeile bewegen
" (Std: b,s = Backspace, Space)
set whichwrap="b,s"

" Automatische Text-Vervollständigung (mit STRG-P / STRG-N / STRG-X + ...) holt
" woher ihre Daten?
" set complete=.,w,b,u,t,i

" Welche Zahlenformate (alpha, octal, hex) sollen von Kommandos zum
" Inkrement (STRG-A) und Dekrement (STRG-X) von Zahlen im Text erkannt werden?
" Zum Testen Cursor auf Zahl und STRG-A/STRG-X drücken:   15   010    0x11
set nrformats=alpha,octal,hex

" Anzahl Undo-Schritte (Std: 1000)
" set undolevels=1000

" Maximale Breite für eingefügten Text (für "gq" + Bewegung, z.B. "gq)")
" (ACHTUNG: Funkt in Makros oder Funktionen auch rein!)
" set textwidth=80

" Backspace-Taste soll bei diesen 3 Tasten über den "Rand" hinweg können
set backspace=indent,eol,start

" Nur falls "autocommands" einkompiliert sind
if has("autocmd")
  " Immer zur letzten bekannten Position beim Editieren einer Datei springen
  " (nur falls Position gültig und nicht in einem Event-Handler)
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" Required to be able to use keypad keys and map missed escape sequences
" set esckeys


" wild* settings { "
" Complete longest common string, then each full match
" enable this for bash compatible behaviour
set wildmenu
set wildmode=list:longest

" wildignore 
set wildignore+=*.so,*.sw?,*.zip,*.pyc,*.pyo
" } wild* settings "

"-------------------------------------------------------------------------------
" Eigene Befehle
"-------------------------------------------------------------------------------
" Im Vi sind folgende Tasten verwendbar, da nicht belegt:
" (im Vim sind fast alle doch belegt (leider?))
" * Klein:          g     q   v
" * Gross:            K       V
" * Steuerung:    A   K O   T V W X
" * Satzzeichen:  _ * \ = #
" * Ziffern:      1 2 3 4 5 6 7 8 9
"
" Entbehrlich sind folgende Kommandos (Ersatz vorhanden)
" C            c$   Ab Cursor bis Zeilenende Text ersetzen
" D            d$   Ab Cursor bis Zeilenende löschen
" Q            --   Permanent in den Ex-Modus umschalten (mit "vi" verlassen)
" S            cc   Aktuelle Zeile ersetzen
" s            cl   Aktuelle Zeichen ersetzen (oder c<SPACE>)
" X            hx   Zeichen VOR Cursor löschen
" Y            yy   Aktuelle Zeile in temporärem Puffer merken
" ZZ           :wq  Vim mit Abspeichern verlassen (oder :x)
" +            k    Eine Zeile nach oben gehen
" -            j    Eine Zeile nach unten gehen
" <SPACE>      l    Ein Zeichen nach rechts
" <BACKSPACE>  h    Ein Zeichen nach links
" STRG-N       j    Eine Zeile nach unten
" STRG-P       k    Eine Zeile nach oben
" STRG-E       j    Eine Zeile nach unten schieben (Cursor bleibt stehen)
" STRG-Y       k    Eine Zeile nach oben schieben (Cursor bleibt stehen)
"-------------------------------------------------------------------------------

" Beim "Pasten" von Text aus anderem Fenster vorher alle Sonderfunktionen
" abschalten mit <F9> und danach wieder einschalten mit <F10>
nnoremap <F9> :set paste!<bar>set paste?<CR>
inoremap <F9> <C-O>:set paste!<CR>

nnoremap <F11> :set hls!<bar>set hls?<CR>
nnoremap <F10> :set number!<CR>:set foldcolumn=0<CR>

" Durch mehrere Dateien springen
" (+=nächste Datei, -=vorherige, #=aktuelle schreiben und zu nächster springen)
nnoremap + :n<CR>
nnoremap - :prev<CR>
"nnoremap # :w<CR>:n<CR>

"-------------------------------------------------------------------------------
" Funktionstasten belegen (per Map, der Funktion aufruft)
" * Funktionsnamen müssen mit einem Grossbuchstaben beginnen!
" * Vor Funktionsaufrufen "call" verwenden (oder in Ausdruck verwenden)
" * Zum Einrücken KEINE TABs verwenden!
"-------------------------------------------------------------------------------
nnoremap <F1>  :call ToggleListMode()<CR>

" Option "list" aktiv oder nicht? -> Invertieren
function ToggleListMode()
  let &list = ! &list
endfunction

" Option "wrap" aktiv oder nicht? -> Invertieren
function ToggleWrapMode()
  let &wrap = ! &wrap
endfunction

function CommentPerl()
  let myline = getline(".")
  call setline(".", "#" . myline)
  call cursor(line(".")+1, 0)
endfunction

" Bufferliste
nnoremap   <F5> :ls<CR>:b 

" Alle Register anzeigen, nach Auswahl einfuegen
fu! RegList()
    reg
    let A=input("#?")
    execute "normal \"".A."p<return>"
endfunction

nnoremap <F6> :call RegList()<cr>


set fileformat=unix

function! RunCmd(cmd)
      let fn = expand("%:p")
      let ft = &l:filetype
      botright copen
      setlocal modifiable
      %d _
      silent execute "read !".a:cmd." ".fn
      1d _
      normal! 0
      if ft != ""
        execute "setf ".ft
      else
        setlocal filetype=
      endif
      setlocal nomodifiable nomodified
      wincmd p
endfunction

" make tab in v mode ident code
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" aspell
nnoremap  :w!<CR>:!aspell check %<CR>:e! %<CR>

filetype plugin indent on

" TaskList & TagList
nnoremap <leader>T :TlistToggle<CR>

let VCSCommandResultBufferNameExtension = ".vcs"
let VCSCommandDeleteOnHide = 1

au FileType python set omnifunc=pythoncomplete#Complete
"autocmd BufNewFile,BufRead *.py compiler python

"if (v:version >= 700) 
"   highlight SpellBad      ctermfg=Red         term=Reverse        guisp=Red       gui=undercurl   ctermbg=White 
"   highlight SpellCap      ctermfg=Green       term=Reverse        guisp=Green     gui=undercurl   ctermbg=White 
"   highlight SpellLocal    ctermfg=Cyan        term=Underline      guisp=Cyan      gui=undercurl   ctermbg=White 
"   highlight SpellRare     ctermfg=Magenta     term=underline      guisp=Magenta   gui=undercurl   ctermbg=White 
"endif " version 7+ 

fu! DoRunPyBuffer2()
    pclose! " force preview window closed
    setlocal ft=python

    " copy the buffer into a new window, then run that buffer through python
    sil %y a | below new | sil put a | sil %!python -
    " indicate the output window as the current previewwindow
    setlocal previewwindow ro nomodifiable nomodified

    " back into the original window
    winc p
endfu

command! RunPyBuffer call DoRunPyBuffer2()
" disabled! F7 is currently used for NerdTree
" nnoremap <F7> :RunPyBuffer<CR>

" cfengine stuff
au BufRead,BufNewFile *.cf set ft=cf3
autocmd FileType cf3 set tabstop=2 shiftwidth=2 smarttab expandtab softtabstop=2 autoindent

" reread docfiles, although most should now be in bundles
:helptags ~/.vim/doc/

autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e

fun! Getchar()
  let c = getchar()
  if c != 0
    let c = nr2char(c)
  endif
  return c
endfun

fun! Eatchar(pat)
   let c = Getchar()
   return (c =~ a:pat) ? '' : c
endfun

" Always show the menu, insert longest match
set completeopt=menuone,longest

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" SuperTab settings
let g:SuperTabLongestEnhanced=1
let g:SuperTabLongestHighlight=1

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vnoremap <C-Up> [egv
vnoremap <C-Down> ]egv

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" map jk to <esc>
:inoremap jk <esc>

" noop arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"Use the arrows to something usefull
"map <right> :BF<CR>
"map <left> :BB<CR>
"map <up> :BD<CR>

" avoid cursor keys for command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <leader>#l :execute "rightbelow vsplit " . bufname("#")<cr>
nnoremap <leader>#h :execute "leftabove vsplit " . bufname("#")<cr>
nnoremap <leader>#j :execute "rightbelow split " . bufname("#")<cr>
nnoremap <leader>#k :execute "leftabove split " . bufname("#")<cr>

nnoremap <leader>w :match Error /\v\s+$/<cr>
noremap <leader>W :match<cr>
nnoremap <leader># :nohl<cr>

nnoremap <tab> %
vnoremap <tab> %

" buftabs settings
set laststatus=2
" next does not seem to work in first buffer
"let g:buftabs_in_statusline=1

"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"":set statusline+=%=        " Switch to the right side
"":set statusline+=%l        " Current line
"":set statusline+=/         " Separator
"":set statusline+=%L        " Total lines

" put active file directory into %%
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" mute highlighting && redraw screen
" used here because vim-tmux-nav needs Ctrl-L
nnoremap <silent> <leader><space> :<C-u>nohlsearch<CR><C-l>

" fixing the & command
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" mappings to open a file in the directory of the file in the current buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>eV :vsp %%
map <leader>et :tabe %%
cnoremap help vertical help 

" Resize Vsplits on window resize 
au VimResized * exe "normal! \<c-w>="


" prevent pyflakes from polluting quickfix
let g:pyflakes_use_quickfix = 0

" stolen from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" map ,bg to toggle background
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" Plugin settings {
" notes stuff { "
" configure a directory for vim-notes
let g:notes_directories = ['~/notes']
let g:notes_smart_quotes = 0
" } notes stuff "
" Mutt stuff {
let g:MuttSigStripString='Hauptsitz'

let g:snips_author='Sven Hergenhahn'
let g:snips_email='sven.hergenhahn@1und1.de'
" }
" fugitive stuff {
" fugitive needs an english speaking git
let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'
" }
"Ctrl-P stuff {
" check http://blog.patspam.com/2014/super-fast-ctrlp for details
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"conflicts with PrinterDialog
"nnoremap <leader>p :CtrlPBuffer<cr>
" }
" UltiSnips stuff { "
let g:UltiSnipsListSnippets='<m-k>'
let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-s-j>'
" } UltiSnips stuff "
" airline stuff { "
set noshowmode
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
"set fillchars+=stl:\ ,stlnc:\
" } airline stuff "
" nerdcommenter stuff { "
let g:NERDCustomDelimiters = {
            \ 'puppet': { 'left': '#', 'leftAlt': '/*', 'rightAlt': '*/' },
            \ }
" } nerdcommenter stuff "
" delimitMate stuff { "
au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
" } delimitMate stuff "
" ruby stuff {
" ruby path if you are using rbenv
let g:ruby_path = system('echo $HOME/.rbenv/shims')
" }
" vim-shell { "
let g:shell_mappings_enabled = 0
"Since no mappings will be defined now you can add something like the following to your vimrc script:
"inoremap <Leader>fs <C-o>:Fullscreen<CR>
"nnoremap <Leader>fs :Fullscreen<CR>
"inoremap <Leader>op <C-o>:Open<CR>
"nnoremap <Leader>op :Open<CR>
" } vim-shell "
" rainbow parentheses { "
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" } rainbow parentheses
" neomake { "
" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
" } neomake
" AirlineTheme { "
let g:airline_theme='papercolor'
" } AirlineTheme
" ArgWrap { "
nnoremap <silent> <leader>a :ArgWrap<CR>
" } ArgWrap
" } end Plugin settings "


" hjardly use perl these days...
" autocmd FileType perl source ~/.vim/svh_perl

" Filetype ruby {
autocmd FileType ruby set re=1
" }
autocmd FileType vim set foldmethod=marker

" diff mode toggle { "
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction
" } diff mode toggle "

" source host .vimrc
let s:host_vimrc = $HOME . '/.vim/vimrc.' . hostname()
if filereadable(s:host_vimrc)
  execute 'source ' . s:host_vimrc
endif

