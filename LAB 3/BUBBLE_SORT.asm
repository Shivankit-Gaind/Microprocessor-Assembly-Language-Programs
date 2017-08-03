.model  tiny
.386
.stack
.data

numbers	DW	1,4,5,2,3
count	DW	5



.code 
.startup

	LEA	SI, numbers
	MOV	CX, count
	
X1:	MOV	DI, SI	
	MOV	AX, CX	

X2:	MOV	DX, [DI] 
	INC	DI
	INC	DI
	CMP	DX, [DI]
	JLE	P

	MOV	BX, [DI]
	MOV	[DI-2],BX
	MOV	[DI],DX

P:	DEC 	AX
	JNZ	X2

	INC	SI
	INC	SI
	DEC 	CX
	JNZ	X1

.exit
END
	 