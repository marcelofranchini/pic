#include <18F4550.h>
#fuses HS, NOMCLR, NOWDT
#use delay(clock=20MHz)

#include <lcd.c>

void main () {

   lcd_init();
   
   
      while(true){
   printf(LCD_PUTC, "INDENTIFIQUE-SE ",);
   delay_ms(100);
   printf(LCD_PUTC, "\nNOME: %d ", 25 );
   delay_ms(100);
      }
   

}
