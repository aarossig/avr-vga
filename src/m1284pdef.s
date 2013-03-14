;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Atmega1284 Register and Pin Mappings
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Input/Output Port Definitions
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Port A
.equ PINA,  0x00
.equ DDRA,  0x01
.equ PORTA, 0x02

; Port B
.equ PINB,  0x03
.equ DDRB,  0x04
.equ PORTB, 0x05

; PORT C
.equ PINC,  0x06
.equ DDRC,  0x07
.equ PORTC, 0x08

; Port D
.equ PIND,  0x09
.equ DDRD,  0x0A
.equ PORTD, 0x0B

; Pins
.equ PIN0, 0
.equ PIN1, 1
.equ PIN2, 2
.equ PIN3, 3
.equ PIN4, 4
.equ PIN5, 5
.equ PIN6, 6
.equ PIN7, 7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Timer/Counters
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Timer 0
.equ TCCR0A, 0x24
.equ TCCR0B, 0x25
.equ TCNT0,  0x26
.equ OCR0A,  0x27
.equ OCR0B,  0x28

; Pin Definitions, TCCR0A
.equ COM0A1, 7
.equ COM0A0, 6
.equ COM0B1, 5
.equ COM0B0, 4
.equ WGM01,  1
.equ WGM00,  0

; Pin Definitions, TCCR0B
.equ FOC0A, 7
.equ FOC0B, 6
.equ WGM02, 3
.equ CS02,  2
.equ CS01,  1
.equ CS00,  0

; Timer 3
.equ TCCR3A, 0x90
.equ TCCR3B, 0x91
.equ TCCR3C, 0x92
.equ TCNT3L, 0x94
.equ TCNT3H, 0x95
.equ ICR3L,  0x96
.equ ICR3H,  0x97
.equ OCR3AL, 0x98
.equ OCR3AH, 0x99
.equ OCR3BL, 0x9A
.equ OCR3BH, 0x9B

; Pin Definitions, TCCR3A
.equ COM3A1, 7
.equ COM3A0, 6
.equ COM3B1, 5
.equ COM3B0, 4
.equ WGM31,  1
.equ WGM30,  0

; Pin Definitions, TCCR3B
.equ ICNC3, 7
.equ ICES3, 6
.equ WGM33, 4
.equ WGM32, 3
.equ CS32,  2
.equ CS31,  1
.equ CS30,  0

; Pin Definitions, TCCR3C
.equ FOC3A, 7
.equ FOC3B, 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Interrupts
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Timer 0
;

; Interrupt Mask
.equ TIMSK0, 0x6E

; Pin Definitions, TIMSK0
.equ OCIE0B, 2
.equ OCIE0A, 1
.equ TOIE,   0

; Interrupt Flags
.equ TIFR0,  0x15

;
; Timer 3
;

; Interrupt Mask
.equ TIMSK3, 0x71

; Pin Definitions, TIMSK3
.equ ICIE3,  5
.equ OCIE3B, 2
.equ OCIE3A, 1
.equ TOIE3,  0

; Interrupt Flags
.equ TIFR3, 0x18

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Watchdog Timer
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Configuration Register
.equ WDTCSR, 0x60

; Flags
.equ WDIF, 7
.equ WDIE, 6
.equ WDP3, 5
.equ WDCE, 4
.equ WDE,  3
.equ WDP2, 2
.equ WDP1, 1
.equ WDP0, 0

