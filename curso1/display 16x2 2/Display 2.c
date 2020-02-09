#include <18F4550.h>
#fuses HS, MCLR, NOWDT
#use delay(clock=20MHz)

#define LCD_DB0  PIN_D0
#define LCD_DB1  PIN_D1
#define LCD_DB2  PIN_D2
#define LCD_DB3  PIN_D3
#define LCD_DB4  PIN_D4
#define LCD_DB5  PIN_D5
#define LCD_DB6  PIN_D6
#define LCD_DB7  PIN_D7


#define LCD_E PIN_E1
#define LCD_RS PIN_E2


#include <flex_lcd.c>

int opcao = 0;  // 0 = manual; 1 = semi-autom�tico; 2 = autom�tico;


void executarModo(int op) {

      switch(op){
      
         case 0:
         output_bit(PIN_B5, 0); // desativado
         output_bit(PIN_B6, 0); // desativado
         output_bit(PIN_B7, 1); // ativado
         output_bit(PIN_C1, 1); // buzzer desativado em nv log 1 
         output_bit(PIN_C2, 0); // ventuinha desativada em nv log 0.
         printf(LCD_PUTC, "\fMODO 0:\nMANUAL \n");
         break;
         
         case 1:
         output_bit(PIN_B5, 0); // desativado
         output_bit(PIN_B6, 1); // ativado;
         output_bit(PIN_B7, 1); // ativado
         output_bit(PIN_C1, 0); // buzzer desativado em nv log 1 
         output_bit(PIN_C2, 0); // ventuinha desativada em nv log 0.
         printf(LCD_PUTC, "\fMODO 1:\nBUZZER ATIVADO \n");
         break;
         
         case 2:
         output_bit(PIN_B5, 1); // desativado
         output_bit(PIN_B6, 1); // ativado;
         output_bit(PIN_B7, 1); // ativado
         output_bit(PIN_C1, 1); // buzzer desativado em nv log 1 
         output_bit(PIN_C2, 1); // ventuinha desativada em nv log 0.
         printf(LCD_PUTC, "\fMODO 2:\nCOOLER ATIVADO \n");
         break;
      
      }
}


void main () {


      lcd_init(); 
      executarModo(opcao);

      while(true) {
         if ( input(PIN_B0) == 0) {
            if ( opcao > 0 ) {
            opcao--;
            }
             executarModo(opcao);
            while( input(PIN_B0) == 0); // trava o bot�o.
         }
         
           if ( input(PIN_B1) == 0) {
            if ( opcao < 2) {
            opcao++;
            }
             executarModo(opcao);
            while( input(PIN_B1) == 0);
         }
      }
      
     
}
