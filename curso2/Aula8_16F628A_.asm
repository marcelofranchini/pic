
_main:

;Aula8_16F628A_.c,11 :: 		void main() {
;Aula8_16F628A_.c,12 :: 		CMCON = 7; // desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;Aula8_16F628A_.c,13 :: 		TRISA = 3; // 0b00000011 ou 3 -> ra0 e 1 como entrada e o restante saida
	MOVLW      3
	MOVWF      TRISA+0
;Aula8_16F628A_.c,14 :: 		PORTA = 3;  // 0b00000011 ou 3 -> ra0 e 1 em high(resistor de pull-up) e o restante em low
	MOVLW      3
	MOVWF      PORTA+0
;Aula8_16F628A_.c,17 :: 		while(1){
L_main0:
;Aula8_16F628A_.c,18 :: 		prog1();
	CALL       _prog1+0
;Aula8_16F628A_.c,19 :: 		prog2();
	CALL       _prog2+0
;Aula8_16F628A_.c,20 :: 		}
	GOTO       L_main0
;Aula8_16F628A_.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_prog1:

;Aula8_16F628A_.c,26 :: 		void prog1(){
;Aula8_16F628A_.c,28 :: 		if(S1 == 0)
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_prog12
;Aula8_16F628A_.c,29 :: 		while(1){
L_prog13:
;Aula8_16F628A_.c,30 :: 		Led1 = 1;
	BSF        RA2_bit+0, BitPos(RA2_bit+0)
;Aula8_16F628A_.c,31 :: 		Led2 = 0;
	BCF        RA3_bit+0, BitPos(RA3_bit+0)
;Aula8_16F628A_.c,32 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_prog15:
	DECFSZ     R13+0, 1
	GOTO       L_prog15
	DECFSZ     R12+0, 1
	GOTO       L_prog15
	DECFSZ     R11+0, 1
	GOTO       L_prog15
	NOP
	NOP
;Aula8_16F628A_.c,33 :: 		Led1 = 0;
	BCF        RA2_bit+0, BitPos(RA2_bit+0)
;Aula8_16F628A_.c,34 :: 		Led2 = 1;
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
;Aula8_16F628A_.c,35 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_prog16:
	DECFSZ     R13+0, 1
	GOTO       L_prog16
	DECFSZ     R12+0, 1
	GOTO       L_prog16
	DECFSZ     R11+0, 1
	GOTO       L_prog16
	NOP
	NOP
;Aula8_16F628A_.c,36 :: 		}
	GOTO       L_prog13
L_prog12:
;Aula8_16F628A_.c,38 :: 		}
L_end_prog1:
	RETURN
; end of _prog1

_prog2:

;Aula8_16F628A_.c,40 :: 		void prog2(){
;Aula8_16F628A_.c,42 :: 		if(S2 == 0)
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_prog27
;Aula8_16F628A_.c,43 :: 		while(1){
L_prog28:
;Aula8_16F628A_.c,44 :: 		Led1 = 0;
	BCF        RA2_bit+0, BitPos(RA2_bit+0)
;Aula8_16F628A_.c,45 :: 		Led2 = 0;
	BCF        RA3_bit+0, BitPos(RA3_bit+0)
;Aula8_16F628A_.c,46 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_prog210:
	DECFSZ     R13+0, 1
	GOTO       L_prog210
	DECFSZ     R12+0, 1
	GOTO       L_prog210
	DECFSZ     R11+0, 1
	GOTO       L_prog210
	NOP
	NOP
;Aula8_16F628A_.c,47 :: 		Led1 = 1;
	BSF        RA2_bit+0, BitPos(RA2_bit+0)
;Aula8_16F628A_.c,48 :: 		Led2 = 1;
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
;Aula8_16F628A_.c,49 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_prog211:
	DECFSZ     R13+0, 1
	GOTO       L_prog211
	DECFSZ     R12+0, 1
	GOTO       L_prog211
	DECFSZ     R11+0, 1
	GOTO       L_prog211
	NOP
	NOP
;Aula8_16F628A_.c,50 :: 		}
	GOTO       L_prog28
L_prog27:
;Aula8_16F628A_.c,53 :: 		}
L_end_prog2:
	RETURN
; end of _prog2
