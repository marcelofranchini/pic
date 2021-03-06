#include <18F4550.h>
#fuses XT, NOMCLR, NOWDT
#use delay(clock=4MHz)

int8 segmentos[] = {
   0b00111111, 0b00000110, 0b01011011, 0b01001111,
   0b01100110, 0b01101101, 0b01111100, 0b00000111,
   0b01111111, 0b01100111
};

int16 numero = 0;
int modo = 0; // 0: configuração; 1: contagem regressiva
int contador = 0;

void ativarDisplay(int pino, int numero) {
   output_bit (PIN_A3, 0);
   output_bit (PIN_A4, 0);
   output_bit (PIN_A5, 0);
   output_bit (PIN_A2, 0);  
   
   output_bit (pino, 1);
   
   output_d( segmentos[numero] );
   delay_ms(25);
}

void mostrarNumero(int16 valor) {
   int unidade;
   int dezena;
   int centena;
   int milhar;
   
   milhar = valor / 1000;
   centena = valor % 1000 / 100;
   dezena = valor % 1000 % 100 / 10;
   unidade = valor % 1000 % 100 % 10;
   
   ativarDisplay (PIN_A2, milhar);
   ativarDisplay (PIN_A3, centena);
   ativarDisplay (PIN_A4, dezena);
   ativarDisplay (PIN_A5, unidade);
}

void main () {
   
   while(true) {
      if (modo == 0) {
           if ( input(PIN_B0) == 0 ) {
               if (numero > 0) {
                  numero--;
               }
               while ( input(PIN_B0) == 0 ) {
                  mostrarNumero (numero);
               }
           }
           if ( input(PIN_B1) == 0 ) {
               if (numero < 9999) {
                  numero++;
               }
               while ( input(PIN_B1) == 0 ) {
                  mostrarNumero (numero);
               }
           }
           if ( input(PIN_B2) == 0) {
               modo = 1; // contagem regressiva
               while ( input(PIN_B2) == 0 ) {
                  mostrarNumero (numero);
               }
           }
      }
      
      if (modo == 1) {
         if (numero > 0) {
            contador++;
            if (contador == 10) {
               numero--;
               contador = 0;
            }
         } else {
            modo = 0; // configuração
         }
      }
     
      mostrarNumero (numero);
   }
   
}
