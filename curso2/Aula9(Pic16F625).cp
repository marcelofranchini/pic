#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula9(Pic16F625).c"






 int numbers;

void main()
{
 CMCON = 7;
 TRISA = 3;
 TRISB = 0;

 PORTA = 3;
 PORTB = 0;

 while(1)
 {
 numbers = rand();

  RA3_bit  = numbers;

  RA2_bit  = ~ RA3_bit ;

 while( RA3_bit )
 {
 if( RA1_bit  == 0)  RA3_bit  = 0;
 delay_ms(70);
 }

 while( RA2_bit )
 {
 if( RA0_bit  == 0)  RA2_bit  = 0;
 delay_ms(70);
 }

 delay_ms(500);


 }


}
