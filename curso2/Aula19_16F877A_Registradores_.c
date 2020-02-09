void main() {

     TRISD = 0; // saida
     CMCON = 7; // comparadores des.
     PORTD = 0; // em low
     
     while(1){
     RD0_bit = 0;
     delay_ms(50);
     RD0_bit = 1;
     delay_ms(50);
     
     }
     

}