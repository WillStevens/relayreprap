	list p=16f882,f=INHX32
	#include p16f882.inc

;Bits of config1 word are set as follows (from bit 13 to bit 0) i.e. /DEBUG = bit 13
;/DEBUG = 1 : No in-circuit debugger
;LVP = 0 : RB3 is digital I/O (no low voltage programming)
;FCMEN = 0 : Failsafe clock monitor is disabled
;IESO = 0 : Internal External Switchover is disabled
;BOREN<1:0> = 11 : Brown out reset enabled
;/CPD = 1 : Data code protection off
;/CP = 1 : Program memory code protection off
;MCLRE = 0 : RE3 is digital input, MCLR is internal
;/PWRTE = 0 : Power up timer enabled
;WDTE = 0 : Watchdog timer disabled
;FOSC<2:0> = 010 : High speed external oscillator

	__config _CONFIG1,b'10001111000010'

;Bits of config2 word are set as follows (from bit 10 to bit 0)
;WRT<1:0> = 11 : Write protection off
;BOR4V = 1 : Brown out reset = 4 volts
; lower bits unimplemented, set to 1

	__config _CONFIG2,b'11111111111'

; This is used by the delay routines
DelayCounter1 equ 020h
DelayCounter2 equ 021h
Temp equ 022h
Temp2 equ 023h
ADHi equ 024h
ADLo equ 025h
RelayPin equ 026h
Timer0Count equ 027h
TimeOut equ 028h

	org 0000h

	goto Start
	nop
	nop
	nop

ISR
	btfsc INTCON,T0IF
	goto Timer0Interrupt
	retfie

Timer0Interrupt
	incf Timer0Count,1
	bcf INTCON,T0IF
	retfie

Start
	bsf STATUS,RP0
	;Disable PORT-B weak pullups,INTEDG=1,Timer0 from internal clock,T0SE=1,Prescaler to timer0,prescaler=111
	movlw b'11010111'	
	movwf OPTION_REG
	bcf STATUS,RP0

	; Pins used are as follows
	; RC7/RX = RS-232 RX
	; RC6/TX = RS-232 TX 
    ; RC0 = mosfet control
    ; RB0 = status LED
    ; RA0 = analogue input
    ; RA1 = analogue input

PortInit
	; Clear port B
	movlw 00h
	movwf PORTB
	movlw 000h
	bsf STATUS,RP0
	movwf TRISB
	bcf STATUS,RP0

	; Set port C pins 5 and 3 as outputs, for SPI port
    ; Port C pin 0 is an output
	movlw 000h
	movwf PORTC
	movlw b'11010110'
	bsf STATUS,RP0
	movwf TRISC
	bcf STATUS,RP0

	movlw 00h
	movwf PORTA
	; Set port A pins 0 and 1 as inputs, all others as outputs
	movlw 003h
	bsf STATUS,RP0
	movwf TRISA
	bcf STATUS,RP0

	call DelayLong

ADCInit
	bsf STATUS,RP0
	movlw b'10000000' 	;right justify
	movwf ADCON1 		;Vdd and Vss as Vref

	bsf STATUS,RP1
	bsf ANSEL,0			;Set RA0 to analog
	bsf ANSEL,1			;Set RA1 to analog
	bcf STATUS,RP0
	bcf STATUS,RP1
	movlw b'10000001'	;ADC Fosc/32 clock,
	movwf ADCON0		;AN0, On

USARTInit
	;initialise the baud rate
	bsf STATUS,RP0
	bsf STATUS,RP1

	bcf BAUDCTL,SCKP
	bcf BAUDCTL,BRG16

	bcf STATUS,RP1

	bsf TXSTA,BRGH

	; 10 = 115.2K baud with 20MHz oscillator
	movlw d'10'
	movwf SPBRG
	clrf SPBRGH

	bsf TXSTA,TXEN
	bcf TXSTA,SYNC

	bcf STATUS,RP0

	bsf RCSTA,SPEN
	bsf RCSTA,CREN

SPIInit
	bsf STATUS,RP0
	bcf SSPSTAT,SMP
	bsf SSPSTAT,CKE
	bcf STATUS,RP0
	movlw b'00100010'
	movwf SSPCON

InterruptInit
	clrf Timer0Count
	; Enable the timer 0 interrupt
	bsf INTCON,T0IE
	bsf INTCON,GIE

MainStart
	bsf PORTB,0
    call DelayLong
	bcf PORTB,0
    call DelayLong
	bsf PORTB,0
    call DelayLong
	bcf PORTB,0
    call DelayLong

	clrf RelayPin

	; Set the timeout value to 100 : 1.31072 seconds
	movlw d'100'
	movwf TimeOut

GoLoop
	clrf Timer0Count

	movlw 1
	xorwf RelayPin,1

	btfss RelayPin,0
	bcf PORTC,0
	btfsc RelayPin,0
	bsf PORTC,0

	btfss RelayPin,0
	bcf ADCON0,CHS0
	btfsc RelayPin,0
	bsf ADCON0,CHS0

ADCValueLoop
	call ADCValue

	; Transmit the ADC value, first byte has bit 7 clear, second byte has bit 7 set
	movf ADLo,0
	andlw 07fh
	call SendByte
	rlf ADLo,0
	rlf ADHi,0
	iorlw 080h
	call SendByte
	
	; Get count from the timer and compare it with the TimeOutValue
	movf Timer0Count,0
	xorwf TimeOut,0

	btfss STATUS,Z
	goto ADCValueLoop

	goto GoLoop

ADCValue
	bsf ADCON0,GO	; Set the GO bit

ADCWaitLoop
	btfsc ADCON0,GO	; Wait for the GO bit to clear
	goto ADCWaitLoop

	; Get the AD value
	bsf STATUS,RP0
	movf ADRESL,0
	bcf STATUS,RP0
	movwf ADLo
	movf ADRESH,0
	movwf ADHi
    return


SPISendWait
	movwf SSPBUF

	; When it has been sent, write 00h
	bsf STATUS,RP0
SPISendWaitLoop
	btfss SSPSTAT,BF
	goto SPISendWaitLoop
	bcf STATUS,RP0

	return

GetByte
	btfss PIR1,RCIF
	goto GetByte
	movf RCREG,0
	return
	
SendByte
	btfss PIR1,TXIF
	goto SendByte
	movwf TXREG
	return

; Output the value in W to the serial port in hex format
SendHex
	movwf Temp2
	swapf Temp2,0
	andlw 0fh
	call ConvertToHex
	call SendByte
	movf Temp2,0
	andlw 0fh
	call ConvertToHex
	call SendByte
	return

; Convert a value between 0 and 15 to a hex digit 0-F
; W contains the value
ConvertToHex
	addlw d'6'	; Add six so that if it is >=10 then bit 4 will be set
	movwf Temp
	movlw d'42'	; Get ready to add 42
	btfsc Temp,4
	addlw d'7'	; Add an additional seven if bit 4 is set
	addwf Temp,0
	return

; Inner loop will go for 256*8-1 = 2047 cycles
; Outerloop will go for 256*(2047)-1 = 524031 cycles
DelayLong
	clrf DelayCounter1
	clrf DelayCounter2
DelayLongLoop
	nop
	nop
	nop
	nop
	nop
	decfsz DelayCounter2,1
	goto DelayLongLoop
	decfsz DelayCounter1,1
	goto DelayLongLoop

	return

    end
