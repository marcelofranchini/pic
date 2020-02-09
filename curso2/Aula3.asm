
_main:

;Aula3.c,3 :: 		void main() {
;Aula3.c,4 :: 		ANSEL = 0;   // sel das portas analogicas 0 dig 1 ana
	CLRF       ANSEL+0
;Aula3.c,5 :: 		CMCON = 7; // desabilita os comparadores
	MOVLW      7
	MOVWF      CMCON+0
;Aula3.c,6 :: 		TRISIO0_bit = 0;  // saida o0
	BCF        TRISIO0_bit+0, BitPos(TRISIO0_bit+0)
;Aula3.c,7 :: 		TRISIO1_bit = 0; // saida o1
	BCF        TRISIO1_bit+0, BitPos(TRISIO1_bit+0)
;Aula3.c,9 :: 		GPIO = 0; // em low todos
	CLRF       GPIO+0
;Aula3.c,11 :: 		while(1){
L_main0:
;Aula3.c,13 :: 		GPIO.F0 = 1;
	BSF        GPIO+0, 0
;Aula3.c,14 :: 		GPIO.F1 =0;
	BCF        GPIO+0, 1
;Aula3.c,15 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Aula3.c,16 :: 		GPIO.F0 = 0;
	BCF        GPIO+0, 0
;Aula3.c,17 :: 		GPIO.F1 =1;
	BSF        GPIO+0, 1
;Aula3.c,18 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Aula3.c,21 :: 		}
	GOTO       L_main0
;Aula3.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
