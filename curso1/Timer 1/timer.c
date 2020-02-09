#include <16F628A.h>
#fuses XT, MCLR, NOWDT
#use delay(clock = 4MHZ)




int contador = 0;

#INT_TIMER0
void interrupcao_t0(){
     clear_interrupt(INT_TIMER0);
     
     if(contador == 10){
     output_toggle(PIN_B2);
     contador = 0;
     }

      contador++;
}


void main() {
      
      enable_interrupts(GLOBAL); // chave geral de interrup��es.
      enable_interrupts(INT_TIMER0);
   
      setup_timer_0(T0_INTERNAL | T0_DIV_128); // t0_internal � a fonte do clock, prescaler 1 nao tem, vai at� 256(pausa maior).. | bit a bit
   
   
      while(true) {
      output_toggle(PIN_B0);
      delay_ms(1000);
      
      }

}
