#define yellow RB0_bit
#define red    RB1_bit
#define green  RB2_bit
#define butt   RB7_bit


char uart_rd;
char texto[7];
long int valorAD = 0;

void main() {
  //ANSEL no 877a não é utilizado.
  CMCON  = 0X07;
  ADCON0 = 0X01;                  // habilita conversores ad
  ADCON1 = 0X0E;                  //  ou 14 em dec e 0b11111110 ..AN0 como ana
  
  
  UART1_Init(9600);              // Initialize UART module at 9600 bps
  Delay_ms(100);                 // Wait for UART module to stabilize


  TRISB = 0x80;                   // rb7 como entrada e o restante saida
  PORTB = 0X00;                   // todos em low
  TRISC = 0x01;                   // rc0 com entrada e o restante saída
  PORTC = 0X00;


  UART1_Write_Text("TESTE");        // escreve
  UART1_Write(10);                 // realimentação de linha ascii
  UART1_Write(13);                 // quebra de linha, cr(enter) em ascii

  while (1) {   
                                  // Endless loop
      if (UART1_Data_Ready()) {     // If data is received,
      uart_rd = UART1_Read();     // read the received data,
      UART1_Write(uart_rd);       // and send data via UART

      switch(uart_rd){

      case 'y': yellow = 0X01; break;
      case 'u': yellow = 0X00; break;
      case 'r': red = 0X01; break;
      case 't': red = 0X00; break;
      case 'g': green = 0X01; break;
      case 'h': green = 0X00; break;

      }

    }
    
     if (butt ){
      valorAd = ADC_READ(0);               // lê entrada analogica e atribui o valor ad
      
      valorAd *= 500;                      // conversor de 10 bits 0,01 v a cada grau  ... 0 - 5 v 500
      valorAd /= 1023;                     //  10 bits 2^10 = 1024 (0 -1023)
      
      
      intToStr(valorAd, texto);            // converte inteiro para string
      
      UART1_Write_Text(texto);
      UART1_Write_Text(" graus celsius");
      UART1_Write(10);                   // realimentação de linha ascii
      UART1_Write(13);  
      delay_ms(500);                     // enter em ascii, quebra linha.

      }
  }
}