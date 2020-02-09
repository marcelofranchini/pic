#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula10_Pic16ServoMotor_.c"







void servo1_horario();
void servo1_centro();
void servo1_antiHorario();

void main()
{
 CMCON = 7;
 TRISA = 3;
 TRISB = 0;

 PORTA = 3;
 PORTB = 0;

 while(1){

 if( RA1_bit  == 0 &&  RA0_bit  == 1) servo1_horario();
 else if( RA1_bit  == 1 &&  RA0_bit  == 0) servo1_antiHorario();
 else servo1_centro();



 }

}

void servo1_horario(){
  RB0_bit  = 0;
 delay_us(18000);
  RB0_bit  = 1;
 delay_us(2000);
}


void servo1_centro(){
  RB0_bit  = 0;
 delay_us(18500);
  RB0_bit  = 1;
 delay_us(1500);
}


void servo1_antiHorario(){

  RB0_bit  = 0;
 delay_us(19000);
  RB0_bit  = 1;
 delay_us(1000);
}
