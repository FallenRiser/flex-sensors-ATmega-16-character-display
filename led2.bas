$regfile = "m16def.dat"
$crystal = 8000000



Config Portb.2 = Output                                     'trigge                                      'echo
Config Portb.0 = Output                                     'output
Config Portb.1 = Output                                     'output



Do
Set Portb.0
Wait 5
Reset Portb.0
Set Portb.1
Wait 10
Reset Portb.1
Set Portb.2
Wait 15
Reset Portb.2
Loop
End