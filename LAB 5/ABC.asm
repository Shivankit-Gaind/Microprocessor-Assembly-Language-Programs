.MODEL TINY
.DATA
ATTRIBUTE  DB      04H
BEGINROW   DW      80
BEGINCOL   DW      70
ENDROW     DW      180
ENDCOL     DW      150
ORIGINAL   DB      ?
COLGAP	   DW      10
ROWGAP	   DW      10
RECTC      DB      2 ;NUMBER OF RECTANGLES


.CODE
.STARTUP
        MOV     AH,0FH ;GETTING THE DISPLAY MODE
        INT     10H
		
		
        MOV     ORIGINAL,AL ;PRESERVING THE ORIGINAL VALUE OF AL
        MOV     AL,12H ;SETTING THE DISPLAY MODE TO GRAPHICAL MODE
        MOV     AH,00
        INT     10H
		
		
X4:     MOV     DX,BEGINROW

X2:     MOV     CX,BEGINCOL

X1:     MOV     AL,ATTRIBUTE ;PIXEL COLOR
        MOV     AH,0CH ;FILLING A PIXEL
        INT     10H
		
        INC     CX
        CMP     CX,ENDCOL
        JNZ     X1
		
        INC     DX
        CMP     DX,ENDROW
        JNZ     X2
		
        DEC     RECTC 
        JZ      X3
        
		;MODIFICATION FOR THE NEXT RECTANGLE
		
		MOV		AX, ROWGAP ;REDUCING THE RECTANGLE SIZE
        ADD     BEGINROW,AX
        SUB     ENDROW,AX
		
        MOV     AX, COLGAP ;REDUCING THE RECTANGLE SIZE
		ADD     BEGINCOL,AX
        SUB     ENDCOL,AX
		
        CMP 	ATTRIBUTE, 04H
		JZ		CHANGEATTR
		JMP		CHANGEATTR2

CHANGEATTR:		MOV ATTRIBUTE, 00H	
				JMP FINAL
CHANGEATTR2:	MOV ATTRIBUTE, 04H

FINAL:			JMP X4

		
		
X3:     MOV     AH,07H ;TERMINATING THE PROGRAM
        INT     21H
        CMP     AL,'E'
        JNZ     X3
		
		
        MOV     AL,ORIGINAL ;RESTORING THE ORIGINAL DISPALY MODE
        MOV     AH,0
        INT     10H

.EXIT
END
