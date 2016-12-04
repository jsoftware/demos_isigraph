NB. screen messer

require 'gl2'
coinsert 'jgl2'

qtmajor=: 0 ". ({.~ i.&'.') '/s' -.~ (}.~ i.&'/') wd 'version'

COUNT=: 0
SIZE=: 40 40
DIR=: 1 1
MAX=: 1000-SIZE
POS=: ?MAX
COLORS=: ?500 3$255

NB. =========================================================
ROLLER=: 0 : 0
pc roller owner;pn "Screen Roller";
cc g isidraw flush;
set g minwh 400 400;
pas 0 0;pcenter;
)

NB. =========================================================
roller_close=: 3 : 0
wd 'pclose'
try.
  ISDEMOSEL=: ISDEMOSELOLD
  isdemo_run''
catch. end.
)

roller_cancel=: roller_close

NB. =========================================================
smupdate=: 3 : 0
wd 'psel roller'
w=. GSIZE%1000
COUNT=: >:COUNT
POS=: POS+DIR*?40 36
DIR=: DIR*_1^(POS<0)+.MAX<POS
POS=: POS+(+: 0>.-POS)-+:0>.POS-MAX
glbrush glrgb (?500){COLORS
glellipse (POS*($POS)$w),SIZE
glpaintx^:IFQT ''
)

NB. =========================================================
smesser=: 3 : 0
wd ROLLER
wd 'pshow'
GSIZE=: glqwh''
glfill 255 255 255 255
if. 5=qtmajor do.
  for_i. i.1000 do. wd'msgs' end.  NB. wait for form to display
end.
while. COUNT<('Android'-:UNAME){2000 1000 do.
  smupdate''
end.
)

smesser''
