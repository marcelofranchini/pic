
_main:

;Aula6_Btn_led_.c,10 :: 		void main() {
;Aula6_Btn_led_.c,12 :: 		ANSEL = 0; // todos digitais
	CLRF       ANSEL+0
;Aula6_Btn_led_.c,13 :: 		CMCON = 7; //desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;Aula6_Btn_led_.c,15 :: 		TRISIO0_bit = 1; // entrada
	BSF        TRISIO0_bit+0, BitPos(TRISIO0_bit+0)
;Aula6_Btn_led_.c,16 :: 		TRISIO1_bit = 1; // entrada
	BSF        TRISIO1_bit+0, BitPos(TRISIO1_bit+0)
;Aula6_Btn_led_.c,17 :: 		TRISIO4_bit = 0; //saída
	BCF        TRISIO4_bit+0, BitPos(TRISIO4_bit+0)
;Aula6_Btn_led_.c,18 :: 		TRISIO5_bit = 0; //saída
	BCF        TRISIO5_bit+0, BitPos(TRISIO5_bit+0)
;Aula6_Btn_led_.c,19 :: 		S1 = 1;
	BSF        GPIO+0, 0
;Aula6_Btn_led_.c,20 :: 		S2 = 1;
	BSF        GPIO+0, 1
;Aula6_Btn_led_.c,21 :: 		D1 = 0;
	BCF        GPIO+0, 4
;Aula6_Btn_led_.c,22 :: 		D2 = 0;
	BCF        GPIO+0, 5
;Aula6_Btn_led_.c,24 :: 		while(1){
L_main0:
;Aula6_Btn_led_.c,25 :: 		leds();
	CALL       _leds+0
;Aula6_Btn_led_.c,26 :: 		}
	GOTO       L_main0
;Aula6_Btn_led_.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_leds:

;Aula6_Btn_led_.c,32 :: 		void leds(){
;Aula6_Btn_led_.c,33 :: 		if(S1 == 0){
	BTFSC      GPIO+0, 0
	GOTO       L_leds2
;Aula6_Btn_led_.c,34 :: 		D1 = ~D1;
	MOVLW      16
	XORWF      GPIO+0, 1
;Aula6_Btn_led_.c,35 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_leds3:
	DECFSZ     R13+0, 1
	GOTO       L_leds3
	DECFSZ     R12+0, 1
	GOTO       L_leds3
	DECFSZ     R11+0, 1
	GOTO       L_leds3
;Aula6_Btn_led_.c,36 :: 		}else if (S2 == 0){
	GOTO       L_leds4
L_leds2:
	BTFSC      GPIO+0, 1
	GOTO       L_leds5
;Aula6_Btn_led_.c,38 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_leds6:
	DECFSZ     R13+0, 1
	GOTO       L_leds6
	DECFSZ     R12+0, 1
	GOTO       L_leds6
	DECFSZ     R11+0, 1
	GOTO       L_leds6
;Aula6_Btn_led_.c,39 :: 		}
L_leds5:
L_leds4:
;Aula6_Btn_led_.c,40 :: 		}
L_end_leds:
	RETURN
; end of _leds
