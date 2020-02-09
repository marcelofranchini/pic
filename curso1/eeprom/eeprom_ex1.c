#include <16F628A.h>
#fuses XT
#use delay( clock=4MHz )

void  main () {
   float
   int addr = 0;
   unsigned int valor;
   
   valor = read_eeprom(addr);
   if (valor == 0) {
      write_eeprom(addr, 130);
   } else {
      write_eeprom(addr, valor - 1);
   }   
   output_b(valor);
     
   while (true) {
      
   }
   
   
}

