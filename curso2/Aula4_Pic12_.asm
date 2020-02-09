
_main:

;Aula4_Pic12_.c,3 :: 		void main() {
;Aula4_Pic12_.c,4 :: 		ANSEL = 0x00;   // sel das portas -> 0 digital 1 analogica
	CLRF       ANSEL+0
;Aula4_Pic12_.c,5 :: 		CMCON = 7; // desabilita os comparadores
	MOVLW      7
	MOVWF      CMCON+0
;Aula4_Pic12_.c,6 :: 		TRISIO0_bit = 1;  // entrada io0 saida
	BSF        TRISIO0_bit+0, BitPos(TRISIO0_bit+0)
;Aula4_Pic12_.c,7 :: 		TRISIO1_bit = 0; // saida io1    entrada
	BCF        TRISIO1_bit+0, BitPos(TRISIO1_bit+0)
;Aula4_Pic12_.c,9 :: 		GPIO = 0; // em low todos
	CLRF       GPIO+0
;Aula4_Pic12_.c,11 :: 		while(1){
L_main0:
;Aula4_Pic12_.c,13 :: 		if( GPIO.F0 == 1) {
	BTFSS      GPIO+0, 0
	GOTO       L_main2
;Aula4_Pic12_.c,14 :: 		GPIO.F1 =1;
	BSF        GPIO+0, 1
;Aula4_Pic12_.c,15 :: 		delay_ms(2000);
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
;Aula4_Pic12_.c,16 :: 		}  else{
	GOTO       L_main4
L_main2:
;Aula4_Pic12_.c,18 :: 		GPIO.F1 = 0;
	BCF        GPIO+0, 1
;Aula4_Pic12_.c,19 :: 		}
L_main4:
;Aula4_Pic12_.c,21 :: 		}
	GOTO       L_main0
;Aula4_Pic12_.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
