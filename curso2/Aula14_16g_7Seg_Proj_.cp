#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula14_16g_7Seg_Proj_.c"


void unidade(char numero);
void dezena(char numero);


 char uni = 0, dez = 0;

void main() {
 TRISA = 0b00000000;
 PORTA = 0b00000000;
 TRISB = 0b00000000;
 PORTB = 0b00000000;
 CMCON = 7;


 while(1){


 uni ++;

 unidade(uni);
 dezena(dez);

 if( uni == 10){
 uni = 0;
 dez ++;
 unidade(uni);
 dezena(dez);

 } if ( dez == 10){

 dez = 0;
 dezena(dez);

 }
 delay_ms(50);

 }

}


 void unidade(char numero){

 switch(numero){

 case 0:
 RB0_bit = 0;
 RB1_bit = 0;
 RB2_bit = 0;
 RB3_bit = 0;
 break;

 case 1:
 RB0_bit = 1;
 RB1_bit = 0;
 RB2_bit = 0;
 RB3_bit = 0;
 break;

 case 2:
 RB0_bit = 0;
 RB1_bit = 1;
 RB2_bit = 0;
 RB3_bit = 0;
 break;

 case 3:
 RB0_bit = 1;
 RB1_bit = 1;
 RB2_bit = 0;
 RB3_bit = 0;
 break;

 case 4:
 RB0_bit = 0;
 RB1_bit = 0;
 RB2_bit = 1;
 RB3_bit = 0;
 break;

 case 5:
 RB0_bit = 1;
 RB1_bit = 0;
 RB2_bit = 1;
 RB3_bit = 0;
 break;

 case 6:
 RB0_bit = 0;
 RB1_bit = 1;
 RB2_bit = 1;
 RB3_bit = 0;
 break;

 case 7:
 RB0_bit = 1;
 RB1_bit = 1;
 RB2_bit = 1;
 RB3_bit = 0;
 break;

 case 8:
 RB0_bit = 0;
 RB1_bit = 0;
 RB2_bit = 0;
 RB3_bit = 1;
 break;

 case 9:
 RB0_bit = 1;
 RB1_bit = 0;
 RB2_bit = 0;
 RB3_bit = 1;
 break;

 }

 }


 void dezena(char numero){

 switch(numero){

 case 0:
 RB4_bit = 0;
 RB5_bit = 0;
 RB6_bit = 0;
 RB7_bit = 0;
 break;

 case 1:
 RB4_bit = 1;
 RB5_bit = 0;
 RB6_bit = 0;
 RB7_bit = 0;
 break;

 case 2:
 RB4_bit = 0;
 RB5_bit = 1;
 RB6_bit = 0;
 RB7_bit = 0;
 break;

 case 3:
 RB4_bit = 1;
 RB5_bit = 1;
 RB6_bit = 0;
 RB7_bit = 0;
 break;

 case 4:
 RB4_bit = 0;
 RB5_bit = 0;
 RB6_bit = 1;
 RB7_bit = 0;
 break;

 case 5:
 RB4_bit = 1;
 RB5_bit = 0;
 RB6_bit = 1;
 RB7_bit = 0;
 break;

 case 6:
 RB4_bit = 0;
 RB5_bit = 1;
 RB6_bit = 1;
 RB7_bit = 0;
 break;

 case 7:
 RB4_bit = 1;
 RB5_bit = 1;
 RB6_bit = 1;
 RB7_bit = 0;
 break;

 case 8:
 RB4_bit = 0;
 RB5_bit = 0;
 RB6_bit = 0;
 RB7_bit = 1;
 break;

 case 9:
 RB4_bit = 1;
 RB5_bit = 0;
 RB6_bit = 0;
 RB7_bit = 1;
 break;

 }

 }
