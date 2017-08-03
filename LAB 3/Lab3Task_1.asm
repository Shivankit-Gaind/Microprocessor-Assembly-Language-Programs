.model  tiny
.data
dat1    db      21
dat2    db      ?
dat3    db      22 dup('$')
dat4    db      0ah, 0dh, '$'
.code
.startup
        lea     dx,dat1
        mov     ah,0ah
        int     21h
        lea     dx,dat4
        mov     ah,09h
        int     21h
        lea     dx,dat3
        mov     ah,09h
        int     21h
.exit
end

