#define led1 GPIO.F1
#define led2 GPIO.F2
#define led3 GPIO.F4
#define led4 GPIO.F5

int leitura = 0;
void main() {
     ANSEL = 0b00000001;  // gp0 analogica e o restante digital
     ADCON0 = 1; //seleciona AN0
     CMCON = 7; // desativa os comparadores
     
     
     TRISIO = 0b00000001; // gp0 como entrada e o restante saída.
     GPIO = 0;
     
     while(1){
      leitura = ADC_Read(0);
      
      if(leitura > 0){
      led1 = 0;
      led2 = 0;
      led3 = 0;
      led4 = 0;
      } if(leitura > 204){
      led1 = 1;
      led2 = 0;
      led3 = 0;
      led4 = 0;
      } if(leitura > 408){
      led1 = 1;
      led2 = 1;
      led3 = 0;
      led4 = 0;
      }   if(leitura > 612){
      led1 = 1;
      led2 = 1;
      led3 = 1;
      led4 = 0;
      }   if(leitura > 816){
      led1 = 1;
      led2 = 1;
      led3 = 1;
      led4 = 1;
      }
      delay_ms(100); // taxa de atualiazação do adc
     }
     

}