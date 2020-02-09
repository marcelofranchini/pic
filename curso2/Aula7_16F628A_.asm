
_main:

;Aula7_16F628A_.c,3 :: 		void main() {
;Aula7_16F628A_.c,5 :: 		TRISB = 0;   // todos como saída
	CLRF       TRISB+0
;Aula7_16F628A_.c,6 :: 		PORTB = 0b11111111;   // todos em high
	MOVLW      255
	MOVWF      PORTB+0
;Aula7_16F628A_.c,8 :: 		while(1){
L_main0:
;Aula7_16F628A_.c,9 :: 		PORTB = controle;
	MOVF       _controle+0, 0
	MOVWF      PORTB+0
;Aula7_16F628A_.c,10 :: 		controle = controle << 1;
	RLF        _controle+0, 1
	RLF        _controle+1, 1
	BCF        _controle+0, 0
;Aula7_16F628A_.c,11 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;Aula7_16F628A_.c,13 :: 		if(controle == 0b00000000)
	MOVLW      0
	XORWF      _controle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVLW      0
	XORWF      _controle+0, 0
L__main5:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Aula7_16F628A_.c,14 :: 		controle = 0b11111111;
	MOVLW      255
	MOVWF      _controle+0
	CLRF       _controle+1
L_main3:
;Aula7_16F628A_.c,16 :: 		}
	GOTO       L_main0
;Aula7_16F628A_.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
