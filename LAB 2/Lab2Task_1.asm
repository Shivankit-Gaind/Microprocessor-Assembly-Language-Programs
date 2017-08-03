.model	tiny
.486
.data
dat1	dd		45678902h,78076788h,9008123ah,345678abh,12345678h
max1	dd		?
.code
.startup
		lea		si,dat1
		mov		cx,5
		lodsd
x1:		cmp		eax,[si]
		jae		x2
		mov		eax,[si]
x2:		add		si,4
		loop	x1
		mov		max1,eax
.exit
end		