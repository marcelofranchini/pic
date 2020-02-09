
_main:

;Aula1.c,3 :: 		void main() {
;Aula1.c,5 :: 		TRISB = 0; // todos como saida
	CLRF       TRISB+0
;Aula1.c,6 :: 		PORTB = 0; // todos em low
	CLRF       PORTB+0
;Aula1.c,8 :: 		piscaLed();
	CALL       _piscaLed+0
;Aula1.c,10 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_piscaLed:

;Aula1.c,13 :: 		void piscaLed(){
;Aula1.c,15 :: 		while(1){
L_piscaLed0:
;Aula1.c,16 :: 		PORTB = 0b00000010;
	MOVLW      2
	MOVWF      PORTB+0
;Aula1.c,17 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_piscaLed2:
	DECFSZ     R13+0, 1
	GOTO       L_piscaLed2
	DECFSZ     R12+0, 1
	GOTO       L_piscaLed2
	DECFSZ     R11+0, 1
	GOTO       L_piscaLed2
	NOP
	NOP
;Aula1.c,18 :: 		PORTB = 0;
	CLRF       PORTB+0
;Aula1.c,19 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_piscaLed3:
	DECFSZ     R13+0, 1
	GOTO       L_piscaLed3
	DECFSZ     R12+0, 1
	GOTO       L_piscaLed3
	DECFSZ     R11+0, 1
	GOTO       L_piscaLed3
	NOP
	NOP
;Aula1.c,20 :: 		}
	GOTO       L_piscaLed0
;Aula1.c,22 :: 		}
L_end_piscaLed:
	RETURN
; end of _piscaLed
