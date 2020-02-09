#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula18_16F628A_clock_.c"
void main() {
 TRISB = 0;
 CMCON = 7;
 PORTB = 0;


 while(1){
 RB7_bit = 0;
 delay_ms(500);
 RB7_bit = 1;
 delay_ms(500);
 }
}
