NB. Paint Demo
NB.
NB. simple paint application

require 'gl2 png'
coinsert 'jgl2'
tolist=: }. @ ; @: (LF&, @ , @ ": each)

PenColor=: 255 0 0
PenWidth=: 4

NB. =========================================================
PAINT=: 0 : 0
pc paint owner;pn "Paint Demo";
menupop "File";
menusep ;
menu saveimg "&Save ~temp/paint.png";
menusep ;
menu exit "E&xit";
menupopz;
menupop "Options";
menu color "Pen &Color...";
menu width "Pen &Width...";
menusep ;
menu clear "Clear &Drawing";
menupopz;
cc g isidraw flush;
pas 0 0;pcenter;
rem form end;
)

NB. =========================================================
paint_run=: 3 : 0
D=: DPOS=: 0
FONTSIZE=: 30
if. IFUNIX do.
  FONT=: 'Arial'
else.
  FONT=: 'sansserif'
end.
wd PAINT
wd 'set g minwh 600 350'
wd 'pshow'
glpaint '' [ glfill ::0: 255 255 255 255
)

NB. =========================================================
paint_g_char=: 3 : 0
return.
if. ".text do.
  glfont FONT,' ',":FONTSIZE
  glfontextent FONT,' ',":FONTSIZE
  if. sysdata=8{a. do.
    'w h'=. glqextent TEXT
    TEXT=: }: TEXT
    new=. {. glqextent TEXT
    glbrush glrgb 255 255 255
    glpen 1 1
    glrect (DPOS + new,0),(w-new),h
  else.
    TEXT=: TEXT,sysdata
    glrgb PenColor
    gltextcolor ''
    gltextxy DPOS
    gltext TEXT
  end.
  nxt=. DPOS + ({.glqextent TEXT),0
  glcaret nxt,2,FONTSIZE
  glpaint''
end.
)

NB. =========================================================
getpos=: 3 : 0
2 {. 0 ". sysdata
)

NB. =========================================================
paint_g_mbldown=: 3 : 0
NB. wd 'setfocus g'
D=: 1
DPOS=: getpos ''
)

NB. glcapture {. ('1'=freehand,line,box,ellipse,text)#1 2 3 4 0
NB. if. ".text do.
NB.   TEXT=: ''
NB.   glcaret DPOS,2,FONTSIZE
NB.   glpaint ''
NB. end.

NB. =========================================================
paint_g_mblup=: 3 : 0
glcapture 0
D=: 0
p=. getpos ''
q=. DPOS
pen''
glbrushnull''
glpaint ''
)

NB. =========================================================
paint_g_mmove=: 3 : 0
if. D do.
  pen''
  old=. DPOS
  DPOS=: getpos''
  gllines old,DPOS
  glpaint ''
end.
)

NB. =========================================================
paint_clear_button=: 3 : 0
glclear''
glpaint ''
)

NB. =========================================================
paint_close=: 3 : 0
wd 'pclose'
try.
  ISDEMOSEL=: ISDEMOSELOLD
  isdemo_run''
catch. end.
)

paint_cancel=: paint_exit_button=: paint_close

NB. =========================================================
paint_color_button=: 3 : 0
r=. wd 'mb color'
if. #r do.
  PenColor=: 0 ". r
end.
)

NB. =========================================================
paint_saveimg_button=: 3 : 0
glsel 'h'
box=. 0 0,glqwh''
img=. (3 2 { box) $ glqpixels box
img writepng jpath '~temp/paint.png'
)

NB. =========================================================
paint_width_button=: 3 : 0
r=. wd 'mb input int Paint "Enter pen width:" 1 1 100 1'
if. #r do.
  PenWidth=: 0 ". r
end.
)

NB. =========================================================
pen=: 3 : 0
glrgb PenColor
glpen PenWidth,PS_SOLID
)

NB. =========================================================
paint_f12_fkey=: isdemo_f12_fkey
paint_f12shift_fkey=: isdemo_f12shift_fkey

NB. =========================================================
paint_run''
