#define S2   RA0_bit
#define S1   RA1_bit
#define led2 RA2_bit
#define led1 RA3_bit
#define servo1

  int numbers;

void main() 
{
   CMCON = 7; //desabilitar os comparadores
   TRISA = 3; //indica que S1 e S2 são entrada digital
   TRISB = 0;
   
   PORTA = 3;
   PORTB = 0;
   
   while(1)
   {
      numbers = rand();

      led1 = numbers;

      led2 = ~led1;

      while(led1)  //enquanto led1 = 1
      {
          if(S1 == 0) 
          led1 = 0;
          delay_ms(70);
      }

      while(led2)
      {
         if(S2 == 0) 
         led2 = 0;
         delay_ms(70);
      }

      delay_ms(500);


   }


}