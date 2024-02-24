$regfile = "m32def.dat"
$crystal = 8000000

config lcd = 16*2
config lcdpin = 12, db4=portc.1, db5=portc.2, db6=portc.3, db7=portc.4, e=portd.2, rs=portd.3
ddrd.5=0:portd.5=1
ddrd.4=0:portd.4=1

deflcdchar 1,32,32,32,21,21,31,32,32 'replace [X] with number (0-7)
deflcdchar 2,8,8,8,8,8,15,32,32  'replace [X] with number (0-7)
deflcdchar 3,32,32,7,4,4,31,32,32   'replace [X] with number (0-7)
deflcdchar 4,32,12,32,17,17,31,32,32   'replace [X] with number (0-7)

declare sub hour
declare sub minute
dim S as byte
dim M as byte
dim H as byte

clock:
S = 0
M = 0
H = 1
cls
home
lcd chr(4)
lcd chr(3)
lcd chr(2)
lcd chr(1)

do
   if pind.4 = 0 then
      call minute
   endif
   if pind.5 = 0 then
      call hour
   endif

   locate 2,1
   lcd "";H;":";M;":";S;
   waitms 112
   incr S
   if S>59 then
       S = 0
       incr M
       lcd ""
       if M>59 then
           goto clock
       endif
   endif
loop
end

Minute:
incr M
if M>59 then
    M=0
endif
return

Hour:
incr H
if H>12 then
    H=1
endif
return
