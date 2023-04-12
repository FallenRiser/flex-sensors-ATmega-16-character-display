$regfile = "m16def.dat"
$crystal = 8000000

Dim Adc_Result As Word
Dim Sensor_A As Byte
Dim Sensor_B As Byte
Dim Sensor_C As Byte
Dim Sensor_Val As Byte

Dim Letter_Code As String * 3

Config Lcd = 16 * 2

Config Adc = Single , Prescaler = Auto

Do
 Adc_Result = Getadc(0)
 Sensor_A = Adc_Result / 205

 Adc_Result = Getadc(1)
 Sensor_B = Adc_Result / 205

 Adc_Result = Getadc(2)
 Sensor_C = Adc_Result / 205

 Sensor_Val = (Sensor_A * 100)+(Sensor_B * 10)+Sensor_C

 Select Case Sensor_Val
   Case 0: Letter_Code = "A"
   Case 1: Letter_Code = "B"
   Case 2: Letter_Code = "C"
   Case 3: Letter_Code = "D"
   Case 4: Letter_Code = "E"
   Case 10: Letter_Code = "F"
   Case 11: Letter_Code = "G"
   Case 12: Letter_Code = "H"
   Case 13: Letter_Code = "I"
   Case 14: Letter_Code = "J"
   Case 20: Letter_Code = "K"
   Case 21: Letter_Code = "L"
   Case 22: Letter_Code = "M"
   Case 23: Letter_Code = "N"
   Case 24: Letter_Code = "O"
   Case 30: Letter_Code = "P"
   Case 31: Letter_Code = "Q"
   Case 32: Letter_Code = "R"
   Case 33: Letter_Code = "S"
   Case 34: Letter_Code = "T"
   Case 40: Letter_Code = "U"
   Case 41: Letter_Code = "V"
   Case 42: Letter_Code = "W"
   Case 43: Letter_Code = "X"
   Case 44: Letter_Code = "Y"
   Case 100: Letter_Code = "Z"
 End Select

 Lcdout $fe,1,"Letter: ", Letter_Code

 Waitms 100
Loop
End