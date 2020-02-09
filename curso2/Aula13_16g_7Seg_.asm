
_main:

;Aula13_16g_7Seg_.c,2 :: 		void main() {
;Aula13_16g_7Seg_.c,7 :: 		};
	MOVLW      63
	MOVWF      main_numeros_L0+0
	MOVLW      0
	MOVWF      main_numeros_L0+1
	MOVLW      6
	MOVWF      main_numeros_L0+2
	MOVLW      0
	MOVWF      main_numeros_L0+3
	MOVLW      91
	MOVWF      main_numeros_L0+4
	MOVLW      0
	MOVWF      main_numeros_L0+5
	MOVLW      79
	MOVWF      main_numeros_L0+6
	MOVLW      0
	MOVWF      main_numeros_L0+7
	MOVLW      102
	MOVWF      main_numeros_L0+8
	MOVLW      0
	MOVWF      main_numeros_L0+9
	MOVLW      109
	MOVWF      main_numeros_L0+10
	MOVLW      0
	MOVWF      main_numeros_L0+11
	MOVLW      124
	MOVWF      main_numeros_L0+12
	MOVLW      0
	MOVWF      main_numeros_L0+13
	MOVLW      7
	MOVWF      main_numeros_L0+14
	MOVLW      0
	MOVWF      main_numeros_L0+15
	MOVLW      127
	MOVWF      main_numeros_L0+16
	MOVLW      0
	MOVWF      main_numeros_L0+17
	MOVLW      103
	MOVWF      main_numeros_L0+18
	MOVLW      0
	MOVWF      main_numeros_L0+19
;Aula13_16g_7Seg_.c,8 :: 		TRISB = 0b00000000;       // todos saída
	CLRF       TRISB+0
;Aula13_16g_7Seg_.c,9 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;Aula13_16g_7Seg_.c,10 :: 		CMCON = 7; // desabilita os comparadores.
	MOVLW      7
	MOVWF      CMCON+0
;Aula13_16g_7Seg_.c,13 :: 		while(1){
L_main0:
;Aula13_16g_7Seg_.c,14 :: 		PORTB = numeros[i];
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_numeros_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Aula13_16g_7Seg_.c,15 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Aula13_16g_7Seg_.c,16 :: 		if( i == 10)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVLW      10
	XORWF      _i+0, 0
L__main5:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Aula13_16g_7Seg_.c,17 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
L_main2:
;Aula13_16g_7Seg_.c,18 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;Aula13_16g_7Seg_.c,20 :: 		}
	GOTO       L_main0
;Aula13_16g_7Seg_.c,22 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
