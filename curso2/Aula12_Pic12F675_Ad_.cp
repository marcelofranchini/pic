#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula12_Pic12F675_Ad_.c"





int leitura = 0;
void main() {
 ANSEL = 0b00000001;
 ADCON0 = 1;
 CMCON = 7;


 TRISIO = 0b00000001;
 GPIO = 0;

 while(1){
 leitura = ADC_Read(0);

 if(leitura > 0){
  GPIO.F1  = 0;
  GPIO.F2  = 0;
  GPIO.F4  = 0;
  GPIO.F5  = 0;
 } if(leitura > 204){
  GPIO.F1  = 1;
  GPIO.F2  = 0;
  GPIO.F4  = 0;
  GPIO.F5  = 0;
 } if(leitura > 408){
  GPIO.F1  = 1;
  GPIO.F2  = 1;
  GPIO.F4  = 0;
  GPIO.F5  = 0;
 } if(leitura > 612){
  GPIO.F1  = 1;
  GPIO.F2  = 1;
  GPIO.F4  = 1;
  GPIO.F5  = 0;
 } if(leitura > 816){
  GPIO.F1  = 1;
  GPIO.F2  = 1;
  GPIO.F4  = 1;
  GPIO.F5  = 1;
 }
 delay_ms(100);
 }


}
