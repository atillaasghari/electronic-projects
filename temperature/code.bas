$regfile = "m32def.dat"
$crystal = 8000000

' Configuration for LCD
Config Lcdpin = Pin, Db4 = Portd.4, Db5 = Portd.5, Db6 = Portd.6, Db7 = Portd.7, E = Portd.1, RS = Portd.0
Config Lcd = 16 * 2

' Configuration for ADC
Config Adc = Single, Prescaler = Auto

Start Adc
Cls

Dim X As Byte
Dim W As Single

Cursor Off

Do
    X = Getadc(2)
    W = X / 2.04

    ' Clear display
    Home

    ' Print temperature
    Lcd "Temp is: "; W; "C"

    ' Check for high temperature
    If W > 30 Then
        Home L
        Lcd "High Temp"
    End If

    ' Check for low temperature
    If W < 15 Then
        Lcd "Low Temp"
    End If

Loop

End
