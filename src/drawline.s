;
; This is a "tight loop" that I have unrolled. This outputs 128 pixels and uses
; exactly 640 clock cycles. The Z-Index is used to access RAM sequentially.
;

; 0
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 4
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 8
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 12
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 16
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 20
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 24
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 28
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 32
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 36
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 40
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 44
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 48
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 52
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 56
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 60
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 64
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 68
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 72
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 76
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 80
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 84
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 88
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 92
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 96
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 100
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 104
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 108
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 112
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 116
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 120
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

; 124
ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop

ld r18, Z+
out PORTA, r18
nop
nop
