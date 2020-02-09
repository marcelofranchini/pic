#include <18F4550.h>
#fuses XT, MCLR, NOWDT
#use delay(clock = 4MHZ)


int contador = 0;

#INT_TIMER0
void interrupcao_t0(){
     clear_interrupt(INT_TIMER0);
     set_timer0(3036);
     output_toggle(PIN_B1);
     
}
     
     


void main() {

      enable_interrupts(GLOBAL); // chave geral de interrupções.
      enable_interrupts(INT_TIMER0);
      
      
      setup_timer_0(T0_INTERNAL | T0_DIV_16);
      set_timer0(3036); 
   
      while(true) {
      
      delay_ms(1000);
      
      }
}
