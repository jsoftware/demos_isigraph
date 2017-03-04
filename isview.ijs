NB. Isigraph viewer

require ' viewmat'

coclass 'jigdemo'
coinsert 'jgl2 jisigraph qtprinter'

load '~addons/demos/isigraph/iscolor.ijs'

onStart=: isdemo

NB. include evolute in-line
e0=. }: @ (2: # >:@i.)
e1=. <: @ +: $ _1: , ] , 1: , -
e2=. _1 & |. @ (e0 # e1)
evolute=: ,~ $ /: @ (+/\) @ e2 f.

HWNDP=: 0

clean=: 13 : 'y * 1e_10 <: |y'
mp=: +/ .*
viewimg=: gshow

NB. =========================================================
NB. getimg v get current graphics window as bitmap
getimg=: 3 : 0
box=. 0 0,glqwh''
(3 2 { box) $ glqpixels box
)

NB. =========================================================
ISTYPE=: 0
locVM=: conew 'jviewmat'
j=. 'TITLE 1 EVOLUTE1 1 EVOLUTE2 1'
j=. j,' SIERCAR1 1 SIERCAR2 1 SIERTRI1 1 SIERTRI2 1 SIERTRI3 1 SIERTRI4 1'
j=. j,' PLASMA1 1 FRIEZE1 1 IFS1 1 IFS2 1'
j=. j,' KOCH 1 POLYGON 1 SPIRALS 1'
j=. j,' POWER 1 SINES 1'
j=. j,' PAINT 2 SMESSER 1'
j=. _2 [\ ;:j
ISDEMONAMES=: {."1 j
ISDEMOTYPE=: ". &> {:"1 j

ISDEMOVER=: 1.9
ISDEMOSEL=: 'TITLE'
ISDEMOPATH=: jpath '~addons/demos/isigraph/'

ISHANDLERS=: <;._2 (0 : 0)
isdemo_g_char
isdemo_g_mbldown
)

NB. =========================================================
OPENISDEMO=: 0 : 0
pc isdemo;pn "J Graphics";
menupop "&Options";
menu view "&View Definition";
menusep ;
menu saveimg "&Save ~temp/isdemo.png";
menusep ;
menu print "&Print";
menusep ;
menu exit "E&xit" "Ctrl+Q";
menupopz;
menupop "&Basic";
menu MTITLE "Isigraph Graphics";
menusep ;
menu MEVOLUTE1 "E&volute 1";
menu MEVOLUTE2 "E&volute 2";
menupopz;
menupop "&IFS";
menupop "&Sierpinski";
menu MSIERCAR1 "&Carpet 1";
menu MSIERCAR2 "&Carpet 2";
menusep ;
menu MSIERTRI1 "&Triangle 1";
menu MSIERTRI2 "&Triangle 2";
menu MSIERTRI3 "&Triangle 3";
menu MSIERTRI4 "&Triangle 4";
menupopz;
menusep ;
menu MPLASMA1 "&Plasma Cloud 1";
menu MFRIEZE1 "&Frieze Pattern 1";
menusep ;
menu MIFS1 "&IFS1";
menu MIFS2 "&IFS2";
menupopz;
menupop "&Shapes";
menu MKOCH "&Koch";
menu MPOLYGON "&Polygon";
menu MSPIRALS "&Spirals";
menu MPOWER "&Power";
menu MSINES "&Sines";
menupopz;
menupop "&Extras";
menu MPAINT "&Paint";
menusep ;
menu MSMESSER "&Screen Roller";
menupopz;
menupop "&Help";
menu MF12 "&F12 Next" "F12";
menu MF12S "&Shift F12 Previous" "Shift+F12";
menusep ;
menu about "&About";
menupopz;
minwh 398 398;cc g isidraw flush;
pas 0 0;
rem form end;
)

OPENISDEMOJA=: 0 : 0
pc isdemo;pn "J Graphics";
menupop "&Options";
menu view "&View Definition";
menusep ;
menu saveimg "&Save ~temp/isdemo.png";
menusep ;
menu exit "E&xit" "Ctrl+Q";
menupopz;
menupop "&Basic";
menu MTITLE "Isigraph Graphics";
menusep ;
menu MEVOLUTE1 "E&volute 1";
menu MEVOLUTE2 "E&volute 2";
menupopz;
menupop "&IFS";
menupop "&Sierpinski";
menu MSIERCAR1 "&Carpet 1";
menu MSIERCAR2 "&Carpet 2";
menusep ;
menu MSIERTRI1 "&Triangle 1";
menu MSIERTRI2 "&Triangle 2";
menu MSIERTRI3 "&Triangle 3";
menu MSIERTRI4 "&Triangle 4";
menupopz;
menusep ;
menu MPLASMA1 "&Plasma Cloud 1";
menu MFRIEZE1 "&Frieze Pattern 1";
menusep ;
menu MIFS1 "&IFS1";
menu MIFS2 "&IFS2";
menupopz;
menupop "&Shapes";
menu MKOCH "&Koch";
menu MPOLYGON "&Polygon";
menu MSPIRALS "&Spirals";
menu MPOWER "&Power";
menu MSINES "&Sines";
menupopz;
menupop "&Extras";
menu MPAINT "&Paint";
menusep ;
menu MSMESSER "&Screen Roller";
menupopz;
menupop "&Help";
menu MF12 "&F12 Next" "F12";
menu MF12S "&Shift F12 Previous" "Shift+F12";
menusep ;
menu about "&About";
menupopz;
wh _1 _1;cc g isidraw flush;
pas 0 0;
rem form end;
)

OPENISDEMOJN=: 0 : 0
pc6j isdemo;pn "J Graphics";
menupop "&Options";
menu view "&View Definition";
menusep ;
menu saveimg "&Save ~temp/isdemo.png";
menusep ;
menu print "&Print";
menusep ;
menu exit "E&xit" "Ctrl+Q";
menupopz;
menupop "&Basic";
menu MTITLE "Isigraph Graphics";
menusep ;
menu MEVOLUTE1 "E&volute 1";
menu MEVOLUTE2 "E&volute 2";
menupopz;
menupop "&IFS";
menupop "&Sierpinski";
menu MSIERCAR1 "&Carpet 1";
menu MSIERCAR2 "&Carpet 2";
menusep ;
menu MSIERTRI1 "&Triangle 1";
menu MSIERTRI2 "&Triangle 2";
menu MSIERTRI3 "&Triangle 3";
menu MSIERTRI4 "&Triangle 4";
menupopz;
menusep ;
menu MPLASMA1 "&Plasma Cloud 1";
menu MFRIEZE1 "&Frieze Pattern 1";
menusep ;
menu MIFS1 "&IFS1";
menu MIFS2 "&IFS2";
menupopz;
menupop "&Shapes";
menu MKOCH "&Koch";
menu MPOLYGON "&Polygon";
menu MSPIRALS "&Spirals";
menu MPOWER "&Power";
menu MSINES "&Sines";
menupopz;
menupop "&Extras";
menu MPAINT "&Paint";
menusep ;
menu MSMESSER "&Screen Roller";
menupopz;
menupop "&Help";
menu MF12 "&F12 Next" "F12";
menu MF12S "&Shift F12 Previous" "Shift+F12";
menusep ;
menu about "&About";
menupopz;
xywh 0 0 220 200;cc g isigraph;
pas 0 0;
rem form end;
)

NB. menusep ;
NB. menu print "&Print" "" "" "";

NB. =========================================================
adjwh=: 3 : 0
wh0=. y
'w h'=. 2}. ". wd 'qform',((-.IFQT+.IFJA)#'x')
if. (%/wh0) < w%h do.
NB. fit to h
  h1=. h [ w1=. h * (%/wh0)
else.
  w1=. w [ h1=. w % (%/wh0)
end.
if. IFQT+.IFJA do.
  wd 'set g wh ',":w1,h1
else.
  wd 'setxywhx g ',":0 0,w1,h1
end.
)

NB. =========================================================
isdemo=: 3 : 0
wd (1 i.~ IFQT,IFJA){::OPENISDEMO;OPENISDEMOJA;OPENISDEMOJN
HWNDP=: wdqhwndp''
ISDEMOSEL=: ISDEMOSEL,(0=#ISDEMOSEL)#'TITLE'
ISDEMODAT=: fread tolower ISDEMOPATH,ISDEMOSEL,'.ijs'
wd 'pcenter'
wd 'pshow'
if. IFJA do. return. end.
wd 'set M',ISDEMOSEL,((IFQT+.IFJA)#' checked'),' 1'
adjwh 398 398
isdemo_run1 ISDEMODAT
glpaint''
)

NB. =========================================================
NB. jandroid initial display
isdemo_g_resize=: 3 : 0
isdemo_run1 ISDEMODAT
glpaint''
)

NB. =========================================================
isdemo_run=: 3 : 0
if. wdisparent 'isdemo' do.
  if. (-.IFQT) *. (<ISDEMOSEL) e. ;:'PAINT POLYHEDR SMESSER ' do.
    ISDEMODAT=: fread tolower ISDEMOPATH,ISDEMOSEL,'jn.ijs'
  else.
    ISDEMODAT=: fread tolower ISDEMOPATH,ISDEMOSEL,'.ijs'
  end.
  if. (-. IFJA) do.
    isdemo_run1 ISDEMODAT
    glpaint''
  else.
    if. IFJA *. (<ISDEMOSEL) e. ;:'PAINT ' do.
      wdinfo 'J Graphics';'This demo is for desktop versions only'
      return.
    end.
    glsel 'g'
    isdemo_run1 ISDEMODAT
    glpaint''
  end.
end.
)

NB. =========================================================
isdemo_g_paint=: 3 : 0
if. (<ISDEMOSEL) -.@e. ;:'PAINT SMESSER ' do.
  isdemo_run1 ISDEMODAT
end.
glpaintx^:IFJA ''   NB. asyncj
)

NB. =========================================================
isdemo_run1=: 3 : 0
wd 'psel isdemo;'
glsel ,'g'
gopen''
0!:100 y
gshow''
)

NB. =========================================================
isdemo_about_button=: 3 : 0
j=. 'Isigraph Graphics Demo V',(4j2 ": ISDEMOVER)
sminfo 'Isigraph Graphics';j
)

NB. =========================================================
NB. prints to the default printer
isdemo_print_button=: 3 : 0
box=. 0 0,glqwh''
cimg=. getimg''
pr=. ,> {.chop wd'qprinters'
if. 0=#pr do. return. end.
glzprinter ({.~ i.&':') pr
dpi=. glzresolution 300
glzstartdoc ''
glzscale 2#dpi%96
glzpixels (96 96 0 0+box),,cimg
glzenddoc''
)

NB. =========================================================
isdemo_default=: 3 : 0
if. 0=wdisparent 'isdemo' do. return. end.
if. systype -: 'button' do.
  name=. }.syschild
  if. (<name) e. ISDEMONAMES do.
    isdemo_showname name
  end.
end.
''
)

NB. =========================================================
isdemo_f12_fkey=: 3 : 0
wd 'psel isdemo'
ndx=. (#ISDEMONAMES) | >: ISDEMONAMES i. <ISDEMOSEL
isdemo_showname ndx pick ISDEMONAMES
)

NB. =========================================================
isdemo_f12shift_fkey=: 3 : 0
wd 'psel isdemo'
ndx=. (#ISDEMONAMES) | <: ISDEMONAMES i. <ISDEMOSEL
isdemo_showname ndx pick ISDEMONAMES
)

isdemo_MF12_button=: isdemo_f12_fkey
isdemo_MF12S_button=: isdemo_f12shift_fkey

NB. =========================================================
isdemo_saveimg_button=: 3 : 0
(getimg'') writepng jpath '~temp/isdemo.png'
)

NB. =========================================================
isdemo_showname=: 3 : 0
wd 'set M',ISDEMOSEL,((IFQT+.IFJA)#' checked'),' 0'
ISDEMOSELOLD=: ISDEMOSEL
ISDEMOSEL=: y
ISTYPE=: ISDEMOTYPE {~ ISDEMONAMES i. <y
if. wdisparent 'paint' do.
  wd :: ] 'psel paint;pclose'
  wd 'psel isdemo'
end.
isdemo_run''
)

NB. =========================================================
isdemo_exit_button=: 3 : 0
try. wd^:('Android'-.@-:UNAME) 'psel paint;pclose;' catch. end.
try. wd 'psel isdemo;pclose;' catch. end.
destroy__locVM''
codestroy''
)

NB. =========================================================
isdemo_view_button=: 3 : 0
isedit_run_jigdemoedit_ ''
NB. isedit_run ISDEMODAT
)

NB. =========================================================
gback=: 3 : 0
glbrush glrgb y
glrect 0 0,glqwh''
)

NB. =========================================================
NB. gopen
gopen=: 3 : 0
try.
  wd 'psel isdemo'
catch. return.
end.
glsel 'g'
glclear''
GSIZE=: 0 0, glqwh''
)

NB. =========================================================
gshow=: 3 : 0
try. wd 'psel isdemo'
catch. return. end.
glsel 'g'
glpaint''
0
)

NB. =========================================================
vmat=: 3 : 0
'' vmat y
:
x viewmatcc__locVM y;wdqhwndc 'g'
)

NB. =========================================================
isdemo_close=: isdemo_exit_button

chop=: 3 : 0
y chop~ (' ',LF) {~ LF e. ,y
:
if. 2>#$y
do.
  (<'') -.~ (y e.x) <;._2 y=. y,{.x
else.
  |: &.> y -. {: y=. (*./y e.x) <;._2 |: y=. y,"1 [ 2${.x
end.
)
