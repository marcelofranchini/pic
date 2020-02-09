#define S1 GPIO.F0
#define S2 GPIO.F1
#define D1 GPIO.F4
#define D2 GPIO.F5


void leds();


void main() {

     ANSEL = 0; // todos digitais
     CMCON = 7; //desabilita comparadores

     TRISIO0_bit = 1; // entrada
     TRISIO1_bit = 1; // entrada
     TRISIO4_bit = 0; //saída
     TRISIO5_bit = 0; //saída
     S1 = 1;
     S2 = 1;
     D1 = 0;
     D2 = 0;

     while(1){
     leds();
     }


}


 void leds(){
          if(S1 == 0){
          D1 = ~D1;
          delay_ms(400);
          }else if (S2 == 0){
          D2 == ~D2;
          delay_ms(400);
          }
 }
