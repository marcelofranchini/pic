#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic 16/Aula4_Pic12_.c"


 void main() {
 ANSEL = 0x00;
 CMCON = 7;
 TRISIO0_bit = 1;
 TRISIO1_bit = 0;

 GPIO = 0;

 while(1){

 if( GPIO.F0 == 1) {
 GPIO.F1 =1;
 delay_ms(2000);
 } else{

 GPIO.F1 = 0;
 }

 }

}
