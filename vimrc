"-------------------------------------------------------------------------------
" "~/.vimrc" Konfigurations-Datei fuer den Vim
"-------------------------------------------------------------------------------
set nocompatible
filetype off

" make ctrl-q and ctrl-s work in vim
silent !stty -ixon > /dev/null 2>/dev/null

" use vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle {1 "
" github plugins
"Bundle 'ervandew/supertab'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bronson/vim-visual-star-search'
Bundle 'caio/querycommandcomplete.vim'
Bundle 'chrisbra/SudoEdit.vim'
Bundle 'dbb/vim-gummybears-colorscheme'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'honza/vim-snippets'
Bundle 'kevinw/pyflakes-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
"Bundle 'msanders/snipmate.vim'
Bundle 'neilhwatson/vim_cf3'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'svenXY/pydoc.vim'
Bundle 'svenXY/vim-muttmail'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/Bexec'
Bundle 'vim-scripts/buftabs'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/vcscommand.vim'
Bundle 'vim-scripts/vimcommander'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'
Bundle 'xolox/vim-shell'

" Non-github plugins
Bundle 'http://repo.or.cz/r/vcscommand.git'
" 1} "

filetype plugin indent on

" set the leader
let mapleader = ","
nnoremap \ ,

nnoremap <silent> <F4>  :NERDTreeToggle<CR>

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

" Tabulator und Zeilenende NICHT anzeigen (siehe lcs = listchars)
set nolist

set splitright splitbelow
"-------------------------------------------------------------------------------
" Zeilenumbruch
"-------------------------------------------------------------------------------

" Bildschirmrand, innerhalb dem während Texteingabe umgebrochen wird (0=aus)
set wrapmargin=0

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

"-------------------------------------------------------------------------------
" Such- und Ersetzungs-Optionen
"-------------------------------------------------------------------------------

"" better use Ack() plugin and keep grep at normal
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
" set gdefault

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
let g:solarized_termcolors=16
colorscheme solarized
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
set esckeys


" wild* settings { "
" Complete longest common string, then each full match
" enable this for bash compatible behaviour
set wildmode=longest,full

" wildignore 
set wildignore+=*/tmp/*,*.so,*.sw?,*.zip,*.pyc,*.pyo
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
autocmd BufNewFile,BufRead *.py compiler python

"if (v:version >= 700) 
"	highlight SpellBad      ctermfg=Red         term=Reverse        guisp=Red       gui=undercurl   ctermbg=White 
"	highlight SpellCap      ctermfg=Green       term=Reverse        guisp=Green     gui=undercurl   ctermbg=White 
"	highlight SpellLocal    ctermfg=Cyan        term=Underline      guisp=Cyan      gui=undercurl   ctermbg=White 
"	highlight SpellRare     ctermfg=Magenta     term=underline      guisp=Magenta   gui=undercurl   ctermbg=White 
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
nnoremap <F7> :RunPyBuffer<CR>

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

" avoid cursor keys for command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <leader>#l :execute "rightbelow vsplit " . bufname("#")<cr>
nnoremap <leader>#h :execute "leftabove vsplit " . bufname("#")<cr>
nnoremap <leader>#j :execute "rightbelow split " . bufname("#")<cr>
nnoremap <leader>#k :execute "leftabove split " . bufname("#")<cr>

nnoremap <leader>w :match Error /\v\s+$/<cr>
nnoremap <leader>W :match<cr>
nnoremap <leader># :nohl<cr>

" buftabs settings
set laststatus=2
:let g:buftabs_in_statusline=1

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
":set statusline+=%=        " Switch to the right side
":set statusline+=%l        " Current line
":set statusline+=/         " Separator
":set statusline+=%L        " Total lines

" put active file directory into %%
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" mute highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

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



" map ,bg to toggle background
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" Plugin settings {
" notes stuff { "
" configure a directory for vim-notes
let g:notes_directories = ['~/ownCloud/notes']
let g:notes_smart_quotes = 0
" } notes stuff "
" Syntastic stuff {
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=3
let g:syntastic_check_on_open=1
" puppet-lint is incredibly strict!
let g:loaded_syntastic_puppet_puppetlint_checker=1
"let g:syntastic_puppet_puppetlint_args='--no-autoloader_layout-check'
" }
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
"let g:ctrlp_cmd = 'CtrlPBuffer'
nnoremap <leader>p :CtrlPBuffer<cr>
" }
" UltiSnips stuff { "
let g:UltiSnipsListSnippets='<m-k>'
let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-s-j>'
" } UltiSnips stuff "
" } end Plugin settings "
" vim-shell { "
let g:shell_mappings_enabled = 0
"Since no mappings will be defined now you can add something like the following to your vimrc script:
"inoremap <Leader>fs <C-o>:Fullscreen<CR>
"nnoremap <Leader>fs :Fullscreen<CR>
"inoremap <Leader>op <C-o>:Open<CR>
"nnoremap <Leader>op :Open<CR>
" } vim-shell "

autocmd FileType perl source ~/.vim/svh_perl
autocmd FileType vim set foldmethod=marker


" source host .vimrc
let s:host_vimrc = $HOME . '/.vim/vimrc.' . hostname()
if filereadable(s:host_vimrc)
  execute 'source ' . s:host_vimrc
endif



