
_main:

;Aula21_PIC16F877A_Termometro_.c,11 :: 		void main() {
;Aula21_PIC16F877A_Termometro_.c,13 :: 		CMCON = 0X07;
	MOVLW      7
	MOVWF      CMCON+0
;Aula21_PIC16F877A_Termometro_.c,14 :: 		ADCON0 = 0X01;                  // habilita conversores ad
	MOVLW      1
	MOVWF      ADCON0+0
;Aula21_PIC16F877A_Termometro_.c,15 :: 		ADCON1 = 0X0E;                  //  ou 14 em dec e 0b11111110 ..AN0 como ana
	MOVLW      14
	MOVWF      ADCON1+0
;Aula21_PIC16F877A_Termometro_.c,18 :: 		UART1_Init(9600);              // Initialize UART module at 9600 bps
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Aula21_PIC16F877A_Termometro_.c,19 :: 		Delay_ms(100);                 // Wait for UART module to stabilize
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
;Aula21_PIC16F877A_Termometro_.c,22 :: 		TRISB = 0x80;                   // rb7 como entrada e o restante saida
	MOVLW      128
	MOVWF      TRISB+0
;Aula21_PIC16F877A_Termometro_.c,23 :: 		PORTB = 0X00;                   // todos em low
	CLRF       PORTB+0
;Aula21_PIC16F877A_Termometro_.c,24 :: 		TRISC = 0x01;                   // rc0 com entrada e o restante saída
	MOVLW      1
	MOVWF      TRISC+0
;Aula21_PIC16F877A_Termometro_.c,25 :: 		PORTC = 0X00;
	CLRF       PORTC+0
;Aula21_PIC16F877A_Termometro_.c,28 :: 		UART1_Write_Text("TESTE");        // escreve
	MOVLW      ?lstr1_Aula21_PIC16F877A_Termometro_+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula21_PIC16F877A_Termometro_.c,29 :: 		UART1_Write(10);                 // realimentação de linha ascii
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula21_PIC16F877A_Termometro_.c,30 :: 		UART1_Write(13);                 // quebra de linha, cr(enter) em ascii
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula21_PIC16F877A_Termometro_.c,32 :: 		while (1) {                     // Endless loop
L_main1:
;Aula21_PIC16F877A_Termometro_.c,33 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Aula21_PIC16F877A_Termometro_.c,34 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;Aula21_PIC16F877A_Termometro_.c,35 :: 		UART1_Write(uart_rd);       // and send data via UART
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula21_PIC16F877A_Termometro_.c,37 :: 		switch(uart_rd){
	GOTO       L_main4
;Aula21_PIC16F877A_Termometro_.c,39 :: 		case 'y': yellow = 0X01; break;
L_main6:
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main5
;Aula21_PIC16F877A_Termometro_.c,40 :: 		case 'u': yellow = 0X00; break;
L_main7:
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main5
;Aula21_PIC16F877A_Termometro_.c,41 :: 		case 'r': red = 0X01; break;
L_main8:
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main5
;Aula21_PIC16F877A_Termometro_.c,42 :: 		case 't': red = 0X00; break;
L_main9:
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main5
;Aula21_PIC16F877A_Termometro_.c,43 :: 		case 'g': green = 0X01; break;
L_main10:
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main5
;Aula21_PIC16F877A_Termometro_.c,44 :: 		case 'h': green = 0X00; break;
L_main11:
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main5
;Aula21_PIC16F877A_Termometro_.c,46 :: 		}
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
;Aula21_PIC16F877A_Termometro_.c,48 :: 		}
L_main3:
;Aula21_PIC16F877A_Termometro_.c,50 :: 		if (butt ){
	BTFSS      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main12
;Aula21_PIC16F877A_Termometro_.c,51 :: 		valorAd = ADC_READ(0);               // lê entrada analogica e atribui o valor ad
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _valorAD+0
	MOVF       R0+1, 0
	MOVWF      _valorAD+1
	CLRF       _valorAD+2
	CLRF       _valorAD+3
;Aula21_PIC16F877A_Termometro_.c,53 :: 		valorAd *= 500;                      // conversor de 10 bits 0,01 v a cada grau  ... 0 - 5 v 500
	MOVF       _valorAD+0, 0
	MOVWF      R0+0
	MOVF       _valorAD+1, 0
	MOVWF      R0+1
	MOVF       _valorAD+2, 0
	MOVWF      R0+2
	MOVF       _valorAD+3, 0
	MOVWF      R0+3
	MOVLW      244
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _valorAD+0
	MOVF       R0+1, 0
	MOVWF      _valorAD+1
	MOVF       R0+2, 0
	MOVWF      _valorAD+2
	MOVF       R0+3, 0
	MOVWF      _valorAD+3
;Aula21_PIC16F877A_Termometro_.c,54 :: 		valorAd /= 1023;                      //  10 bits 2^10 = 1024 (0 -1023)
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R0+0, 0
	MOVWF      _valorAD+0
	MOVF       R0+1, 0
	MOVWF      _valorAD+1
	MOVF       R0+2, 0
	MOVWF      _valorAD+2
	MOVF       R0+3, 0
	MOVWF      _valorAD+3
;Aula21_PIC16F877A_Termometro_.c,57 :: 		intToStr(valorAd, texto);          // converte inteiro para string
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Aula21_PIC16F877A_Termometro_.c,59 :: 		UART1_Write_Text(texto);
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula21_PIC16F877A_Termometro_.c,60 :: 		UART1_Write_Text(" graus celsius");
	MOVLW      ?lstr2_Aula21_PIC16F877A_Termometro_+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aula21_PIC16F877A_Termometro_.c,61 :: 		UART1_Write(10);                   // realimentação de linha ascii
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula21_PIC16F877A_Termometro_.c,62 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Aula21_PIC16F877A_Termometro_.c,63 :: 		delay_ms(500);                 // enter em ascii, quebra linha.
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;Aula21_PIC16F877A_Termometro_.c,65 :: 		}
L_main12:
;Aula21_PIC16F877A_Termometro_.c,66 :: 		}
	GOTO       L_main1
;Aula21_PIC16F877A_Termometro_.c,67 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
