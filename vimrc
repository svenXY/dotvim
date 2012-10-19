"
"-------------------------------------------------------------------------------
" "~/.vimrc" Konfigurations-Datei fuer den Vim   (C) 2005 T.Birnthaler OSTC GmbH
" (analog "~/.exrc" für den echten Vi und "~/.gvimrc für Gvim)
"-------------------------------------------------------------------------------
" Kommentar wird durch " eingeleitet (nur am Zeilenanfang erlaubt!)
" ACHTUNG: Bei manchen Vi's keine Leerzeile erlaubt! => " Kommentar nehmen
"-------------------------------------------------------------------------------
"
"
" PATHOGEN 
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" set the leader
let mapleader = ","

" open Nertree on startup if no argument - sucks in large homedir
" autocmd vimenter * if !argc() | NERDTree | endif
nnoremap <silent> <F4>  :NERDTreeToggle<CR>
"-------------------------------------------------------------------------------
" Vi-Kompatibilität
"-------------------------------------------------------------------------------
" VIM-Zusätze aktivieren (NICHT vi-kompatibles Verhalten!)
set nocompatible

" Eine Vi-Standard-Verhalten doch aktivieren (es gibt über 40 Optionen dafür!)
" $ = "$" an Ende des mit "c" zu ändernden Textes setzen statt ihn löschen
" set cpoptions+=$

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

" Format von Statuszeile und Koordinatenanzeige definieren (hier Std-Werte)
" set statusline=...
" set rulerformat=...

" Datei-Titel in xterm-Titelzeile anzeigen (nicht in allen Terminals mögl.)
set title

" Zeilen NICHT nummeriert darstellen
set nonumber

" Tabulator und Zeilenende NICHT anzeigen (siehe lcs = listchars)
set nolist

" Texte für Anzeige im 'list'-Modus (2 Zeichen bei "tab"!)
" tab      = Tabulator von Whitespace unterscheiden (1. + folgendes Zeichen)
" trail    = Leerzeichen am Zeilenende
" eol      = Zeilenende (normal "$")
" precedes = Zeichen in erster Spalte falls "nowrap" und Zeile zu lang
" extends  = Zeichen in letzter Spalte falls "nowrap" und Zeile zu lang
"set listchars=tab:>.,trail:.,eol:$,precedes:>,extends:<

" Zeilen länger als Bildschirmbreite NICHT in nächste Zeile "umbrechen"
" (sondern "Scrollen")
"set wrap
"set nowrap

" Bei Zeilen länger als Bildschirmbreite:
" * 1 Zeichen breit scrollen, falls Rand erreicht (schnelles Terminal nötig)
" * Mindestens Rand der Breite "sidescrolloff" als Kontextinfo sichtbar lassen
"set sidescroll=1
"set sidescrolloff=0

" Bei Fehlern (z.B. 2x ESC) nicht piepsen, sondern visuelle Anzeige
set noerrorbells
set visualbell

" Zeilenanfangmarkierung für zu lange Zeilen, die umgebrochen dargestellt werden
"set showbreak=>

"-------------------------------------------------------------------------------
" Zeilenumbruch
"-------------------------------------------------------------------------------

" Zu lange Zeilen autom. umbrechen (ab Std-Zeichen in "breakat= ^I!@*-+;:,./?")
"set linebreak
" set breakat

" Bildschirmrand, innerhalb dem während Texteingabe umgebrochen wird (0=aus)
"set wrapmargin=1
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
set nomodeline
set modelines=0

" KEINE Backupdateien erzeugen (Dateiname + "~" dahinter)
set nobackup

"-------------------------------------------------------------------------------
" Such- und Ersetzungs-Optionen
"-------------------------------------------------------------------------------

set grepprg=ack-grep\ -H\ --nocolor\ --nogroup
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

" Eingegebene Tabulatoren NICHT zu Leerzeichen expandieren
set noexpandtab

" Zeige zugeh. öffnende Klammer "([{<" bei Eingabe der korresp. Schließenden
set showmatch

" Klammern, die "%" berücksichtigt (Sprung auf korrespondierende Klammer)
set matchpairs=(:),[:],{:},<:>

" NICHT automatisch einrücken (Ausrichtung an voriger Zeile)
" (STRG-T rückt um 1 Stufe ein, STRG-D rückt um 1 Stufe aus)
set autoindent
set smartindent
set nocopyindent
set nopreserveindent

" Automatisch Einrückung für C-Programme NICHT aktivieren
set nocindent

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
colorscheme peachpuff
"colorscheme default

" Hintergrund-Helligkeit definieren ("dark" oder "light"),
" (das Syntax-Highlighting wird daran angepasst)
set background=light
"set background=dark

" Dateityp festlegen (für Syntax-Highlighting, Autokommandos, ...)
" (normalerweise durch "Extension" oder "Shee-Bang-Zeile" festgelegt)
" Dateityp-Erkennung (Einrücken, Plugins auch)
"set filetype on
"set filetype indent on
"set filetype plugin on
"set omnifunc=...

"-------------------------------------------------------------------------------
" Farben für Syntax-Highlighting selber definieren
"-------------------------------------------------------------------------------

" Statement-Elemente dunkelblau statt gelb (sonst schwer lesbar!)
hi statement ctermfg=darkblue guifg=black

" Variablen schwarz statt gelb (sonst schwer lesbar!)
hi identifier ctermfg=black guifg=black

" Mögliche Farben:
" Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, Brown, DarkYellow,
" LightGray, LightGrey, Gray, Grey, DarkGray, DarkGrey, Blue, LightBlue
" Green, LightGreen, Cyan, LightCyan, Red, LightRed, Magenta, LightMagenta
" Yellow, LightYellow, White
"
" Mögliche Syntax-Gruppen:
" Comment, Constant, Identifier, Statement, PreProc, Type, Special, Underlined
" Ignore, Error, Todo
"
" Dunkler Hintergrund:
" SynColor Comment    term=bold cterm=NONE ctermfg=Cyan ctermbg=NONE gui=NONE guifg=#80a0ff guibg=NONE
" SynColor Constant   term=underline cterm=NONE ctermfg=Magenta ctermbg=NONE gui=NONE guifg=#ffa0a0 gu
" SynColor Special    term=bold cterm=NONE ctermfg=LightRed ctermbg=NONE gui=NONE guifg=Orange guibg=N
" SynColor Identifier term=underline cterm=bold ctermfg=Cyan ctermbg=NONE gui=NONE guifg=#40ffff g
" SynColor Statement  term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=bold guifg=#ffff60 guib
" SynColor PreProc    term=underline cterm=NONE ctermfg=LightBlue ctermbg=NONE gui=NONE guifg=#ff80ff
" SynColor Type       term=underline cterm=NONE ctermfg=LightGreen ctermbg=NONE gui=bold guifg=#60ff60
" hi       type       term=underline cterm=NONE ctermfg=Green ctermbg=NONE gui=bold guifg=#60ff60
" hi       identifier term=underline cterm=NONE ctermfg=Yellow ctermbg=NONE gui=bold guifg=#60ff60
" SynColor Underlined term=underline cterm=underline ctermfg=LightBlue gui=underline guifg=#80a0ff
" SynColor Ignore     term=NONE cterm=NONE ctermfg=black ctermbg=NONE gui=NONE guifg=bg guibg=NONE
" SynColor Error      term=reverse cterm=NONE ctermfg=White ctermbg=Red gui=NONE guifg=White guibg=Red
" SynColor Todo       term=standout cterm=NONE ctermfg=Black ctermbg=Yellow gui=NONE guifg=Blue guibg=
"
" Heller Hintergrund:
" SynColor Comment    term=bold cterm=NONE ctermfg=DarkBlue ctermbg=NONE gui=NONE guifg=Blue guibg=NON
" SynColor Constant   term=underline cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=NONE guifg=Magenta gu
" SynColor Special    term=bold cterm=NONE ctermfg=DarkMagenta ctermbg=NONE gui=NONE guifg=SlateBlue g
" SynColor Identifier term=underline cterm=NONE ctermfg=DarkCyan ctermbg=NONE gui=NONE guifg=DarkC
" SynColor Statement  term=bold cterm=NONE ctermfg=Brown ctermbg=NONE gui=bold guifg=Brown guibg=N
" SynColor PreProc    term=underline cterm=NONE ctermfg=DarkMagenta ctermbg=NONE gui=NONE guifg=Purple
" SynColor Type       term=underline cterm=NONE ctermfg=DarkGreen ctermbg=NONE gui=bold guifg=SeaGreen
" hi       type       term=underline cterm=NONE ctermfg=LightGreen ctermbg=NONE gui=bold guifg=SeaGreen
" SynColor Underlined term=underline cterm=underline ctermfg=DarkMagenta gui=underline guifg=Slate
" SynColor Ignore     term=NONE cterm=NONE ctermfg=white ctermbg=NONE gui=NONE guifg=bg guibg=NONE
" SynColor Error      term=reverse cterm=NONE ctermfg=White ctermbg=Red gui=NONE guifg=White guibg=Red
" SynColor Todo       term=standout cterm=NONE ctermfg=Black ctermbg=Yellow gui=NONE guifg=Blue guibg=

"-------------------------------------------------------------------------------
" Faltung ("zusammenklappen" von Programmteilen) steuern
"-------------------------------------------------------------------------------

" Falten NICHT aktivieren
set nofoldenable

" Spaltenbreite zur Faltungsanzeige (z.B. für Faltungstiefe, -bereich)
set foldcolumn=2
set foldcolumn=0

" Faltungsmethode ("manual", "indent", "expr", "marker", "syntax", "diff")
" (Std: manual, "expr" -> foldexpr-Option, "marker" -> foldmarker-Option)
set foldmethod=syntax

set foldmethod=expr
set foldexpr=0

set foldmethod=marker
set foldmarker={,}

set foldmethod=indent

set foldmethod=manual

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

" 2 Leerzeichen nach ".?!" bei "j=Join" abschalten (durch "compatible" gesetzt)
set nojoinspaces

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

" Welche Zahlenformate (alpha, octal, hex) sollen von den Kommandos zum
" Inkrement (STRG-A) und Dekrement (STRG-X) von Zahlen im Text erkannt werden?
set nrformats=alpha,octal,hex

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

" Complete longest common string, then each full match
" enable this for bash compatible behaviour
" set wildmode=longest,full

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
" map <F10> :set number!<bar>set number?<CR>
nnoremap <F10> :set number!<CR>:set foldcolumn=0<CR>

" Durch mehrere Dateien springen
" (+=nächste Datei, -=vorherige, #=aktuelle schreiben und zu nächster springen)
nnoremap + :n<CR>
nnoremap - :prev<CR>
"map # :w<CR>:n<CR>

" Wort suchen (erstes STRG-W startet Wort-Eingabe, zweites STRG-W startet Suche)
" (Jetzt per <F3>, verdeckte leider die Fenster-Steuerung mit STRG-W!)
" map <C-W> /\<
" map! <C-W> \>/<CR>

" Zeilen länger als 80 Zeichen anzeigen (<CR> = STRG-M)
" nicht benutzt, F soll Funktion markieren
" map F /^.\{81\}<CR>

" Ungewöhnliche Zeichen suchen (außerhalb ASCII-Bereich und Umlauten)
nnoremap X <ESC>/[^ -~äöüÄÖÜß]<CR>
nnoremap Y <ESC>:nohl<CR>

" Absatzumbruch auf 80 Zeichen Breite (im Vim direkt mit "gq..." möglich)
nnoremap K !}fmt -80 -u<CR>
nnoremap K !}fmt -75 -u<CR>
nnoremap K !}fmt -70 -u<CR>

" MSDOS/UNIX-Dateiformat aktivieren
"map D :set ff=dos<CR>
"map U :set ff=unix<CR>

" 80 Zeichen breite Kommentar-Linien ziehen (C und Shell)
"map C O/*<ESC>76a-<ESC>a*/<ESC><CR><ESC>0
"map S O#<ESC>79a-<ESC><CR><ESC>0

" Versehentliches Einschalten des "Ex-Modus" mit "Q" verhindern,
" statt dessen Objekt "neu formatieren" (Objekt wjG)... danach noch angeben)
nnoremap Q gq

"-------------------------------------------------------------------------------
" Eigene Abkürzungen (teilweise deaktiviert)
"-------------------------------------------------------------------------------

" Copyright (<CR> = STRG-M)
"abbr (C) (C) 2007 T.Birnthaler OSTC GmbH<CR>
"abbr (c) (C) 2007 H.Gottschalk OSTC GmbH<CR>

" Abkürzungen für HTML/PHP (<TAB> = Tabulator, <ESC> = Escape)
"abbr HHH <!-- Kommentar --><CR><CR><HTML><CR><TAB><HEAD><CR><TAB><TAB><TITLE>Titel</TITLE><CR><TAB></HEAD><CR><TAB><BODY><CR><?php<CR><TAB>Code<CR>?><CR><TAB></BODY><CR></HTML><CR><ESC>?\(Kommentar\\|Titel\\|Code\)<CR>h
"abbr SELF <?=$_SERVER[PHP_SELF]?>
"abbr PHP <?php<CR><TAB>Code<CR>?><CR><ESC>?Code<CR>h
"abbr php <?php Code ?><ESC>?Code<CR>h
"abbr ggg <TAB><TAB><FORM ACTION="xxx.php" METHOD="GET"><CR><TAB><TAB><TAB>Vorname:  <INPUT TYPE="text" NAME="vorname"><BR><CR><TAB><TAB><TAB>Nachname: <INPUT TYPE="text" NAME="nachname"><BR><CR><TAB><TAB><TAB><INPUT TYPE="submit" VALUE="GO!"><BR><CR><TAB><TAB></FORM><CR><ESC>?xxx<CR>h
"abbr ppp <TAB><TAB><FORM ACTION="xxx.php" METHOD="PUT"><CR><TAB><TAB><TAB>Vorname:  <INPUT TYPE="text" NAME="vorname"><BR><CR><TAB><TAB><TAB>Nachname: <INPUT TYPE="text" NAME="nachname"><BR><CR><TAB><TAB><TAB><INPUT TYPE="submit" VALUE="GO!"><BR><CR><TAB><TAB></FORM><CR><ESC>?xxx<CR>h
"abbr kkk <!-- Kommentar --><CR><ESC>?Kommentar<CR>h

"-------------------------------------------------------------------------------
" Funktionstasten belegen (per Map, der Funktion aufruft)
" * Funktionsnamen müssen mit einem Grossbuchstaben beginnen!
" * Vor Funktionsaufrufen "call" verwenden (oder in Ausdruck verwenden)
" * Zum Einrücken KEINE TABs verwenden!
"-------------------------------------------------------------------------------
nnoremap <F1>  :call ToggleListMode()<CR>
" nedded otherwise! map <F2>  :call ToggleWrapMode()<CR>
" Wort suchen (erstes <F3> startet Wort-Eingabe, zweites <F3> startet Suche)
nnoremap <F3> /\<
map! <F3> \>/<CR>

nmap     <silent> <unique> <F2> :call Bexec()<CR>
vnoremap     <silent> <unique> <F2> :call BexecVisual()<CR>


" Option "list" aktiv oder nicht? -> Invertieren
function ToggleListMode()
  let &list = ! &list
" Langatmige Alternative
"  if &list == 1
"    let &list = 0
"  else
"    let &list = 1
"  endif
endfunction

" Option "wrap" aktiv oder nicht? -> Invertieren
function ToggleWrapMode()
  let &wrap = ! &wrap
endfunction

" Svens maps n stuff
nnoremap sD :r!date<cr>0i# Datum<tab><tab><esc>0
nnoremap sA o# Autor<tab><tab>Sven Hergenhahn<esc>0
nnoremap sF o# Datei<tab><tab><c-r>%<esc>0
nnoremap sC o<esc>79i#<esc>0
nnoremap sS sCsFsAsDsCo<cr>

"# markiere Funktion (visual)
"map F 0mqf{%v'q

function CommentPerl()
  let myline = getline(".")
  call setline(".", "#" . myline)
  call cursor(line(".")+1, 0)
endfunction

noremap ,5 1GvG= 

" Bufferliste
nnoremap   <F5> :ls<CR>:e #

" Alle Register anzeigen, nach Auswahl einfuegen
fu! RegList()
	reg
	let A=input("#?")
	execute "normal \"".A."p<return>"
endfunction

nnoremap <F6> :call RegList()<cr>


"map C :call CommentPerl()<CR>
nnoremap C @='I#<C-V><esc>j'<cr>

autocmd FileType perl source ~/.vim/svh_perl

" set up syntax highlighting for my e-mail
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail 

set fileformat=unix
set autochdir

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

command! -nargs=1 Run     call RunCmd(<q-args>)
command!          RunPerl call RunCmd("/usr/bin/perl")


" make tab in v mode ident code
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" visually select to matching delimiter
noremap % V% 

" aspell
nnoremap  :w!<CR>:!aspell check %<CR>:e! %<CR>
"map  \1\2<CR>:e! %<CR>
"map \1 :w!<CR>
"map \2 :!newsbody -qs -n % -p aspell check \%f<CR>

noremap <silent> <F12> :cal VimCommanderToggle()<CR> 

filetype plugin indent on

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
nnoremap <Leader>p :MiniBufExplorer<cr>
" Zum nächsten Fenster wechseln:
nnoremap <C-j> :MBEbn<CR>
" " Zum vorherigen Fenster wechseln:
nnoremap <C-k> :MBEbp<CR>

" TaskList & TagList
nnoremap T :TaskList<CR>
nnoremap _t :TlistToggle<CR>

" no swap file (tilde files)
" set uc=0

let VCSCommandResultBufferNameExtension = ".vcs"
let VCSCommandDeleteOnHide = 1

" mutt stuff
autocmd BufRead /tmp/mutt*[0-9] normal :g/^> --\s\=$/,/^$/-1d

au FileType python set omnifunc=pythoncomplete#Complete
autocmd BufNewFile,BufRead *.py compiler python

if (v:version >= 700) 
	highlight SpellBad      ctermfg=Red         term=Reverse        guisp=Red       gui=undercurl   ctermbg=White 
	highlight SpellCap      ctermfg=Green       term=Reverse        guisp=Green     gui=undercurl   ctermbg=White 
	highlight SpellLocal    ctermfg=Cyan        term=Underline      guisp=Cyan      gui=undercurl   ctermbg=White 
	highlight SpellRare     ctermfg=Magenta     term=underline      guisp=Magenta   gui=undercurl   ctermbg=White 
endif " version 7+ 

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

" reread docfiles, although most should now be in bundles
:helptags ~/.vim/doc/

autocmd FileType cf3 set tabstop=2 shiftwidth=2 smarttab expandtab softtabstop=2 autoindent
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

" Do make with different makeprg settings.
" Error lists from each makeprg are combined into one quickfix list.
command! Pycheck call DoMake('pyflakes', 'pep8')
function! DoMake(...)
  update  " save any changes because makeprg checks the file on disk
  let savemp = &makeprg
  let qflist = []
  for prg in a:000
    let &makeprg = prg . ' %'
    silent make!
    let qflist += getqflist()
  endfor
  if empty(qflist)
    cclose
  else
    call setqflist(qflist)
    copen
    cfirst
  endif
  let &makeprg = savemp
endfunction

" SuperTab settings
let g:SuperTabLongestEnhanced=1
let g:SuperTabLongestHighlight=1

" svndiff stuff http://www.vim.org/scripts/script.php?script_id=1881
hi DiffAdd      ctermfg=0 ctermbg=2 guibg='green'
hi DiffDelete   ctermfg=0 ctermbg=1 guibg='red'
hi DiffChange   ctermfg=0 ctermbg=3 guibg='yellow'


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
nnoremap <up> :echo "stupid"<cr>
nnoremap <down> :echo "stupid"<cr>
nnoremap <left> :echo "stupid"<cr>
nnoremap <right> :echo "stupid"<cr>
inoremap <up> <esc>:echo "stupid"<cr>
inoremap <down> <esc>:echo "stupid"<cr>
inoremap <left> <esc>:echo "stupid"<cr>
inoremap <right> <esc>:echo "stupid"<cr>

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
" set statusline=%=buffers:\ %{buftabs#statusline()}

:set statusline+=%=        " Switch to the right side
:set statusline+=%l        " Current line
:set statusline+=/         " Separator
:set statusline+=%L        " Total lines
