#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula19_16F628A_Registradores_.c"
void main() {

 TRISD = 0;
 CMCON = 7;
 PORTD = 0;

 while(1){
 RD0_bit = 0;
 delay_ms(50);
 RD0_bit = 1;
 delay_ms(50);

 }


}
