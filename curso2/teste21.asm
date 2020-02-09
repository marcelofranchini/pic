
_main:

;teste21.c,7 :: 		void main()
;teste21.c,9 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;teste21.c,10 :: 		ADCON0 = 0x01;
	MOVLW      1
	MOVWF      ADCON0+0
;teste21.c,11 :: 		ADCON1 = 0x0E;
	MOVLW      14
	MOVWF      ADCON1+0
;teste21.c,13 :: 		TRISB = 0x80;
	MOVLW      128
	MOVWF      TRISB+0
;teste21.c,14 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;teste21.c,16 :: 		UART1_Init(9600);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;teste21.c,17 :: 		Delay_ms(100);
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
;teste21.c,19 :: 		UART1_Write_Text("Start");
	MOVLW      ?lstr1_teste21+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;teste21.c,20 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;teste21.c,21 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;teste21.c,23 :: 		while (1)
L_main1:
;teste21.c,25 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;teste21.c,27 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;teste21.c,28 :: 		UART1_Write(uart_rd);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;teste21.c,30 :: 		switch(uart_rd)
	GOTO       L_main4
;teste21.c,32 :: 		case 'y':  RB0_bit  = 0x01; break;
L_main6:
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main5
;teste21.c,33 :: 		case 't':  RB0_bit  = 0x00; break;
L_main7:
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main5
;teste21.c,34 :: 		case 'r':  RB1_bit  = 0x01; break;
L_main8:
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main5
;teste21.c,35 :: 		case 'e':  RB1_bit  = 0x00; break;
L_main9:
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main5
;teste21.c,36 :: 		case 'g':  RB2_bit  = 0x01; break;
L_main10:
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main5
;teste21.c,37 :: 		case 'f':  RB2_bit  = 0x00; break;
L_main11:
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main5
;teste21.c,40 :: 		}
L_main4:
	MOVF       _uart_rd+0, 0
	XORLW      121
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _uart_rd+0, 0
	XORLW      116
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _uart_rd+0, 0
	XORLW      114
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _uart_rd+0, 0
	XORLW      101
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _uart_rd+0, 0
	XORLW      103
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _uart_rd+0, 0
	XORLW      102
	BTFSC      STATUS+0, 2
	GOTO       L_main11
L_main5:
;teste21.c,41 :: 		}
L_main3:
;teste21.c,44 :: 		if( RB7_bit )
	BTFSS      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main12
;teste21.c,46 :: 		valorAD = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _valorAD+0
	MOVF       R0+1, 0
	MOVWF      _valorAD+1
	CLRF       _valorAD+2
	CLRF       _valorAD+3
;teste21.c,48 :: 		valorAD = valorAD*500;
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
;teste21.c,50 :: 		valorAD = valorAD/1023;
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
;teste21.c,52 :: 		IntToStr(valorAD, txt);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;teste21.c,54 :: 		UART1_Write_Text(txt);
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;teste21.c,55 :: 		UART1_Write_Text(" Celsius");
	MOVLW      ?lstr2_teste21+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;teste21.c,56 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;teste21.c,57 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;teste21.c,58 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
;teste21.c,60 :: 		}
L_main12:
;teste21.c,61 :: 		}
	GOTO       L_main1
;teste21.c,62 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
