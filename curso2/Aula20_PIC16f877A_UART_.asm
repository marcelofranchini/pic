
_main:

;Aula20_PIC16f877A_UART_.c,9 :: 		void main() {
;Aula20_PIC16f877A_UART_.c,10 :: 		CMCON = 0X07;
	MOVLW      7
	MOVWF      CMCON+0
;Aula20_PIC16f877A_UART_.c,11 :: 		ADCON0 = 0X00;  // desabilita conversores ad
	CLRF       ADCON0+0
;Aula20_PIC16f877A_UART_.c,12 :: 		ADCON1 = 0X06;   // torna todo adc digital
	MOVLW      6
	MOVWF      ADCON1+0
;Aula20_PIC16f877A_UART_.c,13 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Aula20_PIC16f877A_UART_.c,14 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;Aula20_PIC16f877A_UART_.c,17 :: 		TRISB = 0x80;    // rb7 como entrada e o restante saida
	MOVLW      128
	MOVWF      TRISB+0
;Aula20_PIC16f877A_UART_.c,18 :: 		PORTB = 0X00;    // todos em low
	CLRF       PORTB+0
;Aula20_PIC16f877A_UART_.c,21 :: 		UART1_Write_Text("TESTE");        // escreve
	MOVLW      ?lstr1_Aula20_PIC16f877A_UART_+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula20_PIC16f877A_UART_.c,22 :: 		UART1_Write(10);                 // realimentação de linha ascii
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula20_PIC16f877A_UART_.c,23 :: 		UART1_Write(13);                 // quebra de linha, cr(enter) em ascii
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula20_PIC16f877A_UART_.c,25 :: 		while (1) {                     // Endless loop
L_main1:
;Aula20_PIC16f877A_UART_.c,26 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Aula20_PIC16f877A_UART_.c,27 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;Aula20_PIC16f877A_UART_.c,28 :: 		UART1_Write(uart_rd);       // and send data via UART
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula20_PIC16f877A_UART_.c,30 :: 		switch(uart_rd){
	GOTO       L_main4
;Aula20_PIC16f877A_UART_.c,32 :: 		case 'y': yellow = 0X01; break;
L_main6:
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main5
;Aula20_PIC16f877A_UART_.c,33 :: 		case 'u': yellow = 0X00; break;
L_main7:
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main5
;Aula20_PIC16f877A_UART_.c,34 :: 		case 'r': red = 0X01; break;
L_main8:
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main5
;Aula20_PIC16f877A_UART_.c,35 :: 		case 't': red = 0X00; break;
L_main9:
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main5
;Aula20_PIC16f877A_UART_.c,36 :: 		case 'g': green = 0X01; break;
L_main10:
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main5
;Aula20_PIC16f877A_UART_.c,37 :: 		case 'h': green = 0X00; break;
L_main11:
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main5
;Aula20_PIC16f877A_UART_.c,48 :: 		}
L_main4:
	MOVF       _uart_rd+0, 0
	XORLW      121
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _uart_rd+0, 0
	XORLW      117
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _uart_rd+0, 0
	XORLW      114
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _uart_rd+0, 0
	XORLW      116
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _uart_rd+0, 0
	XORLW      103
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _uart_rd+0, 0
	XORLW      104
	BTFSC      STATUS+0, 2
	GOTO       L_main11
L_main5:
;Aula20_PIC16f877A_UART_.c,49 :: 		}
L_main3:
;Aula20_PIC16f877A_UART_.c,50 :: 		}
	GOTO       L_main1
;Aula20_PIC16f877A_UART_.c,51 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
