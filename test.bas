$regfile = "m16def.dat"
$crystal = 8000000




Config Lcdpin = Pin , E = Portc.4 , Rs = Portc.5 , Db4 = Portc.3 , Db5 = Portc.2 , Db6 = Portc.1 , Db7 = Portc.0
Config Lcd = 16 * 2


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

Dim X As Single
Dim Y As Integer
Dim Z As Single
Dim P As Single
Dim Q As Single
Dim R As Single
Dim S As Single

Dim A As Integer

Cls
Lcd "Reset"
Wait 1

Do


W = Getadc()
W1 = Getadc(2)
W2 = Getadc(3)
W3 = Getadc(4)
W4 = Getadc(5)
Y = Y + 1
Z = Z + W
P = P + W1
Q = Q + W2
R = R + W3
S = S + W4

If Y = 30 Then


A = Z / 30
B = P / 30
C = Q / 30
D = R / 30
E = S / 30

Y = 0
Z = 0
P = 0
Q = 0
R = 0
S = 0

End If
Locate 1 , 1
Cls
Lcd "40 "
Lcd A
Locate 1 , 9
Lcd B
Locate 1 , 13
Lcd C
Locate 2 , 1
Lcd "36 "
Lcd D
Locate 2 , 7
Lcd "35 "
Lcd E

Waitms 50


Loop
End