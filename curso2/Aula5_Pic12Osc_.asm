
_main:

;Aula5_Pic12Osc_.c,1 :: 		void main() {
;Aula5_Pic12Osc_.c,3 :: 		ANSEL = 0; // portas digitais
	CLRF       ANSEL+0
;Aula5_Pic12Osc_.c,4 :: 		CMCON = 7; //desativa comparadores
	MOVLW      7
	MOVWF      CMCON+0
;Aula5_Pic12Osc_.c,6 :: 		TRISIO0_bit = 0; // saida
	BCF        TRISIO0_bit+0, BitPos(TRISIO0_bit+0)
;Aula5_Pic12Osc_.c,7 :: 		TRISIO1_bit = 0; // saida
	BCF        TRISIO1_bit+0, BitPos(TRISIO1_bit+0)
;Aula5_Pic12Osc_.c,9 :: 		GPIO = 0;  //low
	CLRF       GPIO+0
;Aula5_Pic12Osc_.c,12 :: 		while(1){
L_main0:
;Aula5_Pic12Osc_.c,14 :: 		GPIO.F0 = 1;
	BSF        GPIO+0, 0
;Aula5_Pic12Osc_.c,15 :: 		delay_ms(10);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;Aula5_Pic12Osc_.c,16 :: 		GPIO.F0 = 0;
	BCF        GPIO+0, 0
;Aula5_Pic12Osc_.c,17 :: 		delay_ms(10);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;Aula5_Pic12Osc_.c,19 :: 		GPIO.F1 = 1;
	BSF        GPIO+0, 1
;Aula5_Pic12Osc_.c,20 :: 		delay_ms(1);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
;Aula5_Pic12Osc_.c,21 :: 		GPIO.F1 = 0;
	BCF        GPIO+0, 1
;Aula5_Pic12Osc_.c,22 :: 		delay_ms(1);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;Aula5_Pic12Osc_.c,26 :: 		}
	GOTO       L_main0
;Aula5_Pic12Osc_.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
