.Model Tiny
.386
.DATA
	FILE	DB	'ABCD3.txt',0	
.CODE
.Startup	
	MOV AH, 41H
	LEA DX, FILE
	INT 21H	
.EXIT
END
	 
	
	
	
		