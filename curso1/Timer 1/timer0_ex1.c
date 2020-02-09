#include <16F628A.h>
#fuses XT, MCLR, NOWDT
#use delay(clock=4MHz)

int contador = 0;

#INT_TIMER0
void interrupcao_t0() {
   clear_interrupt(INT_TIMER0);
   if (contador == 10) {
      output_toggle(PIN_B1);
      contador = 0;
   }
   contador++;
}

void main() {

   enable_interrupts(GLOBAL);
   enable_interrupts(INT_TIMER0);
   
   setup_timer_0(T0_INTERNAL | T0_DIV_256);
   
   while (true) {
      output_toggle(PIN_B0);
      delay_ms(1000);
   }   
}
