NB. edit isigraph definition

coclass 'jigdemo'
coinsert 'jgl2'
ISEDFONTSZ=: ''
ISEDTEXT=: ''

ISEDIT=: 0 : 0
pc isedit closeok;
xywh 0 0 17 10;cc minus button;cn "&<<";
xywh 16 0 17 10;cc plus button;cn "&>>";
xywh 131 0 34 10;cc redisplay button leftmove rightmove;cn "&Redisplay";
xywh 165 0 34 10;cc cancel button leftmove rightmove;cn "&Cancel";
xywh 0 9 200 100;cc graf editm ws_vscroll rightmove bottommove;
pas 0 0;
rem form end;
)

NB. argument is definition
isedit_run=: 3 : 0
if. 0=#ISEDFONTSZ do.
  getfontsize=. 13 : '{.1{._1 -.~ _1 ". y'
  ISEDFONT=: FIXFONT
  ISEDFONTSZ=: getfontsize ISEDFONT
end.
if. wdisparent 'isedit' do.
  wd 'psel isedit'
else.
  wd ISEDIT
  wd 'setfont minus "MS Sans Serif" 8'
  wd 'setfont plus "MS Sans Serif" 8'
  wd 'setfont redisplay "MS Sans Serif" 8'
  wd 'setfont cancel "MS Sans Serif" 8'
  wd 'setfont graf ',ISEDFONT
end.
wd 'set graf *',y
wd 'setfocus graf'
wd 'pshow'
)

isedit_cancel_button=: 3 : 0
ISEDTEXT=: graf
wd 'pclose'
try. wd 'psel isdemo' catch. end.
)

isedit_close=: isedit_cancel_button

isedit_redisplay_button=: 3 : 0
ISEDTEXT=: graf
try.
  wd 'psel isdemo'
  isdemo_run1 graf
  ISDEMODAT=: graf
  wd 'psel isedit;setfocus graf'
catch.
  wdinfo 'error in graph definition'
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
if. 0=2 wdquery 'isedit';'OK to recover definition?' do.
  wd 'set graf *',freads tolower ISDEMOPATH,ISDEMOSEL,'.ijs'
end.
)

isedit_sctrl_fkey=: 3 : 0
if. 0=2 wdquery 'isedit';'OK to save definition?' do.
  graf fwrites tolower ISDEMOPATH,ISDEMOSEL,'.ijs'
end.
)
