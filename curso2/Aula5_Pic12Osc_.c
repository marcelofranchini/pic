void main() {

     ANSEL = 0; // portas digitais
     CMCON = 7; //desativa comparadores
     
     TRISIO0_bit = 0; // saida
     TRISIO1_bit = 0; // saida
     
     GPIO = 0;  //low
     
     
     while(1){
     
     GPIO.F0 = 1;
     delay_ms(10);
     GPIO.F0 = 0;
     delay_ms(10);
     
     GPIO.F1 = 1;
     delay_ms(1);
     GPIO.F1 = 0;
     delay_ms(1);
     
     
     
     }

}