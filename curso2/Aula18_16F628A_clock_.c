void main() {
     TRISB = 0; // saida
     CMCON = 7;
     PORTB = 0;
     
     
     while(1){
     RB7_bit = 0;
     delay_ms(500);
     RB7_bit  = 1;
     delay_ms(500);
     }
}