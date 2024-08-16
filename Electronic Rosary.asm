.include "m328pdef.inc"
ldi r20,0xff
out ddrb, r20 ;portb is output
ldi r21,0xff
out ddrd,r21 ;portd is output
ldi r22,0x00
out ddrc,r22 ;portb is input
ldi r17,1 ;units
ldi r19 ,0 ;tenth

check: ;pull down resistor
in r23,PINC ;push button
cpi r23,0
breq check ; jump if equal
call Delay_1sec

l1:
out PORTD,r19 ; tenth

l2:
out PORTB,r17 ; units
inc r17
cpi r17,10
brne check ;if r17=10 skip the line "jump if not equal"
ldi r17,0
inc r19
cpi r19,10
brne check ;if r19=10 skip the line "jump if not equal"
ldi r19,0

EAEAT
ldi r17,0
jmp check ;if 99 then make it 00 and repeat again

Delay:
LDI r29, 8
Delay1:
LDI r30, 125
Delay2:
LDI r31, 250
Delay3:
DEC r31
NOP
BRNE Delay3
DEC r30
BRNE Delay2
DEC r29
BRNE Delay1
RET