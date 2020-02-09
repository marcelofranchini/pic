
_main:

;Aula18_16F628A_clock_.c,1 :: 		void main() {
;Aula18_16F628A_clock_.c,2 :: 		TRISB = 0; // saida
	CLRF       TRISB+0
;Aula18_16F628A_clock_.c,3 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;Aula18_16F628A_clock_.c,4 :: 		PORTB = 0;
	CLRF       PORTB+0
;Aula18_16F628A_clock_.c,7 :: 		while(1){
L_main0:
;Aula18_16F628A_clock_.c,8 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula18_16F628A_clock_.c,9 :: 		delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;Aula18_16F628A_clock_.c,10 :: 		RB7_bit  = 1;
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula18_16F628A_clock_.c,11 :: 		delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;Aula18_16F628A_clock_.c,12 :: 		}
	GOTO       L_main0
;Aula18_16F628A_clock_.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
