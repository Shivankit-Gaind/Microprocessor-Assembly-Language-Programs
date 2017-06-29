.Model Tiny
.386
.DATA
	FILE	DB	'ABCD2.txt',0	
	FILE2	DB	'ABCD3.txt',0
.CODE
.Startup	
	MOV AH, 56H
	LEA DX, FILE
	LEA DI, FILE2
	INT 21H	
.EXIT
END
	 
	
	
	
		