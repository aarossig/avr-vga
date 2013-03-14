;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Embedded Demo Platform
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.include "m1284pdef.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Interrupt Vector Table
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org 0x0000
__reset:        jmp main
__int0:         jmp default_interrupt
__int1:         jmp default_interrupt
__int2:         jmp default_interrupt
__pcint0:       jmp default_interrupt
__pcint1:       jmp default_interrupt
__pcint2:       jmp default_interrupt
__pcint3:       jmp default_interrupt
__wdt:          jmp default_interrupt
__timer2_compa: jmp default_interrupt
__timer2_compb: jmp default_interrupt
__timer2_ovf:   jmp default_interrupt
__timer1_capt:  jmp default_interrupt
__timer1_compa: jmp default_interrupt
__timer1_compb: jmp default_interrupt
__timer1_ovf:   jmp default_interrupt
__timer0_compa: jmp default_interrupt
__timer0_compb: jmp default_interrupt
__timer0_ovf:   jmp default_interrupt
__spi_stc:      jmp default_interrupt
__usart0_rxc:   jmp default_interrupt
__usart0_udre:  jmp default_interrupt
__usart0_tx:    jmp default_interrupt
__analog_comp:  jmp default_interrupt
__adc:          jmp default_interrupt
__ee_ready:     jmp default_interrupt
__twi:          jmp default_interrupt
__spm_ready:    jmp default_interrupt
__usart1_rx:    jmp default_interrupt
__usart1_udre:  jmp default_interrupt
__usart1_tx:    jmp default_interrupt
__timer3_capt:  jmp default_interrupt
__timer3_compa: jmp default_interrupt
__timer3_compb: jmp default_interrupt
__timer3_ovf:   jmp default_interrupt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Memory Locations
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; VGA Variables
.equ LINE_COUNTER, 0x0100 ; The current line that the processor is drawing

; Frame Buffer Variables
.equ FRAME_BUFFER, 0x0200 ; The beginning of the 128 * 96 frame buffer
.equ LINE_WIDTH, 128

; VGA Generation Constants
.equ V_LOWLINE, 492
.equ V_HIGHLINE, 494
.equ TOTAL_LINES, 524
.equ START_PIXELS, 48

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Pin Definitions
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Video Pins
.equ HSYNC, 6
.equ VSYNC, 7

; Frame Buffer Parameters
.equ FB_WIDTH, 128
.equ FB_HEIGHT, 96

; Audio Pins
.equ LCH, 3
.equ RCH, 4

; Status LEDs
.equ SUCCESS0, 6
.equ SUCCESS1, 5
.equ ERROR0,   4
.equ ERROR1,   3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Interrupt Handlers
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

default_interrupt:
	sbi PORTB, ERROR0
	rjmp default_interrupt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Application Code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

main:
	; Disable the watchdog timer
	ldi r16, 0
	sts WDTCSR, r16
	
	; Configure the status LEDs
	ldi r16, (1 << SUCCESS0) | (1 << SUCCESS1) | (1 << ERROR0) | (1 << ERROR1)
	out DDRD, r16
	
	; Enable the running LED
	sbi PORTD, SUCCESS0
	
	; Configure signal outputs
	ldi r16, (1 << HSYNC) | (1 << VSYNC) | (1 << LCH) | (1 << RCH)
	out DDRB, r16
	
	; Enable the video output
	ldi r16, 0xFF
	out DDRA, r16
	
	; Initial condition of HSYNC and VSYNC
	sbi PORTB, HSYNC
	sbi PORTB, VSYNC
	
	; Configure Timer 0 for audio playback
	ldi r16, (1 << COM0A1) | (1 << COM0B1) | (1 << WGM01) | (1 << WGM00)
	out TCCR0A, r16
	
	ldi r16, (1 << CS00)
	out TCCR0B, r16
	
	; Load an image into the framebuffer
	ldi r26, lo8(FRAME_BUFFER)
	ldi r27, hi8(FRAME_BUFFER)

	ldi r30, lo8(avrlogo)
	ldi r31, hi8(avrlogo)

	ldi r16, FB_HEIGHT
	ldi r17, FB_WIDTH
	
	dec_y:
		dec_x:
			lpm r18, Z+
			st X+, r18
			dec r17
			brne dec_x
		
		ldi r17, FB_WIDTH
		dec r16
		brne dec_y
	
	
	; Initial condition of the z Register
	ldi r30, lo8(FRAME_BUFFER)
	ldi r31, hi8(FRAME_BUFFER)
	
	; Make a copy of the z register in the y register to refer to later
	movw r28, r30

	; Initial condition of the line repeater
	ldi r17, 5

	; Initial condition of the line counter
	ldi r19, 96

; Main loop of the program. This is accomplished using cycle counting
loop:
	draw_line:
		;
		; Active Video - 640 cycles
		;
	
		; Write out the video data
		.include "drawline.s"                    ; 640
		
		;
		; Front Porch - 16 cycles
		;
	
		; Clear the video lines
		ldi r18, 0                               ; 1
		out PORTA, r18                           ; 1
		
		; Delay for 14 cycles
		ldi r18, 0                               ; 14
		h_front_porch_delay:
			inc r18
			cpi r18, 3
			brne h_front_porch_delay

		;
		; Sync Pulse - 96 cycles
		;
		
		cbi PORTB, HSYNC                         ; 2
		nop
		nop
		
		; Delay for 94 cycles
		ldi r18, 0                               ; 94
		h_sync_pulse_delay:
			inc r18
			cpi r18, 23
			brne h_sync_pulse_delay
		nop
		nop

		;
		; Back Porch - 48 cycles
		;

		sbi PORTB, HSYNC
		
		ldi r18, 0                               ; 33
		h_sync_back_porch_delay:
			inc r18
			cpi r18, 8
			brne h_sync_back_porch_delay
		nop
		
		; Check if the current line needs to be redrawn
		dec r17                                  ; 13
		brne redraw_line
		nop
		nop
		nop
		nop
		movw r28, r30
		ldi r17, 5
		dec r19
		breq end_of_frame
		jmp draw_line
		
		redraw_line:
			movw r30, r28
			nop
			nop
			nop
			nop
			nop
			nop
			jmp draw_line

	end_of_frame:                                ; 2
		ldi r20, 0
		ldi r19, 95
	
	; VSYNC Section
	draw_v_sync_line:
		; Stall for 654 cycles
		ldi r21, 0                               ; 654
		line_stall:
			inc r21
			cpi r21, 163
			brne line_stall
		nop
		nop

		; Lower hsync
		cbi PORTB, HSYNC                         ; 2
		
		; Stall for 14 cycles
		ldi r21, 0                               ; 94
		front_porch_stall:
			inc r21
			cpi r21, 23
			brne front_porch_stall
		nop
		nop
		
		; Raise hsync
		sbi PORTB, HSYNC                         ; 2
		
		; Back Porch, 48 cycles

		; Stall for 34 cycles
		ldi r21, 0                               ; 31
		back_porch_stall:
			inc r21
			cpi r21, 7
			brne back_porch_stall
		nop
		nop
		nop

		ldi r30, lo8(FRAME_BUFFER)               ; 3
		ldi r31, hi8(FRAME_BUFFER)
		movw r28, r30

		inc r20                                  ; 14
		cpi r20, 11
		breq lower_vsync
		rjmp test_raise_vsync
		
			lower_vsync:
				nop
				nop
				nop
				nop
				nop
				nop
				cbi PORTB, VSYNC
				rjmp draw_v_sync_line
		
		test_raise_vsync:
			cpi r20, 13
			breq raise_vsync
			rjmp test_draw_frame
			
			raise_vsync:
				nop
				nop
				sbi PORTB, VSYNC
				rjmp draw_v_sync_line

		test_draw_frame:
			cpi r20, 44
			brne next_line
			jmp draw_line

		next_line:
			rjmp draw_v_sync_line
	
skyline:
	.incbin "skyline.bin"

avrlogo:
	.incbin "avr-logo.bin"

tron:
	.incbin "tron.bin"
