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
