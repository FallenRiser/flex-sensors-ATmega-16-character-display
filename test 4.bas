$regfile = "m16def.dat"
$crystal = 11059200
$baud = 9600
$hwstack = 32
$swstack = 8
$framesize = 24




Config Lcdpin = Pin , E = Portc.4 , Rs = Portc.5 , Db4 = Portc.3 , Db5 = Portc.2 , Db6 = Portc.1 , Db7 = Portc.0
Config Lcd = 16 * 2

Config Serialout = Buffered , Size = 2
Config Serialin = Buffered , Size = 2
Enable Interrupts



Config Portb.0 = Output
Config Portb.1 = Output
Config Portb.2 = Output
Config Portd.7 = Output



 Cls

 Config Single = Scientific , Digits = 2


Config Adc = Single , Prescaler = Auto , Reference = Internal
Start Adc
Dim W As Word
Dim W1 As Word
Dim W2 As Word
Dim W3 As Word
Dim W4 As Word
Dim B As Integer
Dim C As Integer
Dim D As Integer
Dim E As Integer
Dim X1 As Integer
Dim X2 As Integer
Dim X As Single
Dim Y As Integer
Dim Z As Single
Dim P As Single
Dim Q As Single
Dim R As Single
Dim S As Single

Dim A As Integer

Dim A1 As String * 2 , Rcvd As String * 12
Cls
Lcd "Reset"
Wait 1
Cls

X1 = 600
A = 300

If A >= X1 Then
Lcd "hi"
End If


End