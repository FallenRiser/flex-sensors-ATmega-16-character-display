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

Do


W = Getadc()
W1 = Getadc(3)
W2 = Getadc(2)

Y = Y + 1
Z = Z + W
P = P + W1
Q = Q + W2


If Y = 30 Then


A = Z / 30
B = P / 30
C = Q / 30

Y = 0
Z = 0
P = 0
Q = 0

End If
Waitms 40
Locate 2 , 1
Lcd A

Locate 2 , 6
Lcd B

Locate 2 , 11
Lcd C

Locate 1 , 1


If A > 1000 And B > 1000 And C > 1000 Then
Cls
X1 = 0

Elseif A > 800 And A < 1000 And B > 900 And C > 1000 And X1 = 0 Then
A1 = "A"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "A"
Print Rcvd
X1 = 1

Elseif A > 500 And A < 700 And B > 900 And C > 1000 And X1 = 0 Then
A1 = "B"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "B"
Print Rcvd
X1 = 1

Elseif A < 500 And B > 900 And C > 1000 And X1 = 0 Then
A1 = "C"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "C"
Print Rcvd
X1 = 1

Elseif A > 900 And B > 800 And B < 1000 And C > 1000 And X1 = 0 Then
A1 = "D"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "D"
Print Rcvd
X1 = 1


Elseif A > 900 And B > 500 And B < 700 And C > 1000 And X1 = 0 Then
A1 = "E"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "E"
Print Rcvd
X1 = 1

Elseif A > 900 And B < 500 And C > 1000 And X1 = 0 Then
A1 = "F"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "F"
Print Rcvd
X1 = 1

Elseif A > 1000 And B > 1000 And C > 800 And C < 1000 And X1 = 0 Then
A1 = "G"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "G"
Print Rcvd
X1 = 1

Elseif A > 1000 And B > 1000 And C > 500 And C < 700 And X1 = 0 Then
A1 = "H"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "H"
Print Rcvd
X1 = 1

Elseif A > 1000 And B > 1000 And C < 500 And X1 = 0 Then
A1 = "I"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "I"
Print Rcvd
X1 = 1


Elseif A > 700 And A < 800 And B > 700 And B < 800 And C > 700 And C < 800 And X1 = 0 Then
A1 = " "
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "White Space"
Print Rcvd
X1 = 1


End If

If Len(rcvd) = 3 Then
Lcd "Cleared Word"
Rcvd = ""
End If

Loop
End