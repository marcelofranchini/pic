#include <16F628A.h>
#fuses XT, NOMCLR, NOWDT
#use delay(clock=4MHz)

int8 segmentos[] = {
   0b00111111, 0b00000110, 0b01011011, 0b01001111,
   0b01100110, 0b01101101, 0b01111100, 0b00000111,
   0b01111111, 0b01100111
};

void main () {

   int numero = 0;   
   while (true) {
      output_b( segmentos[numero] );
      numero++;
       if (numero > 9) {
        numero = 0;
      }
      delay_ms(1000);
   }
}




















/*void  main () {
   




#include <16F628.h>
#fuses XT, NOWDT, NOPROTECT, NOPUT
#use delay( clock=4MHz )
void main () {
   int btn1 = 0;
   int btn2 = 0;
   
   while (true) {
       if (!input(PIN_A1)) {
         btn1 = !btn1;
         while(!input(PIN_A1));
       }
       if (!input(PIN_A2)) {
         btn2 = !btn2;
         while(!input(PIN_A2));
       }
       
       if (btn1 == 0 && btn2 == 0) {
         delay_ms(100);
       }
       
       if (btn1 == 0 && btn2 == 1) {
         delay_ms(500);
       }
       
       if (btn1 == 1 && btn2 == 0) {
         delay_ms(1000);
       }
       
       if (btn1 == 1 && btn2 == 1) {
         delay_ms(2000);
       }
       
       output_toggle(PIN_B0);
   }
   
}*/
