
_main:

;Aula10_Pic16ServoMotor_.c,12 :: 		void main()
;Aula10_Pic16ServoMotor_.c,14 :: 		CMCON = 7; //desabilitar os comparadores
	MOVLW      7
	MOVWF      CMCON+0
;Aula10_Pic16ServoMotor_.c,15 :: 		TRISA = 3; //indica que S1 e S2 como entrada e o restante saida. 0b00000011 = 3
	MOVLW      3
	MOVWF      TRISA+0
;Aula10_Pic16ServoMotor_.c,16 :: 		TRISB = 0; // todos saída
	CLRF       TRISB+0
;Aula10_Pic16ServoMotor_.c,18 :: 		PORTA = 3;   // s1 e s2 em high e led1 e 2 em high  3 = 0b00000011;
	MOVLW      3
	MOVWF      PORTA+0
;Aula10_Pic16ServoMotor_.c,19 :: 		PORTB = 0;
	CLRF       PORTB+0
;Aula10_Pic16ServoMotor_.c,21 :: 		while(1){
L_main0:
;Aula10_Pic16ServoMotor_.c,23 :: 		if(S1 == 0 && S2 == 1) servo1_horario();
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_main4
	BTFSS      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main4
L__main17:
	CALL       _servo1_horario+0
	GOTO       L_main5
L_main4:
;Aula10_Pic16ServoMotor_.c,24 :: 		else if(S1 == 1 && S2 == 0)  servo1_antiHorario();
	BTFSS      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_main8
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main8
L__main16:
	CALL       _servo1_antiHorario+0
	GOTO       L_main9
L_main8:
;Aula10_Pic16ServoMotor_.c,25 :: 		else servo1_centro();
	CALL       _servo1_centro+0
L_main9:
L_main5:
;Aula10_Pic16ServoMotor_.c,29 :: 		}
	GOTO       L_main0
;Aula10_Pic16ServoMotor_.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_servo1_horario:

;Aula10_Pic16ServoMotor_.c,33 :: 		void servo1_horario(){   // pulso de 2 ms ativa o sentido horario
;Aula10_Pic16ServoMotor_.c,34 :: 		servo1 = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula10_Pic16ServoMotor_.c,35 :: 		delay_us(18000);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      95
	MOVWF      R13+0
L_servo1_horario10:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_horario10
	DECFSZ     R12+0, 1
	GOTO       L_servo1_horario10
;Aula10_Pic16ServoMotor_.c,36 :: 		servo1 = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula10_Pic16ServoMotor_.c,37 :: 		delay_us(2000);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_servo1_horario11:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_horario11
	DECFSZ     R12+0, 1
	GOTO       L_servo1_horario11
	NOP
	NOP
;Aula10_Pic16ServoMotor_.c,38 :: 		}
L_end_servo1_horario:
	RETURN
; end of _servo1_horario

_servo1_centro:

;Aula10_Pic16ServoMotor_.c,41 :: 		void servo1_centro(){       // pulso 1.5 ms ativa o centro
;Aula10_Pic16ServoMotor_.c,42 :: 		servo1 = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula10_Pic16ServoMotor_.c,43 :: 		delay_us(18500);
	MOVLW      25
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_servo1_centro12:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_centro12
	DECFSZ     R12+0, 1
	GOTO       L_servo1_centro12
;Aula10_Pic16ServoMotor_.c,44 :: 		servo1 = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula10_Pic16ServoMotor_.c,45 :: 		delay_us(1500);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_servo1_centro13:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_centro13
	DECFSZ     R12+0, 1
	GOTO       L_servo1_centro13
	NOP
	NOP
;Aula10_Pic16ServoMotor_.c,46 :: 		}
L_end_servo1_centro:
	RETURN
; end of _servo1_centro

_servo1_antiHorario:

;Aula10_Pic16ServoMotor_.c,49 :: 		void servo1_antiHorario(){   // pulso de 1 ms ativa o sentido anti-horario
;Aula10_Pic16ServoMotor_.c,51 :: 		servo1 = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula10_Pic16ServoMotor_.c,52 :: 		delay_us(19000);
	MOVLW      25
	MOVWF      R12+0
	MOVLW      171
	MOVWF      R13+0
L_servo1_antiHorario14:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_antiHorario14
	DECFSZ     R12+0, 1
	GOTO       L_servo1_antiHorario14
	NOP
	NOP
;Aula10_Pic16ServoMotor_.c,53 :: 		servo1 = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula10_Pic16ServoMotor_.c,54 :: 		delay_us(1000);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_servo1_antiHorario15:
	DECFSZ     R13+0, 1
	GOTO       L_servo1_antiHorario15
	DECFSZ     R12+0, 1
	GOTO       L_servo1_antiHorario15
;Aula10_Pic16ServoMotor_.c,55 :: 		}
L_end_servo1_antiHorario:
	RETURN
; end of _servo1_antiHorario
