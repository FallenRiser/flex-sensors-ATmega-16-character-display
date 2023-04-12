$regfile = "M16def.dat"
$crystal = 8000000



Config Lcdpin = Pin , E = Portc.4 , Rs = Portc.5 , Db4 = Portc.3 , Db5 = Portc.2 , Db6 = Portc.1 , Db7 = Portc.0
Config Lcd = 16 * 2

Dim A As Integer






Do

Cls



Lcd "C."                                                    'display this at the top line

                                                   'select the lower line
                                           'display this at the lower line

Wait 1


Shiftlcd Right
Lcd "N"
Wait 1                                                      'shift the text to the right
                                                   'wait a momen



For A = 6 To 12

Shiftlcd Left
Wait 1                                                      'shift the text to the left                                                  'wait a moment

Next






Loop
End