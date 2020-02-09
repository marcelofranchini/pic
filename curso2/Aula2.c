void main() {

     TRISB = 0b00000000;
     PORTB = 0b00000000;
     
     while(1){
      PORTB++;
      delay_ms(50);
     }

}