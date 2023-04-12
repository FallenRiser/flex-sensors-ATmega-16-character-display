$regfile = "m16def.dat"
$crystal = 8000000

Config Adc = Single , Prescaler = Auto

Dim A As Word
Dim B As Word
Dim C As Word

Dim Rcvd As String * 20

Config Serialin = Dummy

Open "com1:" For Binary As #1
Cls

Do
    Adc 0 , A
    Adc 1 , B
    Adc 2 , C

    If A > 900 And A < 1023 Then
        If B > 800 And B < 900 Then
            If C > 950 And C < 1023 Then
                Exec "calc.exe" , 1 'opens the Windows calculator
                Waitms 2000
                Rcvd = Rcvd + "C"
            End If
        ElseIf B > 700 And B < 800 Then
            If C > 950 And C < 1023 Then
                Exec "notepad.exe" , 1 'opens the Windows notepad
                Waitms 2000
                Rcvd = Rcvd + "D"
            End If
        ElseIf B > 600 And B < 700 Then
            If C > 950 And C < 1023 Then
                Exec "mspaint.exe" , 1 'opens the Windows paint
                Waitms 2000
                Rcvd = Rcvd + "E"
            End If
        End If
    ElseIf A > 800 And A < 900 Then
        If B > 800 And B < 900 Then
            If C < 900 Then
                Exec "explorer.exe" , 1 'opens the Windows explorer
                Waitms 2000
                Rcvd = Rcvd + "A"
            End If
        ElseIf B > 700 And B < 800 Then
            If C < 900 Then
                Exec "cmd.exe" , 1 'opens the Windows command prompt
                Waitms 2000
                Rcvd = Rcvd + "B"
            End If
        End If
    End If

    If Loc(1) Then
        Input #1 , Rcvd
        Select Case Rcvd
            Case "A" : Exec "explorer.exe" , 1 'opens the Windows explorer
            Case "B" : Exec "cmd.exe" , 1 'opens the Windows command prompt
            Case "C" : Exec "calc.exe" , 1 'opens the Windows calculator
            Case "D" : Exec "notepad.exe" , 1 'opens the Windows notepad
            Case "E" : Exec "mspaint.exe" , 1 'opens the Windows paint
        End Select
    End If

    Waitms 50
Loop
