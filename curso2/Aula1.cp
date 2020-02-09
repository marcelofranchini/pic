#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic 16/Aula1.c"

void piscaLed();
void main() {

 TRISB = 0;
 PORTB = 0;

 piscaLed();

}


void piscaLed(){

 while(1){
 PORTB = 0b00000010;
 delay_ms(500);
 PORTB = 0;
 delay_ms(500);
 }

}
