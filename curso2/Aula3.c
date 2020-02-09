

void main() {
     ANSEL = 0;   // sel das portas analogicas 0 dig 1 ana
     CMCON = 7; // desabilita os comparadores
     TRISIO0_bit = 0;  // saida o0
     TRISIO1_bit = 0; // saida o1
     
     GPIO = 0; // em low todos
     
     while(1){

      GPIO.F0 = 1;
      GPIO.F1 =0;
      delay_ms(500);
      GPIO.F0 = 0;
      GPIO.F1 =1;
      delay_ms(500);
     
     
     }
     
     

}