#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula7_16F628A_.c"

int controle = 0b11111111;
void main() {

 TRISB = 0;
 PORTB = 0b11111111;

 while(1){
 PORTB = controle;
 controle = controle << 1;
 delay_ms(100);

 if(controle == 0b00000000)
 controle = 0b11111111;

 }

}
