$regfile = "m32def.dat"
$crystal = 8000000
Config Lcdpin = Pin , Db4 = Portd.4 , Db5 = Portd.5 , Db6 = Portd.6 , Db7 = Portd.7 , E = Portd.1 , Rs = Portd.0
Config Lcd = 16 * 2
Config Adc = Single , Prescaler = Auto
Start Adc
Cls
Dim X As Byte
Dim W As Single
Cursor Off
Do
   X = Getadc(2)
   W = X / 68.2
   Home
   Lcd "Volt is:" ; W ; "V"
Loop
End