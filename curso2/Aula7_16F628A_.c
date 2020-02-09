
int controle = 0b11111111;
void main() {

     TRISB = 0;   // todos como saída
     PORTB = 0b11111111;   // todos em high
     
     while(1){
     PORTB = controle;
     controle = controle << 1;
     delay_ms(100);

     if(controle == 0b00000000) 
     controle = 0b11111111;

     }

}