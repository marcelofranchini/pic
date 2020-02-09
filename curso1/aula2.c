#include <16F628A.h>
#fuses XT
#use delay( clock=4MHz )

void  main () {
   
   int1 btn1;
   int1 btn2;
   
   while(true) {
      btn1 = input( PIN_A0 );
      output_bit( PIN_B0, btn1 );
      
      btn2 = input ( PIN_A1 );
      if (btn2 == 0) {
         output_bit (PIN_B1, 1 );
      } else {
         output_bit (PIN_B1, 0 );
      }
   }
   
}
