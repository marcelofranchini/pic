
void piscaLed();
void main() {

     TRISB = 0; // todos como saida
     PORTB = 0; // todos em low
     
     piscaLed();

}


void piscaLed(){

     while(1){
     PORTB = 0b00000010;     // rb1 em high
     delay_ms(500);
     PORTB = 0;              // todos em low
     delay_ms(500);
              }

}