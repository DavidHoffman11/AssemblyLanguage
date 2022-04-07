		;David Hoffman
		;2/19/20
		;Lab N11
		AREA Program1, CODE, READONLY
		ENTRY
		
main	MOV R0, #4     ;every new arguement is stored in R0
		BL cube        ;calls cube function
		MOV R4, R1     ;stores result
		MOV R0, #5     ;gives R0 a new arguement
		BL cube		   ;calls cube function
		MOV R5, R1	   ;stores R1 in R5
		MOV R0, #6     ;gives R0 a new arguement
		BL cube        ;calls cube function
		MOV R6, R1     ;stores R1 in R6
		MOV R0, #7     ;gives R0 a new arguement
		BL cube        ;calls cube function
		MOV R7, R1     ;stores R1 in R7	
		ADD R8, R4, R5 ;adds up the sums from all previous function calls
		ADD R8, R6, R8
		ADD R8, R7, R8
		B stop         ;stops program
		
cube	MUL R2, R0, R0 ;R0 is squared and stored in R2
		MUL R3, R2, R0 ;R0 is cubed and stored in R3
		MOV R2, #3     ;stores 3 in R2
		MUL R1, R2, R3 ;multiplies cubed R0 by 3
		BX LR          ;ends function