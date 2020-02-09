#include <18F4550.h>
#fuses HS, NOWDT
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



char teclado [4][3]= { 
      {'1','2','3'},
      {'4','5','6'},
      {'7','8','9'},
      {'*','0','#'}
};


int8 linhas [] = {PIN_D3,PIN_D2,PIN_D1,PIN_D0};
int8 colunas[] = {PIN_B0, PIN_B1, PIN_B2};


char lerTeclado(){
   char tecla = '-';
   
    for (int8 i = 0; i <= 2; i++){
         output_bit(colunas[i], 0);
         
    
         
         for(int8 j = 0; j <=3; j++){
            if (input(linhas[j]) == 0) {
            tecla = teclado[j][i];
            
            }
         }
           
           output_bit(colunas[i],1);
         
    }  
    return tecla;

}

int8 pular(){
   
   if(input(teclado[4][3]) == 0){
   printf(LCD_PUTC,"\f");
   }


}


void main () {


      lcd_init(); 
    
      
      printf(LCD_PUTC,"\fTECLAS:\n");
      delay_ms(100);
      
      
    
      
     

      while(true){
        char leitura = lerTeclado();
      
         if(leitura != '-' ){
         printf(LCD_PUTC,"%c",leitura);
         delay_ms(200);
         } if(leitura == '#'){
         printf(LCD_PUTC,"%c",pular());
         
         
         }
     
      }
      
     
}

    
