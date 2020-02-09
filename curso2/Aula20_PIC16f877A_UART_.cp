#line 1 "C:/Users/Marcelo Franchini/Desktop/Pic/Mikro/Curso Pic WR/Aula20_PIC16f877A_UART_.c"






char uart_rd;

void main() {
 CMCON = 0X07;
 ADCON0 = 0X00;
 ADCON1 = 0X06;
 UART1_Init(9600);
 Delay_ms(100);


 TRISB = 0x80;
 PORTB = 0X00;


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

 if ( RB7_bit  == 0x01){
 UART1_Write_Text("ALERTA!");
 UART1_Write(10);
 UART1_Write(13);

 }



 }
 }
 }
}
