#define S1 RA1_bit
#define S2 RA0_bit
#define Led1 RA2_bit
#define Led2 RA3_bit


void prog1();
void prog2();


void main() {
     CMCON = 7; // desabilita comparadores
     TRISA = 3; // 0b00000011 ou 3 -> ra0 e 1 como entrada e o restante saida
     PORTA = 3;  // 0b00000011 ou 3 -> ra0 e 1 em high(resistor de pull-up) e o restante em low
     
     
     while(1){
      prog1();
      prog2();
}


}


void prog1(){

     if(S1 == 0)
     while(1){
      Led1 = 1;
      Led2 = 0;
      delay_ms(500);
      Led1 = 0;
      Led2 = 1;
      delay_ms(500);
      }

}

void prog2(){

       if(S2 == 0)
     while(1){
      Led1 = 0;
      Led2 = 0;
      delay_ms(500);
      Led1 = 1;
      Led2 = 1;
      delay_ms(500);
      }


}


