
_main:

;Aula12_Pic12F675_Ad_.c,7 :: 		void main() {
;Aula12_Pic12F675_Ad_.c,8 :: 		ANSEL = 0b00000001;  // gp0 analogica e o restante digital
	MOVLW      1
	MOVWF      ANSEL+0
;Aula12_Pic12F675_Ad_.c,9 :: 		ADCON0 = 1; //seleciona AN0
	MOVLW      1
	MOVWF      ADCON0+0
;Aula12_Pic12F675_Ad_.c,10 :: 		CMCON = 7; // desativa os comparadores
	MOVLW      7
	MOVWF      CMCON+0
;Aula12_Pic12F675_Ad_.c,13 :: 		TRISIO = 0b00000001; // gp0 como entrada e o restante saída.
	MOVLW      1
	MOVWF      TRISIO+0
;Aula12_Pic12F675_Ad_.c,14 :: 		GPIO = 0;
	CLRF       GPIO+0
;Aula12_Pic12F675_Ad_.c,16 :: 		while(1){
L_main0:
;Aula12_Pic12F675_Ad_.c,17 :: 		leitura = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _leitura+0
	MOVF       R0+1, 0
	MOVWF      _leitura+1
;Aula12_Pic12F675_Ad_.c,19 :: 		if(leitura > 0){
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       R0+0, 0
	SUBLW      0
L__main9:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;Aula12_Pic12F675_Ad_.c,20 :: 		led1 = 0;
	BCF        GPIO+0, 1
;Aula12_Pic12F675_Ad_.c,21 :: 		led2 = 0;
	BCF        GPIO+0, 2
;Aula12_Pic12F675_Ad_.c,22 :: 		led3 = 0;
	BCF        GPIO+0, 4
;Aula12_Pic12F675_Ad_.c,23 :: 		led4 = 0;
	BCF        GPIO+0, 5
;Aula12_Pic12F675_Ad_.c,24 :: 		} if(leitura > 204){
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _leitura+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVF       _leitura+0, 0
	SUBLW      204
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Aula12_Pic12F675_Ad_.c,25 :: 		led1 = 1;
	BSF        GPIO+0, 1
;Aula12_Pic12F675_Ad_.c,26 :: 		led2 = 0;
	BCF        GPIO+0, 2
;Aula12_Pic12F675_Ad_.c,27 :: 		led3 = 0;
	BCF        GPIO+0, 4
;Aula12_Pic12F675_Ad_.c,28 :: 		led4 = 0;
	BCF        GPIO+0, 5
;Aula12_Pic12F675_Ad_.c,29 :: 		} if(leitura > 408){
L_main3:
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _leitura+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       _leitura+0, 0
	SUBLW      152
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Aula12_Pic12F675_Ad_.c,30 :: 		led1 = 1;
	BSF        GPIO+0, 1
;Aula12_Pic12F675_Ad_.c,31 :: 		led2 = 1;
	BSF        GPIO+0, 2
;Aula12_Pic12F675_Ad_.c,32 :: 		led3 = 0;
	BCF        GPIO+0, 4
;Aula12_Pic12F675_Ad_.c,33 :: 		led4 = 0;
	BCF        GPIO+0, 5
;Aula12_Pic12F675_Ad_.c,34 :: 		}   if(leitura > 612){
L_main4:
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      _leitura+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       _leitura+0, 0
	SUBLW      100
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;Aula12_Pic12F675_Ad_.c,35 :: 		led1 = 1;
	BSF        GPIO+0, 1
;Aula12_Pic12F675_Ad_.c,36 :: 		led2 = 1;
	BSF        GPIO+0, 2
;Aula12_Pic12F675_Ad_.c,37 :: 		led3 = 1;
	BSF        GPIO+0, 4
;Aula12_Pic12F675_Ad_.c,38 :: 		led4 = 0;
	BCF        GPIO+0, 5
;Aula12_Pic12F675_Ad_.c,39 :: 		}   if(leitura > 816){
L_main5:
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _leitura+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _leitura+0, 0
	SUBLW      48
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Aula12_Pic12F675_Ad_.c,40 :: 		led1 = 1;
	BSF        GPIO+0, 1
;Aula12_Pic12F675_Ad_.c,41 :: 		led2 = 1;
	BSF        GPIO+0, 2
;Aula12_Pic12F675_Ad_.c,42 :: 		led3 = 1;
	BSF        GPIO+0, 4
;Aula12_Pic12F675_Ad_.c,43 :: 		led4 = 1;
	BSF        GPIO+0, 5
;Aula12_Pic12F675_Ad_.c,44 :: 		}
L_main6:
;Aula12_Pic12F675_Ad_.c,45 :: 		delay_ms(100); // taxa de atualiazação do adc
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;Aula12_Pic12F675_Ad_.c,46 :: 		}
	GOTO       L_main0
;Aula12_Pic12F675_Ad_.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
