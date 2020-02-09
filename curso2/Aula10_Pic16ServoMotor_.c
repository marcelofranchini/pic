
#define S2   RA0_bit
#define S1   RA1_bit
#define led2 RA2_bit
#define led1 RA3_bit
#define servo1 RB0_bit

void servo1_horario();
void servo1_centro();
void servo1_antiHorario();

void main()
{
   CMCON = 7; //desabilitar os comparadores
   TRISA = 3; //indica que S1 e S2 como entrada e o restante saida. 0b00000011 = 3
   TRISB = 0; // todos saída

   PORTA = 3;   // s1 e s2 em high e led1 e 2 em high  3 = 0b00000011;
   PORTB = 0;

   while(1){

    if(S1 == 0 && S2 == 1) servo1_horario();
    else if(S1 == 1 && S2 == 0)  servo1_antiHorario();
    else servo1_centro();



   }

}

void servo1_horario(){   // pulso de 2 ms ativa o sentido horario
     servo1 = 0;
     delay_us(18000);
     servo1 = 1;
     delay_us(2000);
}


void servo1_centro(){       // pulso 1.5 ms ativa o centro
     servo1 = 0;
     delay_us(18500);
     servo1 = 1;
     delay_us(1500);
}


void servo1_antiHorario(){   // pulso de 1 ms ativa o sentido anti-horario

     servo1 = 0;
     delay_us(19000);
     servo1 = 1;
     delay_us(1000);
}