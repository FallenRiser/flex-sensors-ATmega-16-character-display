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
Dim F1 As Integer
Dim F2 As Integer
Dim F3 As Integer


Dim C1 As Integer
Dim C2 As Integer
Dim C3 As Integer
Dim C4 As Integer
Dim C5 As Integer
Dim C6 As Integer
Dim C7 As Integer
Dim C8 As Integer
Dim C9 As Integer
Dim C10 As Integer
Dim C11 As Integer
Dim C12 As Integer




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
X2 = 0

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

F1 = A
F2 = B
F3 = C

Y = 0
Z = 0
P = 0
Q = 0
X2 = 1
End If
Waitms 40
Loop Until X2 = 1

C1 = F1 - 50
C2 = F1 - 120
C3 = F1 - 230
C4 = F1 - 280
C5 = F2 - 50
C6 = F2 - 250
C7 = F2 - 300
C8 = F2 - 440
C9 = F3 - 50
C10 = F3 - 105
C11 = F3 - 205
C12 = F3 - 405



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


If A > C1 And B > C5 And C > C9 Then
Cls
X1 = 0

Elseif A > C3 And A < C2 And B > C5 And C > C9 And X1 = 0 Then
A1 = "A"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "A"
Print Rcvd
X1 = 1

Elseif A > C4 And A < C3 And B > C5 And C > C9 And X1 = 0 Then
A1 = "B"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "B"
Print Rcvd
X1 = 1

Elseif A < C4 And B > C5 And C > C9 And X1 = 0 Then
A1 = "C"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "C"
Print Rcvd
X1 = 1

Elseif A > C1 And B > C6 And B < C5 And C > C9 And X1 = 0 Then
A1 = "D"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "D"
Print Rcvd
X1 = 1


Elseif A > C1 And B > C8 And B < C7 And C > C9 And X1 = 0 Then
A1 = "E"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "E"
Print Rcvd
X1 = 1

Elseif A > C1 And B < C8 And C > C9 And X1 = 0 Then
A1 = "F"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "F"
Print Rcvd
X1 = 1

Elseif A > C1 And B > C5 And C > C10 And C < C9 And X1 = 0 Then
A1 = "G"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "G"
Print Rcvd
X1 = 1

Elseif A > C1 And B > C5 And C > C12 And C < C11 And X1 = 0 Then
A1 = "H"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "H"
Print Rcvd
X1 = 1

Elseif A > C1 And B > C5 And C < C12 And X1 = 0 Then
A1 = "I"
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "I"
Print Rcvd
X1 = 1


Elseif A > C1 And B < C8 And C < C12 And X1 = 0 Then
A1 = " "
Rcvd = Rcvd + A1
Cls
Lcd Rcvd
Print "White Space"
Print Rcvd
X1 = 1


End If

If Len(rcvd) = 8 Then
Cls
Lcd "Cleared Word"
Rcvd = ""
End If

Loop
End