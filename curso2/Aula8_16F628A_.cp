#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula8_16F628A_.c"






void prog1();
void prog2();


void main() {
 CMCON = 7;
 TRISA = 3;
 PORTA = 3;


 while(1){
 prog1();
 prog2();
}


}


void prog1(){

 if( RA1_bit  == 0)
 while(1){
  RA2_bit  = 1;
  RA3_bit  = 0;
 delay_ms(500);
  RA2_bit  = 0;
  RA3_bit  = 1;
 delay_ms(500);
 }

}

void prog2(){

 if( RA0_bit  == 0)
 while(1){
  RA2_bit  = 0;
  RA3_bit  = 0;
 delay_ms(500);
  RA2_bit  = 1;
  RA3_bit  = 1;
 delay_ms(500);
 }


}
