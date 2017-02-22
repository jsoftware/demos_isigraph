NB. isdemo.ijs

require 'png numeric rgb stats trig general/misc/font'

ISDEMOPATH_z_=: jpath '~addons/demos/isigraph/'
load ISDEMOPATH,'graphmain.ijs'
load ISDEMOPATH,'graphutil.ijs'
load ISDEMOPATH,'isview.ijs'
load ISDEMOPATH,'isedit.ijs'

isdemo_jigdemo_`wd@.IFJA 'activity jigdemo'
