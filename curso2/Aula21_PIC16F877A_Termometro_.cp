#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula21_PIC16F877A_Termometro_.c"






char uart_rd;
char texto[7];
long int valorAD = 0;

void main() {

 CMCON = 0X07;
 ADCON0 = 0X01;
 ADCON1 = 0X0E;


 UART1_Init(9600);
 Delay_ms(100);


 TRISB = 0x80;
 PORTB = 0X00;
 TRISC = 0x01;
 PORTC = 0X00;


 UART1_Write_Text("TESTE");
 UART1_Write(10);
 UART1_Write(13);

 while (1) {
 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);

 switch(uart_rd){

 case 'y':  RB0_bit  = 0X01; break;
 case 'u':  RB0_bit  = 0X00; break;
 case 'r':  RB1_bit  = 0X01; break;
 case 't':  RB1_bit  = 0X00; break;
 case 'g':  RB2_bit  = 0X01; break;
 case 'h':  RB2_bit  = 0X00; break;

 }

 }

 if ( RB7_bit  ){
 valorAd = ADC_READ(0);

 valorAd *= 500;
 valorAd /= 1023;


 intToStr(valorAd, texto);

 UART1_Write_Text(texto);
 UART1_Write_Text(" graus celsius");
 UART1_Write(10);
 UART1_Write(13);
 delay_ms(500);

 }
 }
}
