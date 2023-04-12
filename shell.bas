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
Lcd C

Locate 2 , 6
Lcd A

Locate 2 , 11
Lcd B

Locate 1 , 1


If A > 1000 And B > 1000 And C > 900 Then
Cls
X1 = 0

'Elseif A <= 1000 And A > 900 And B > 1000 And C > 900 And X1 = 0 Then
'A1 = "A"
'Rcvd = Rcvd + A1
'Cls
'Lcd Rcvd
'Print "A"
'X1 = 1
'X2 = 0


'Elseif A <= 1000 And A > 900 And B > 1000 And C < 900 And X1 = 0 Then
'A1 = "B"
'Rcvd = Rcvd + A1
'Cls
'Lcd Rcvd
'Print "B"
'X1 = 1

'Elseif A <= 900 And A > 800 And B > 1000 And C > 900 And X1 = 0 Then
'A1 = "C"
'Rcvd = Rcvd + A1
'Cls
'Lcd Rcvd
'Print "C"
'X1 = 1

'Elseif A <= 800 And A > 700 And B > 1000 And C < 900 And X1 = 0 Then
'A1 = "D"
'Rcvd = Rcvd + A1
'Cls
'Lcd Rcvd
'Print "D"
'X1 = 1

'Elseif A <= 700 And A > 600 And B > 1000 And C > 900 And X1 = 0 Then
'A1 = "E"
'Rcvd = Rcvd + A1
'Cls
'Lcd Rcvd
'Print "E"
'X1 = 1

'Elseif A <= 600 And A > 500 And B > 1000 And C < 900 And X1 = 0 Then
'A1 = "E"
'Rcvd = Rcvd + A1
'Cls
'Lcd Rcvd
'Print "E"
'X1 = 1
ElseIf A > 800 And A < 900 Then
        If B > 800 And B < 900 Then
            If C < 900 Then
                Lcd "E"
                Wait 2
                Rcvd = Rcvd + "E"
            End If
        End If
    ElseIf A > 700 And A < 800 Then
        If B > 500 And B < 600 Then
            If C > 950 And C < 1023 Then
                Lcd "G"
                Wait 2
                Rcvd = Rcvd + "G"
            End If
        ElseIf B > 600 And B < 700 Then
            If C > 950 And C < 1023 Then
                Lcd "F"
                Wait 2
                Rcvd = Rcvd + "F"
            End If
        End If
    ElseIf A > 600 And A < 700 Then
        If B > 800 And B < 900 Then
            If C > 950 And C < 1023 Then
                Lcd "D"
                Wait 2
                Rcvd = Rcvd + "D"
            End If
        End If
    ElseIf A > 500 And A < 600 Then
        If B > 800 And B < 900 Then
            If C < 900 Then
                Lcd "A"
                Wait 2
                Rcvd = Rcvd + "A"
            End If
        ElseIf B > 600 And B < 700 Then
            If C < 900 Then
                Lcd "B"
                Wait 2
                Rcvd = Rcvd + "B"
            End If
        End If
    End If

    If Len(Rcvd) = 6 Then ' If 6 characters are received
        ' Process the received message
        ' ...
        Rcvd = "" ' Reset the received message
    End If


Loop
End