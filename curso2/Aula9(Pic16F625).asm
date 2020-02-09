
_main:

;Aula9(Pic16F625).c,9 :: 		void main()
;Aula9(Pic16F625).c,11 :: 		CMCON = 7; //desabilitar os comparadores
	MOVLW      7
	MOVWF      CMCON+0
;Aula9(Pic16F625).c,12 :: 		TRISA = 3; //indica que S1 e S2 são entrada digital
	MOVLW      3
	MOVWF      TRISA+0
;Aula9(Pic16F625).c,13 :: 		TRISB = 0;
	CLRF       TRISB+0
;Aula9(Pic16F625).c,15 :: 		PORTA = 3;
	MOVLW      3
	MOVWF      PORTA+0
;Aula9(Pic16F625).c,16 :: 		PORTB = 0;
	CLRF       PORTB+0
;Aula9(Pic16F625).c,18 :: 		while(1)
L_main0:
;Aula9(Pic16F625).c,20 :: 		numbers = rand();
	CALL       _rand+0
	MOVF       R0+0, 0
	MOVWF      _numbers+0
	MOVF       R0+1, 0
	MOVWF      _numbers+1
;Aula9(Pic16F625).c,22 :: 		led1 = numbers;
	BTFSC      R0+0, 0
	GOTO       L__main12
	BCF        RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L__main13
L__main12:
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
L__main13:
;Aula9(Pic16F625).c,24 :: 		led2 = ~led1;
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L__main14
	BSF        RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L__main15
L__main14:
	BCF        RA2_bit+0, BitPos(RA2_bit+0)
L__main15:
;Aula9(Pic16F625).c,26 :: 		while(led1)  //enquanto led1 = 1
L_main2:
	BTFSS      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main3
;Aula9(Pic16F625).c,28 :: 		if(S1 == 0) led1 = 0;
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_main4
	BCF        RA3_bit+0, BitPos(RA3_bit+0)
L_main4:
;Aula9(Pic16F625).c,29 :: 		delay_ms(70);
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;Aula9(Pic16F625).c,30 :: 		}
	GOTO       L_main2
L_main3:
;Aula9(Pic16F625).c,32 :: 		while(led2)
L_main6:
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main7
;Aula9(Pic16F625).c,34 :: 		if(S2 == 0) led2 = 0;
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main8
	BCF        RA2_bit+0, BitPos(RA2_bit+0)
L_main8:
;Aula9(Pic16F625).c,35 :: 		delay_ms(70);
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;Aula9(Pic16F625).c,36 :: 		}
	GOTO       L_main6
L_main7:
;Aula9(Pic16F625).c,38 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;Aula9(Pic16F625).c,41 :: 		}
	GOTO       L_main0
;Aula9(Pic16F625).c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
