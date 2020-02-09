
_main:

;Aula19_16F877A_Registradores_.c,1 :: 		void main() {
;Aula19_16F877A_Registradores_.c,3 :: 		TRISD = 0; // saida
	CLRF       TRISD+0
;Aula19_16F877A_Registradores_.c,4 :: 		CMCON = 7; // comparadores des.
	MOVLW      7
	MOVWF      CMCON+0
;Aula19_16F877A_Registradores_.c,5 :: 		PORTD = 0; // em low
	CLRF       PORTD+0
;Aula19_16F877A_Registradores_.c,7 :: 		while(1){
L_main0:
;Aula19_16F877A_Registradores_.c,8 :: 		RD0_bit = 0;
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;Aula19_16F877A_Registradores_.c,9 :: 		delay_ms(50);
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
;Aula19_16F877A_Registradores_.c,10 :: 		RD0_bit = 1;
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;Aula19_16F877A_Registradores_.c,11 :: 		delay_ms(50);
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
;Aula19_16F877A_Registradores_.c,13 :: 		}
	GOTO       L_main0
;Aula19_16F877A_Registradores_.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
