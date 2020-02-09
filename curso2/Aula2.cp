#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic 16/Aula2.c"
void main() {

 TRISB = 0b00000000;
 PORTB = 0b00000000;

 while(1){
 PORTB++;
 delay_ms(50);
 }

}
