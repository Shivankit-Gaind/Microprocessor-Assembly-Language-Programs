.model tiny
.486
.data
	msg1	db	"Enter User Name", 0ah, 0dh, '$'
	max1	db	15
	count1  db	?
	username_input	db	16 dup('$')
	msg2	db	"Enter Password", 0ah, 0dh, '$'
	max2	db	15
	count2	db	?
	password_input	db	16 dup('$')
	msg3	db	"Hello $"
	nextline db 0ah, 0dh, '$'
	username	db	"jbnerd"
	password	db	"admin123"
.code
.startup
		lea		dx,msg1
		mov 	ah,09h
		int 	21h
		lea		dx,max1
		mov		ah,0ah
		int 	21h
		lea		si,username
		lea 	di,username_input
		mov 	bx, 00h
		mov 	cx,06h
cmploop:mov 	bl, byte ptr[si]
		cmp  	byte ptr[di],bl
		jne		last
		inc		si
		inc		di
		loop 	cmploop		
		lea 	dx,msg2
		mov		ah,09h
		int 	21h
		lea		dx,max2
		mov		ah,0ah
		int     21h
		lea		si,password
		lea		di,password_input
		mov		bx,00h
		mov		cx,08h
cpmloop:mov		bl, byte ptr[si]
		cmp		byte ptr[di],bl
		jne		last
		inc 	si
		inc 	di
		loop	cpmloop		
		lea		dx,msg3
		mov		ah,09h
		int 	21h
		lea 	dx,username_input	
		mov		ah,09h
		int 	21h
last:
.exit
end