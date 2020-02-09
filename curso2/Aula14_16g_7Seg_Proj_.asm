
_main:

;Aula14_16g_7Seg_Proj_.c,9 :: 		void main() {
;Aula14_16g_7Seg_Proj_.c,10 :: 		TRISA = 0b00000000;       // todos saída
	CLRF       TRISA+0
;Aula14_16g_7Seg_Proj_.c,11 :: 		PORTA = 0b00000000;
	CLRF       PORTA+0
;Aula14_16g_7Seg_Proj_.c,12 :: 		TRISB = 0b00000000;       // todos saída
	CLRF       TRISB+0
;Aula14_16g_7Seg_Proj_.c,13 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;Aula14_16g_7Seg_Proj_.c,14 :: 		CMCON = 7; // desabilita os comparadores.
	MOVLW      7
	MOVWF      CMCON+0
;Aula14_16g_7Seg_Proj_.c,17 :: 		while(1){
L_main0:
;Aula14_16g_7Seg_Proj_.c,20 :: 		uni ++;
	INCF       _uni+0, 1
;Aula14_16g_7Seg_Proj_.c,22 :: 		unidade(uni);
	MOVF       _uni+0, 0
	MOVWF      FARG_unidade_numero+0
	CALL       _unidade+0
;Aula14_16g_7Seg_Proj_.c,23 :: 		dezena(dez);
	MOVF       _dez+0, 0
	MOVWF      FARG_dezena_numero+0
	CALL       _dezena+0
;Aula14_16g_7Seg_Proj_.c,25 :: 		if( uni == 10){
	MOVF       _uni+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Aula14_16g_7Seg_Proj_.c,26 :: 		uni = 0;
	CLRF       _uni+0
;Aula14_16g_7Seg_Proj_.c,27 :: 		dez ++;
	INCF       _dez+0, 1
;Aula14_16g_7Seg_Proj_.c,28 :: 		unidade(uni);
	CLRF       FARG_unidade_numero+0
	CALL       _unidade+0
;Aula14_16g_7Seg_Proj_.c,29 :: 		dezena(dez);
	MOVF       _dez+0, 0
	MOVWF      FARG_dezena_numero+0
	CALL       _dezena+0
;Aula14_16g_7Seg_Proj_.c,31 :: 		}  if ( dez  == 10){
L_main2:
	MOVF       _dez+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Aula14_16g_7Seg_Proj_.c,33 :: 		dez = 0;
	CLRF       _dez+0
;Aula14_16g_7Seg_Proj_.c,34 :: 		dezena(dez);
	CLRF       FARG_dezena_numero+0
	CALL       _dezena+0
;Aula14_16g_7Seg_Proj_.c,36 :: 		}
L_main3:
;Aula14_16g_7Seg_Proj_.c,37 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
;Aula14_16g_7Seg_Proj_.c,39 :: 		}
	GOTO       L_main0
;Aula14_16g_7Seg_Proj_.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_unidade:

;Aula14_16g_7Seg_Proj_.c,44 :: 		void unidade(char numero){
;Aula14_16g_7Seg_Proj_.c,46 :: 		switch(numero){
	GOTO       L_unidade5
;Aula14_16g_7Seg_Proj_.c,48 :: 		case 0:
L_unidade7:
;Aula14_16g_7Seg_Proj_.c,49 :: 		RB0_bit = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula14_16g_7Seg_Proj_.c,50 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;Aula14_16g_7Seg_Proj_.c,51 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Aula14_16g_7Seg_Proj_.c,52 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;Aula14_16g_7Seg_Proj_.c,53 :: 		break;
	GOTO       L_unidade6
;Aula14_16g_7Seg_Proj_.c,55 :: 		case 1:
L_unidade8:
;Aula14_16g_7Seg_Proj_.c,56 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula14_16g_7Seg_Proj_.c,57 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;Aula14_16g_7Seg_Proj_.c,58 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Aula14_16g_7Seg_Proj_.c,59 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;Aula14_16g_7Seg_Proj_.c,60 :: 		break;
	GOTO       L_unidade6
;Aula14_16g_7Seg_Proj_.c,62 :: 		case 2:
L_unidade9:
;Aula14_16g_7Seg_Proj_.c,63 :: 		RB0_bit = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula14_16g_7Seg_Proj_.c,64 :: 		RB1_bit = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;Aula14_16g_7Seg_Proj_.c,65 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Aula14_16g_7Seg_Proj_.c,66 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;Aula14_16g_7Seg_Proj_.c,67 :: 		break;
	GOTO       L_unidade6
;Aula14_16g_7Seg_Proj_.c,69 :: 		case 3:
L_unidade10:
;Aula14_16g_7Seg_Proj_.c,70 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula14_16g_7Seg_Proj_.c,71 :: 		RB1_bit = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;Aula14_16g_7Seg_Proj_.c,72 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Aula14_16g_7Seg_Proj_.c,73 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;Aula14_16g_7Seg_Proj_.c,74 :: 		break;
	GOTO       L_unidade6
;Aula14_16g_7Seg_Proj_.c,76 :: 		case 4:
L_unidade11:
;Aula14_16g_7Seg_Proj_.c,77 :: 		RB0_bit = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula14_16g_7Seg_Proj_.c,78 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;Aula14_16g_7Seg_Proj_.c,79 :: 		RB2_bit = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;Aula14_16g_7Seg_Proj_.c,80 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;Aula14_16g_7Seg_Proj_.c,81 :: 		break;
	GOTO       L_unidade6
;Aula14_16g_7Seg_Proj_.c,83 :: 		case 5:
L_unidade12:
;Aula14_16g_7Seg_Proj_.c,84 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula14_16g_7Seg_Proj_.c,85 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;Aula14_16g_7Seg_Proj_.c,86 :: 		RB2_bit = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;Aula14_16g_7Seg_Proj_.c,87 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;Aula14_16g_7Seg_Proj_.c,88 :: 		break;
	GOTO       L_unidade6
;Aula14_16g_7Seg_Proj_.c,90 :: 		case 6:
L_unidade13:
;Aula14_16g_7Seg_Proj_.c,91 :: 		RB0_bit = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula14_16g_7Seg_Proj_.c,92 :: 		RB1_bit = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;Aula14_16g_7Seg_Proj_.c,93 :: 		RB2_bit = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;Aula14_16g_7Seg_Proj_.c,94 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;Aula14_16g_7Seg_Proj_.c,95 :: 		break;
	GOTO       L_unidade6
;Aula14_16g_7Seg_Proj_.c,97 :: 		case 7:
L_unidade14:
;Aula14_16g_7Seg_Proj_.c,98 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula14_16g_7Seg_Proj_.c,99 :: 		RB1_bit = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;Aula14_16g_7Seg_Proj_.c,100 :: 		RB2_bit = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;Aula14_16g_7Seg_Proj_.c,101 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;Aula14_16g_7Seg_Proj_.c,102 :: 		break;
	GOTO       L_unidade6
;Aula14_16g_7Seg_Proj_.c,104 :: 		case 8:
L_unidade15:
;Aula14_16g_7Seg_Proj_.c,105 :: 		RB0_bit = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula14_16g_7Seg_Proj_.c,106 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;Aula14_16g_7Seg_Proj_.c,107 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Aula14_16g_7Seg_Proj_.c,108 :: 		RB3_bit = 1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;Aula14_16g_7Seg_Proj_.c,109 :: 		break;
	GOTO       L_unidade6
;Aula14_16g_7Seg_Proj_.c,111 :: 		case 9:
L_unidade16:
;Aula14_16g_7Seg_Proj_.c,112 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Aula14_16g_7Seg_Proj_.c,113 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;Aula14_16g_7Seg_Proj_.c,114 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Aula14_16g_7Seg_Proj_.c,115 :: 		RB3_bit = 1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;Aula14_16g_7Seg_Proj_.c,116 :: 		break;
	GOTO       L_unidade6
;Aula14_16g_7Seg_Proj_.c,118 :: 		}
L_unidade5:
	MOVF       FARG_unidade_numero+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_unidade7
	MOVF       FARG_unidade_numero+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_unidade8
	MOVF       FARG_unidade_numero+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_unidade9
	MOVF       FARG_unidade_numero+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_unidade10
	MOVF       FARG_unidade_numero+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_unidade11
	MOVF       FARG_unidade_numero+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_unidade12
	MOVF       FARG_unidade_numero+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_unidade13
	MOVF       FARG_unidade_numero+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_unidade14
	MOVF       FARG_unidade_numero+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_unidade15
	MOVF       FARG_unidade_numero+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_unidade16
L_unidade6:
;Aula14_16g_7Seg_Proj_.c,120 :: 		}
L_end_unidade:
	RETURN
; end of _unidade

_dezena:

;Aula14_16g_7Seg_Proj_.c,123 :: 		void dezena(char numero){
;Aula14_16g_7Seg_Proj_.c,125 :: 		switch(numero){
	GOTO       L_dezena17
;Aula14_16g_7Seg_Proj_.c,127 :: 		case 0:
L_dezena19:
;Aula14_16g_7Seg_Proj_.c,128 :: 		RB4_bit = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;Aula14_16g_7Seg_Proj_.c,129 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;Aula14_16g_7Seg_Proj_.c,130 :: 		RB6_bit = 0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;Aula14_16g_7Seg_Proj_.c,131 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula14_16g_7Seg_Proj_.c,132 :: 		break;
	GOTO       L_dezena18
;Aula14_16g_7Seg_Proj_.c,134 :: 		case 1:
L_dezena20:
;Aula14_16g_7Seg_Proj_.c,135 :: 		RB4_bit = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;Aula14_16g_7Seg_Proj_.c,136 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;Aula14_16g_7Seg_Proj_.c,137 :: 		RB6_bit = 0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;Aula14_16g_7Seg_Proj_.c,138 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula14_16g_7Seg_Proj_.c,139 :: 		break;
	GOTO       L_dezena18
;Aula14_16g_7Seg_Proj_.c,141 :: 		case 2:
L_dezena21:
;Aula14_16g_7Seg_Proj_.c,142 :: 		RB4_bit = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;Aula14_16g_7Seg_Proj_.c,143 :: 		RB5_bit = 1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;Aula14_16g_7Seg_Proj_.c,144 :: 		RB6_bit = 0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;Aula14_16g_7Seg_Proj_.c,145 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula14_16g_7Seg_Proj_.c,146 :: 		break;
	GOTO       L_dezena18
;Aula14_16g_7Seg_Proj_.c,148 :: 		case 3:
L_dezena22:
;Aula14_16g_7Seg_Proj_.c,149 :: 		RB4_bit = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;Aula14_16g_7Seg_Proj_.c,150 :: 		RB5_bit = 1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;Aula14_16g_7Seg_Proj_.c,151 :: 		RB6_bit = 0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;Aula14_16g_7Seg_Proj_.c,152 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula14_16g_7Seg_Proj_.c,153 :: 		break;
	GOTO       L_dezena18
;Aula14_16g_7Seg_Proj_.c,155 :: 		case 4:
L_dezena23:
;Aula14_16g_7Seg_Proj_.c,156 :: 		RB4_bit = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;Aula14_16g_7Seg_Proj_.c,157 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;Aula14_16g_7Seg_Proj_.c,158 :: 		RB6_bit = 1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;Aula14_16g_7Seg_Proj_.c,159 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula14_16g_7Seg_Proj_.c,160 :: 		break;
	GOTO       L_dezena18
;Aula14_16g_7Seg_Proj_.c,162 :: 		case 5:
L_dezena24:
;Aula14_16g_7Seg_Proj_.c,163 :: 		RB4_bit = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;Aula14_16g_7Seg_Proj_.c,164 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;Aula14_16g_7Seg_Proj_.c,165 :: 		RB6_bit = 1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;Aula14_16g_7Seg_Proj_.c,166 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula14_16g_7Seg_Proj_.c,167 :: 		break;
	GOTO       L_dezena18
;Aula14_16g_7Seg_Proj_.c,169 :: 		case 6:
L_dezena25:
;Aula14_16g_7Seg_Proj_.c,170 :: 		RB4_bit = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;Aula14_16g_7Seg_Proj_.c,171 :: 		RB5_bit = 1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;Aula14_16g_7Seg_Proj_.c,172 :: 		RB6_bit = 1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;Aula14_16g_7Seg_Proj_.c,173 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula14_16g_7Seg_Proj_.c,174 :: 		break;
	GOTO       L_dezena18
;Aula14_16g_7Seg_Proj_.c,176 :: 		case 7:
L_dezena26:
;Aula14_16g_7Seg_Proj_.c,177 :: 		RB4_bit = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;Aula14_16g_7Seg_Proj_.c,178 :: 		RB5_bit = 1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;Aula14_16g_7Seg_Proj_.c,179 :: 		RB6_bit = 1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;Aula14_16g_7Seg_Proj_.c,180 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula14_16g_7Seg_Proj_.c,181 :: 		break;
	GOTO       L_dezena18
;Aula14_16g_7Seg_Proj_.c,183 :: 		case 8:
L_dezena27:
;Aula14_16g_7Seg_Proj_.c,184 :: 		RB4_bit = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;Aula14_16g_7Seg_Proj_.c,185 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;Aula14_16g_7Seg_Proj_.c,186 :: 		RB6_bit = 0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;Aula14_16g_7Seg_Proj_.c,187 :: 		RB7_bit = 1;
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula14_16g_7Seg_Proj_.c,188 :: 		break;
	GOTO       L_dezena18
;Aula14_16g_7Seg_Proj_.c,190 :: 		case 9:
L_dezena28:
;Aula14_16g_7Seg_Proj_.c,191 :: 		RB4_bit = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;Aula14_16g_7Seg_Proj_.c,192 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;Aula14_16g_7Seg_Proj_.c,193 :: 		RB6_bit = 0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;Aula14_16g_7Seg_Proj_.c,194 :: 		RB7_bit = 1;
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
;Aula14_16g_7Seg_Proj_.c,195 :: 		break;
	GOTO       L_dezena18
;Aula14_16g_7Seg_Proj_.c,197 :: 		}
L_dezena17:
	MOVF       FARG_dezena_numero+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_dezena19
	MOVF       FARG_dezena_numero+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dezena20
	MOVF       FARG_dezena_numero+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dezena21
	MOVF       FARG_dezena_numero+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dezena22
	MOVF       FARG_dezena_numero+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_dezena23
	MOVF       FARG_dezena_numero+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_dezena24
	MOVF       FARG_dezena_numero+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_dezena25
	MOVF       FARG_dezena_numero+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_dezena26
	MOVF       FARG_dezena_numero+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_dezena27
	MOVF       FARG_dezena_numero+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_dezena28
L_dezena18:
;Aula14_16g_7Seg_Proj_.c,199 :: 		}
L_end_dezena:
	RETURN
; end of _dezena
