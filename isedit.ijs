NB. edit isigraph definition

coclass 'jigdemoedit'
coinsert 'jigdemo wdbase'
droidwd_run=: isedit_run

ISEDFONTSZ=: ''
ISEDTEXT=: ''

ISEDIT=: 0 : 0
pc isedit closeok;
bin vh;
cc minus button;cn "&<<";
cc plus button;cn "&>>";
bin s;
cc redisplay button;cn "&Redisplay";
cc cancel button;cn "&Cancel";
bin z;
wh 400 200;cc graf editm;
bin z;
pas 0 0;
rem form end;
)

NB. argument is definition
isedit_run=: 3 : 0
y=. ISDEMODAT_jigdemo_
if. 0=#ISEDFONTSZ do.
  getfontsize=. 13 : '{.1{._1 -.~ _1 ". y'
  ISEDFONT=: FIXFONT
  ISEDFONTSZ=: getfontsize ISEDFONT
end.
if. wdisparent 'isedit' do.
  wd 'psel isedit'
else.
  wd ISEDIT
  wd 'setfont graf ',ISEDFONT
end.
wd 'set graf text *',y
wd 'setfocus graf'
wd 'pshow'
)

isedit_cancel_button=: 3 : 0
ISEDTEXT_jigdemo_=: graf
wd 'pclose'
try. wd 'psel isdemo' catch. end.
)

isedit_close=: isedit_cancel_button

isedit_redisplay_button=: 3 : 0
if. ISDEMOSEL_jigdemo_-:'PAINT' do.
  sminfo 'J Graphics';'not applicable' return.
end.
if. (('Android'-:UNAME)>IFQT) do.
  sminfo 'J Graphics';'This demo is for desktop versions only' return.
end.
ISEDTEXT=: graf
try.
  wd 'psel isdemo'
  isdemo_run1_jigdemo_ ISEDTEXT
  ISDEMODAT=: ISEDTEXT
  glpaint`glpaintx@.(('Android'-:UNAME)>IFQT)''
  wd 'psel isedit;setfocus graf'
catch.
  sminfo 'error in graph definition'
  return.
end.
)

isedit_minus_button=: 3 : 0
1 >. ISEDFONTSZ=: <:ISEDFONTSZ
ISEDFONT=: ISEDFONTSZ setfontsize ISEDFONT
wd 'setfont graf ',":ISEDFONT
)

isedit_plus_button=: 3 : 0
ISEDFONTSZ=: >:ISEDFONTSZ
ISEDFONT=: ISEDFONTSZ setfontsize ISEDFONT
wd 'setfont graf ',":ISEDFONT
)

isedit_rctrl_fkey=: 3 : 0
if. 0= wdquery`0:@.('Android'-:UNAME) 'isedit';'OK to recover definition?' do.
  wd 'set graf *',freads tolower ISDEMOPATH,ISDEMOSEL,'.ijs'
end.
)

isedit_sctrl_fkey=: 3 : 0
if. 0= wdquery`0:@.('Android'-:UNAME) 'isedit';'OK to save definition?' do.
  graf fwrites tolower ISDEMOPATH,ISDEMOSEL,'.ijs'
end.
)
