NB. Paint Demo
NB.
NB. simple paint application with mouse and char events

require 'gl2'
coinsert 'jgl2'
tolist=: }. @ ; @: (LF&, @ , @ ": each)

NB. =========================================================
PAINT=: 0 : 0
pc paint;pn "Paint Demo";
menupop "File";
menu clear "Clear";
menusep ;
menu savebmp "&Save ~temp/paint.bmp";
menusep ;
menu exit "E&xit";
menupopz;
bin v;
wh 358 203;cc g isigraph ws_border;
set g stretch 1;
bin hsv;
groupbox "Tools";
bin h;
cc freehand radiobutton;cn "Freehand";
cc line radiobutton group;cn "Line";
cc box radiobutton group;cn "Box";
cc ellipse radiobutton group;cn "Ellipse";
cc text radiobutton group;cn "Text";
bin sz;
groupboxend;
bin h;
groupbox "Colors";
bin vh;
cc red checkbox;cn "Red";
cc green checkbox;cn "Green";
cc blue checkbox;cn "Blue";
bin zsz;
groupboxend;

groupbox "Line width";
bin hv;
cc thick radiobutton;cn "Thick";
cc thin radiobutton group;cn "Thin";
bin szsz;
groupboxend;
bin szzszz;
pas 0 0;pcenter;
rem form end;
)

NB. =========================================================
paint_run=: 3 : 0
D=: DPOS=: 0
p=. PAINT
FONTSIZE=: 30

if. IFUNIX do.
  FONT=: 'Arial'
else.
  FONT=: 'sansserif'
end.

wd p
wd 'pshow;pshow sw_hide'
wdfit''
wd 'set freehand ',freehand=: '1'
paint_clear_button''
wd 'pshow'
)

NB. =========================================================
paint_g_char=: 3 : 0
if. ".text do.
  glfont FONT,' ',":FONTSIZE
  if. sysdata=8{a. do.
    'w h'=. glqextent TEXT
    TEXT=: }: TEXT
    new=. {. glqextent TEXT
    glbrush glrgb 255 255 255
    glpen 1 0
    glrect (DPOS + new,0),(w-new),h
  else.
    TEXT=: TEXT,sysdata
    glrgb 255 * '1'=red,green,blue
    gltextcolor ''
    gltextxy DPOS
    gltext TEXT
  end.
  nxt=. DPOS + ({.glqextent TEXT),0
  glcaret nxt,2,FONTSIZE
  glpaint ''
end.
)

NB. =========================================================
getpos=: 3 : 0
2 {. 0 ". sysdata
)

NB. =========================================================
paint_g_mbldown=: 3 : 0
wd 'setfocus g'
D=: 1
DPOS=: getpos ''
glcapture {. ('1'=freehand,line,box,ellipse,text)#1 2 3 4 0
if. ".text do.
  TEXT=: ''
  glcaret DPOS,2,FONTSIZE
  glpaint ''
end.
)

NB. =========================================================
pen=: 3 : 0
glrgb 255 * '1'=red,green,blue
glpen (2+3*".thick),PS_SOLID
)

NB. =========================================================
paint_g_mblup=: 3 : 0
glcapture 0
D=: 0
p=. getpos ''
q=. DPOS
pen''
glbrushnull''
if. ".line do.
  gllines q,p
elseif. ".box do.
  glrect q,p-q
elseif. ".ellipse do.
  glellipse q,p-q
end.
glpaint ''
)

NB. =========================================================
paint_g_mmove=: 3 : 0
if. D *. ".freehand do.
  pen''
  old=. DPOS
  DPOS=: getpos''
  gllines old,DPOS
  glpaint ''
end.
)

NB. =========================================================
paint_close=: 3 : 0
wd 'pclose'
try.
  wd 'psel isdemo'
catch. end.
)

paint_cancel=: paint_exit_button=: paint_close

NB. =========================================================
paint_clear_button=: 3 : 0
glclear''
glpaint ''
)

NB. =========================================================
paint_savebmp_button=: 3 : 0
(getbmp'') writebmp jpath '~temp/paint.bmp'
)

NB. =========================================================
paint_f12_fkey=: isdemo_f12_fkey
paint_f12shift_fkey=: isdemo_f12shift_fkey

NB. =========================================================
paint_run''
