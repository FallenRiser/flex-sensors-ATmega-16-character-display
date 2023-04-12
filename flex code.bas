$regfile = "m16def.dat"
$crystal = 8000000






$hwstack = 32
$swstack = 8
$framesize = 24
Dim N As Word


Config Lcdpin = Pin , E = Portc.4 , Rs = Portc.5 , Db4 = Portc.3 , Db5 = Portc.2 , Db6 = Portc.1 , Db7 = Portc.0
Config Lcd = 16 * 2



Dim S1 As Single
Dim S2 As Single
Dim A1 As Integer

Config Single = Scientific , Digits = 2

Dim A As Integer
Dim W1 As Word
Dim W2 As Word
Dim W3 As Word
Dim W4 As Word
Dim W5 As Word
Dim B As Integer
Dim T As Integer

Config Adc = Single , Prescaler = Auto , Reference = Avcc
Start Adc
Enable Adc
Cls
Lcd "cccc"
Wait 1





Config Portb.2 = Output
Config Portb.0 = Output
Config Portb.1 = Output



Do
Cls
Locate 1 , 1
W1 = Getadc()
Lcd W1
Locate 1 , 6
W2 = Getadc(1)
Lcd W2
Locate 1 , 11
W3 = Getadc(2)
Lcd W3
Locate 2 , 1
W4 = Getadc(3)
Lcd W4
Locate 2 , 6
W5 = Getadc(4)
Lcd W5
Waitms 300
Loop
End