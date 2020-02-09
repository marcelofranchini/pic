

char uart_rd;
char txt[7];
long int valorAD = 0;

void main()
{
 CMCON = 0x07;
 ADCON0 = 0x01;
 ADCON1 = 0x0E;

 TRISB = 0x80;
 PORTB = 0x00;

 UART1_Init(9600);
 Delay_ms(100);

 UART1_Write_Text("Start");
 UART1_Write(10);
 UART1_Write(13);

 while (1)
 {
 if (UART1_Data_Ready())
 {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);

 switch(uart_rd)
 {
 case 'y':  RB0_bit  = 0x01; break;
 case 't':  RB0_bit  = 0x00; break;
 case 'r':  RB1_bit  = 0x01; break;
 case 'e':  RB1_bit  = 0x00; break;
 case 'g':  RB2_bit  = 0x01; break;
 case 'f':  RB2_bit  = 0x00; break;


 }
 }


 if( RB7_bit )
 {
 valorAD = ADC_Read(0);

 valorAD = valorAD*500;

 valorAD = valorAD/1023;

 IntToStr(valorAD, txt);

 UART1_Write_Text(txt);
 UART1_Write_Text(" Celsius");
 UART1_Write(10);
 UART1_Write(13);
 delay_ms(100);

 }
 }
}
