#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula13_16g_7Seg_.c"
 int i = 0;
void main() {
 int numeros[] = {
 0b00111111, 0b00000110, 0b01011011, 0b01001111,
 0b01100110, 0b01101101, 0b01111100, 0b00000111,
 0b01111111, 0b01100111
};
 TRISB = 0b00000000;
 PORTB = 0b00000000;
 CMCON = 7;


 while(1){
 PORTB = numeros[i];
 i++;
 if( i == 10)
 i = 0;
 delay_ms(100);

 }

}
