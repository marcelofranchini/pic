

     void main() {
     ANSEL = 0x00;   // sel das portas -> 0 digital 1 analogica
     CMCON = 7; // desabilita os comparadores
     TRISIO0_bit = 1;  // entrada io0 saida
     TRISIO1_bit = 0; // saida io1    entrada

     GPIO = 0; // em low todos

     while(1){

      if( GPIO.F0 == 1) {
      GPIO.F1 =1;
      delay_ms(2000);
      }  else{

       GPIO.F1 = 0;
     }

     }

}