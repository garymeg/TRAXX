* = $1200
#import "VIC_CONSTANTS.asm"
#import "TraxxCSKick.asm"

* =$2000 "Program"
	cld
	// set Screen Map and Character map
	// screen 			= $1000
	// colour 			= $9400
	// Character Map 	= $1400
	lda #%11001101
	sta VIC.VICCR5
	// set up screen colours
	// bits 7-4 = background colour
	// 0000xxxx black background
	// xxxx1xxx inverse text colour on/off (1=text inverse colour off)
	// bits 2-0 Boarder colour
	// xxxxx000 Black Boarder
	lda #%00001000
	sta VIC.VICCRF
	// set number of character lines
	// bits 6 - 1 number of character lines on screen ( x2)
	// bit 0 normal hight chars (8x8) if set to 1 (8x16)
	lda #%10111100
	sta VIC.VICCR3 
	// set top of screen position
	lda #%00011010
	sta VIC.VICCR1
    // set number of columns for the screen
	// bits 6-0 screen width in chars default is 22
	lda #25
	sta VIC.VICCR2 
	// set left side position of screen
	// bit 7 interlaced mode on/off
	// bit 6-0 left edge position default 5
	lda #$09
	sta VIC.VICCR0


	jsr DrawScreenHeader
	jmp JUMP_BRANCH_3060_2022_OK													//jump 1

// -------------------------------------------------------------------------------

ScreenHeader: // 100 bytes data showing high score
.byte $4b,$4b,$4b,$20,$20,$20,$20,$20
.byte $20,$20,$20,$41,$42,$43,$44,$45
.byte $20,$20,$20,$20,$20,$4b,$4b,$4b
.byte $20,$20,$20,$20,$20,$20,$20,$20
.byte $20,$20,$20,$20,$46,$47,$48,$49
.byte $4a,$20,$20,$20,$20,$20,$20,$20
.byte $20,$20,$5a,$31,$20,$30,$30,$30
.byte $30,$30,$20,$20,$20,$20,$20,$20
.byte $20,$20,$20,$5a,$32,$20,$30,$30
.byte $30,$30,$30,$20,$20,$20,$20,$20
.byte $20,$20,$20,$20,$6e,$20,$0c,$0c
.byte $01,$0d,$01,$20,$20,$20,$20,$20
.byte $20,$20,$20,$20

ScreenHeaderColour: // 100bytes data colours
.byte $05,$05,$05,$00,$00,$00,$00,$00
.byte $00,$00,$00,$03,$03,$03,$03,$03
.byte $00,$00,$00,$00,$00,$04,$04,$04
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$03,$03,$03,$03
.byte $03,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$03,$03,$00,$01,$01,$01
.byte $01,$01,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$03,$03,$00,$01,$01
.byte $01,$01,$01,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$01,$00,$03,$03
.byte $03,$03,$03,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00

// -------------------------------------------------------------------------------------------
DrawScreenHeader:
//------------------------------
// draw first 100 bytes (top 4 lines) to form screen headder
	ldy #$64
//------------------------------
// loop round untill all 100 chars are on screen
!DrawLoop:
//------------------------------
	lda ScreenHeader,Y 
	sta GAMESETTINGS.Screen-1,Y 
	lda ScreenHeaderColour,Y 
	sta GAMESETTINGS.ScreenColour -1,Y 
	dey 
	bne !DrawLoop-
	rts 
	
//------------------------------
SUBROUTINE__20FF_337A_OK:
SUBROUTINE__20FF_3392_OK:
SUBROUTINE__20FF_33FA_OK:
//------------------------------
	nop 
//------------------------------
SUBROUTINE__2100_2203_OK:
SUBROUTINE__2100_2BA3_OK:
SUBROUTINE__2100_2D46_OK:
SUBROUTINE__2100_2E8C_OK:
//------------------------------
	lda #$10
	sta $03 
	sta $05 
	lda #$64
	sta $02 
	sta $04 
	ldx #$08
//------------------------------
BRANCH_LOOP__210E_2131_OK:
//------------------------------
	ldy #$17
	lda #$51
//------------------------------
BRANCH_LOOP__2112_2115_OK:
//------------------------------
	sta ($04),Y 
	dey 
	bne BRANCH_LOOP__2112_2115_OK
	lda #$56
	ldy #$00
	sta ($04),Y 
	lda #$57
	ldy #$18
	sta ($04),Y 
	clc 
	lda $04 
	adc #$64
	sta $04 
	lda $05 
	adc #$00
	sta $05 
	dex 
	bne BRANCH_LOOP__210E_2131_OK
	lda $02 
	sta $04 
	lda $03 
	sta $05 
	ldy #$00
//------------------------------
BRANCH_LOOP__213D_2178_OK:
//------------------------------
	lda #$58
	sta ($04),Y 
	ldx #$18
//------------------------------
BRANCH_LOOP__2143_2163_OK:
//------------------------------
	lda $04 
	clc 
	adc #$19
	sta $04 
	lda $05 
	adc #$00
	sta $05 
	lda #$50
	sta $06 
	jsr SUBROUTINE__2195_2154_OK
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	lda $06 
	sta ($04),Y 
	dex 
	bne BRANCH_LOOP__2143_2163_OK
	lda #$59
	sta ($04),Y 
	lda $02 
	sta $04 
	lda $03 
	sta $05 
	iny 
	iny 
	iny 
	iny 
	nop 
	cpy #$1C
	bne BRANCH_LOOP__213D_2178_OK
	lda #$52
	ldy #$00
	sta ($02),Y 
	ldy #$18
	lda #$53
	sta ($02),Y 
	lda #$55
	ldy #$00
	sta $12BC,Y 
	ldy #$18
	lda #$54
	sta $12BC,Y 
	rts 
//------------------------------
SUBROUTINE__2195_2154_OK:
//------------------------------
	lda ($04),Y 
	cmp #$51
	bne BRANCH_LOOP__21A0_2199_OK
	lda #$4F
	sta $06 
	rts 
//------------------------------
BRANCH_LOOP__21A0_2199_OK:
//------------------------------
	cmp #$56
	bne BRANCH_LOOP__21A7_21A2_OK
	sta $06 
	rts 
//------------------------------
BRANCH_LOOP__21A7_21A2_OK:
//------------------------------
	cmp #$57
	bne BRANCH_LOOP__21AD_21A9_OK
	sta $06 
//------------------------------
BRANCH_LOOP__21AD_21A9_OK:
//------------------------------
	rts 
//------------------------------
SUBROUTINE__21AE_2200_OK:
SUBROUTINE__21AE_2E89_OK:
SUBROUTINE__21AE_2F03_OK:
SUBROUTINE__21AE_3000_OK:
//------------------------------
	lda #$10
	sta $05 
	lda #$64
	sta $04 
	ldx #$1A
//------------------------------
BRANCH_LOOP__21B8_21D1_OK:
//------------------------------
	ldy #$00
//------------------------------
BRANCH_LOOP__21BA_21C1_OK:
//------------------------------
	lda #$20
	jsr SUBROUTINE__21D4_21BC_OK
	cpy #$1A
	bne BRANCH_LOOP__21BA_21C1_OK
	lda $04 
	clc 
	adc #$19
	sta $04 
	lda $05 
	adc #$00
	sta $05 
	dex 
	bne BRANCH_LOOP__21B8_21D1_OK
	rts 
//------------------------------
SUBROUTINE__21D4_21BC_OK:
//------------------------------
	sta ($04),Y 
	lda $05 
	pha 
	clc 
	adc #$84
	sta $05 
	lda #$07
	sta ($04),Y 
	pla 
	sta $05 
	iny 
	rts 
//------------------------------
// $21E7
	.byte $F5,$F5,$F5,$F5,$F5,$F5
	.byte $F5,$F5,$F5,$F5,$F5,$F5
	.byte $F5,$F5,$F5,$F5,$F5,$F5
	.byte $F5,$F5,$F5,$F5,$F5,$F5
	.byte $F5
//------------------------------
JUMP_BRANCH_2200_3236_OK:
//------------------------------
	jsr SUBROUTINE__21AE_2200_OK
	jsr SUBROUTINE__2100_2203_OK
	lda $19
	sta $19
	lda #$0F
	sta VIC.VICCRE 
	jsr SUBROUTINE__2E0E_220F_OK
	jsr SUBROUTINE__2C1C_2212_OK
	jsr SUBROUTINE__2DDD_2215_OK
	nop 
	lda #$03
	sta $0E 
	sta $0F 
	lda $0D 
	sta $0D 
	sta $08 
	jsr SUBROUTINE__2920_2225_OK
	lda #$03
	sta $14 
	sta $13 
	lda $05 
	sta $2A 
	lda #$10
	sta $1B 
	lda $19 
	sta $19 
	lda #$00
	sta $17 
	sta $18 
	lda #$03
	sta $20 
	lda #$1F
	sta $21 
	lda $19 
	sta $00 
	nop 
	nop 
	nop 
	nop 
//------------------------------
MainGameLoop:
//------------------------------
	// update positions of players and pursuers
	jsr SUBROUTINE__28C8_2250_OK
	
	// Get player input
	jsr SUBROUTINE__2560_2253_OK

	// play ingame music
	jsr SUBROUTINE__28E1_2256_OK

	// some sounds messed up when disabled 
	jsr SUBROUTINE__2A0E_2259_OK

	//reset sounds after clompleation of grid block
	jsr SUBROUTINE__2A3B_225C_OK

	//No noticeably chanhe to gameplay when disabled!!
	jsr SUBROUTINE__2B11_225F_OK

	//No noticeably chanhe to gameplay when disabled!!
	jsr SUBROUTINE__2E9B_2262_OK

	//3 nop's added to be able to disable each subroutine above
	//nop 
	//nop
	//nop
	
	jmp MainGameLoop
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop
	//Has Stop key been pressed? 
	jsr KERNAL.ISCNTC
	bne MainGameLoop
	rts 
//------------------------------
// $2297
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$ea,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
.byte $f5

// $2300
.byte $96,$10,$00,$07,$50,$39,$11,$01
.byte $b7,$51,$f8,$11,$01,$87,$4f,$06
.byte $12,$01,$b7,$51,$a2,$10,$00,$07
.byte $50,$a6,$10,$00,$b7,$50,$aa,$10
.byte $00,$27,$50,$ae,$10,$00,$27,$50
.byte $af,$10,$02,$b7,$50,$c7,$10,$02
.byte $07,$50,$00,$00,$00,$e3,$00,$00
.byte $5b,$5c,$5d,$5e,$5f,$60,$61,$e4
.byte $01,$19,$00,$00,$00,$00,$00,$00
.byte $56,$01,$02,$03,$00,$58,$00,$02
.byte $03,$04,$4f,$01,$02,$03,$04,$63
.byte $01,$02,$03,$04,$64,$01,$02,$03
.byte $04,$6f,$01,$02,$03,$04,$59,$01
.byte $02,$00,$04,$57,$01,$00,$03,$04
.byte $52,$00,$02,$03,$00,$53,$00,$00
.byte $03,$04,$54,$01,$00,$00,$04,$55
.byte $01,$02,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
//------------------------------
JUMP_BRANCH_2390_2F52_OK:
//------------------------------
	lda $00 
	sta $FD 
//------------------------------
BRANCH_LOOP__2394_23B2_OK:
//------------------------------
	ldx #$00
	ldy $FD 
//------------------------------
BRANCH_LOOP__2398_239E_OK:
//------------------------------
	inx 
	inx 
	inx 
	inx 
	inx 
	dey 
	bne BRANCH_LOOP__2398_239E_OK
	lda $2300,X 
	sta $01 
	lda $2301,X 
	sta $02 
	jsr SUBROUTINE__23B5_23AA_OK
	jsr SUBROUTINE__23CE_23AD_OK
	dec $FD 
	bne BRANCH_LOOP__2394_23B2_OK
	rts 
//------------------------------
SUBROUTINE__23B5_23AA_OK:
//------------------------------
	txa 
	pha 
	lda $2302,X 
	tax 
	lda $2338,X 
	sta ($01),Y 
	lda $02 
	clc 
	adc #$84
	sta $02 
	lda #$03
	sta ($01),Y 
	pla 
	tax 
	rts 
//------------------------------
SUBROUTINE__23CE_23AD_OK:
//------------------------------
	txa 
	pha 
	tya 
	pha 
	ldx #$80
//------------------------------
BRANCH_LOOP__23D4_23D8_OK:
BRANCH_LOOP__23D4_23DB_OK:
//------------------------------
	stx VIC.VICCRD 
	dey 
	bne BRANCH_LOOP__23D4_23D8_OK
	inx 
	bne BRANCH_LOOP__23D4_23DB_OK
//------------------------------
BRANCH_LOOP__23DD_23E1_OK:
BRANCH_LOOP__23DD_23E6_OK:
//------------------------------
	stx VIC.VICCRD 
	dey 
	bne BRANCH_LOOP__23DD_23E1_OK
	dex 
	cpx #$7E
	bne BRANCH_LOOP__23DD_23E6_OK
	pla 
	tay 
	pla 
	tax 
	rts 
//------------------------------
	.byte $00,$00,$00
//------------------------------
SUBROUTINE__23F0_251E_OK:
//------------------------------
	lda $2300,X 
	sta $01 
	lda $2301,X 
	sta $02 
	lda #$00
	sta $03 
	clc 
	lda ($01),Y 
	and #$04
	bne BRANCH_LOOP__2409_2403_OK
	lda #$04
	sta $03 
//------------------------------
BRANCH_LOOP__2409_2403_OK:
//------------------------------
	lda $2304,X 
	sta ($01),Y 
	lda $02 
	clc 
	adc #$84
	sta $02 
	lda $2303,X 
	sta ($01),Y 
//------------------------------
JUMP_BRANCH_241A_2559_OK:
//------------------------------
	lda $2302,X 
	cmp #$00
	beq BRANCH_LOOP__243F_241F_OK
	cmp #$02
	beq BRANCH_LOOP__243F_2423_OK
	cmp #$01
	bne BRANCH_LOOP__2434_2427_OK
	inc $2300,X 
	bne BRANCH_LOOP__2431_242C_OK
	inc $2301,X 
//------------------------------
BRANCH_LOOP__2431_242C_OK:
//------------------------------
	jmp JUMP_BRANCH_2468_2431_OK
//------------------------------
BRANCH_LOOP__2434_2427_OK:
//------------------------------
	ldy #$01
	jsr SUBROUTINE__2532_2436_OK
	nop 
	nop 
	nop 
	jmp JUMP_BRANCH_2468_243C_OK
//------------------------------
BRANCH_LOOP__243F_241F_OK:
BRANCH_LOOP__243F_2423_OK:
//------------------------------
	cmp #$02
	beq BRANCH_LOOP__2457_2441_OK
	nop 
	nop 
	nop 
	jsr SUBROUTINE__2530_2446_OK
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	jmp JUMP_BRANCH_2468_2454_OK
//------------------------------
BRANCH_LOOP__2457_2441_OK:
//------------------------------
	lda $2300,X 
	clc 
	adc #$19
	sta $2300,X 
	lda $2301,X 
	adc #$00
	sta $2301,X 
//------------------------------
JUMP_BRANCH_2468_2431_OK:
JUMP_BRANCH_2468_243C_OK:
JUMP_BRANCH_2468_2454_OK:
//------------------------------
	lda $2300,X 
	sta $01 
	lda $2301,X 
	sta $02 
	lda ($01),Y 
	cmp #$50
	beq BRANCH_LOOP__24D8_2476_OK
	cmp #$51
	beq BRANCH_LOOP__24D8_247A_OK
	sta $04 
	txa 
	pha 
	ldy #$0C
	ldx #$00
//------------------------------
BRANCH_LOOP__2484_2491_OK:
//------------------------------
	lda $2348,X 
	cmp $04 
	beq BRANCH_LOOP__2495_2489_OK
	inx 
	inx 
	inx 
	inx 
	inx 
	dey 
	bne BRANCH_LOOP__2484_2491_OK
	beq BRANCH_LOOP__2508_2493_OK
//------------------------------
BRANCH_LOOP__2495_2489_OK:
//------------------------------
	stx $06 
	pla 
	tax 
	lda #$03
	jsr SUBROUTINE__28DB_249B_OK
	nop 
	and #$01
	beq BRANCH_LOOP__24A7_24A1_OK
	lda #$01
	sta $05 
//------------------------------
BRANCH_LOOP__24A7_24A1_OK:
//------------------------------
	ldy $05 
//------------------------------
BRANCH_LOOP__24A9_24B9_OK:
JUMP_BRANCH_24A9_24D3_OK:
//------------------------------
	inc $2302,X 
	lda $2302,X 
	cmp #$04
	bne BRANCH_LOOP__24B8_24B1_OK
	lda #$00
	sta $2302,X 
//------------------------------
BRANCH_LOOP__24B8_24B1_OK:
//------------------------------
	dey 
	bne BRANCH_LOOP__24A9_24B9_OK
	txa 
	pha 
	lda $2302,X 
	sta $07 
	lda $06 
	clc 
	adc $07 
	tax 
	lda $2349,X 
	cmp #$00
	bne BRANCH_LOOP__24D6_24CD_OK
	pla 
	tax 
	ldy #$02
	jmp JUMP_BRANCH_24A9_24D3_OK
//------------------------------
BRANCH_LOOP__24D6_24CD_OK:
//------------------------------
	pla 
	tax 
//------------------------------
BRANCH_LOOP__24D8_2476_OK:
BRANCH_LOOP__24D8_247A_OK:
//------------------------------
	lda $2300,X 
	sta $01 
	lda $2301,X 
	sta $02 
	lda ($01),Y 
	sta $2304,X 
	txa 
	pha 
	lda $2302,X 
	clc 
	adc $03 
	tax 
	lda $2338,X 
	sta ($01),Y 
	pla 
	tax 
	lda $02 
	clc 
	adc #$84
	sta $02 
//------------------------------
SUBROUTINE__24FF_3384_BAD:
//------------------------------
	lda ($01),Y 
	sta $2303,X 
	lda $20 
	sta ($01),Y 
	rts 
//------------------------------
BRANCH_LOOP__2508_2493_OK:
//------------------------------
	jmp JUMP_BRANCH_2BF8_2508_OK
	.byte $00,$00,$00,$00,$00
//------------------------------
SUBROUTINE__2510_25E0_OK:
//------------------------------
	ldy #$00
	lda $00 
	sta $FD 
//------------------------------
BRANCH_LOOP__2516_2523_OK:
//------------------------------
	lda $FD 
	asl  
	asl  
	clc 
	adc $FD 
	tax 
	jsr SUBROUTINE__23F0_251E_OK
	dec $FD 
	bne BRANCH_LOOP__2516_2523_OK
	rts 
//------------------------------
JUMP_BRANCH_2526_28D1_OK:
//------------------------------
	dec $08 
	beq BRANCH_LOOP__252B_2528_OK
	rts 
//------------------------------
BRANCH_LOOP__252B_2528_OK:
//------------------------------
	jmp JUMP_BRANCH_28D4_252B_OK
	.byte $00,$00
//------------------------------
SUBROUTINE__2530_2446_OK:
//------------------------------
	ldy #$19
//------------------------------
SUBROUTINE__2532_2436_OK:
BRANCH_LOOP__2532_2540_OK:
//------------------------------
	dec $2300,X 
	lda $2300,X 
	cmp #$FF
	bne BRANCH_LOOP__253F_253A_OK
	dec $2301,X 
//------------------------------
BRANCH_LOOP__253F_253A_OK:
//------------------------------
	dey 
	bne BRANCH_LOOP__2532_2540_OK
	rts 
//------------------------------
JUMP_BRANCH_2543_2C04_OK:
//------------------------------
	pla 
	tax 
	ldy #$02
//------------------------------
BRANCH_LOOP__2547_2557_OK:
//------------------------------
	inc $2302,X 
	lda $2302,X 
	cmp #$04
	bne BRANCH_LOOP__2556_254F_OK
	lda #$00
	sta $2302,X 
//------------------------------
BRANCH_LOOP__2556_254F_OK:
//------------------------------
	dey 
	bne BRANCH_LOOP__2547_2557_OK
	jmp JUMP_BRANCH_241A_2559_OK
	.byte $00,$00,$00,$00
//------------------------------

// read Keyboard?
SUBROUTINE__2560_2253_OK:
SUBROUTINE__2560_3079_OK:
//------------------------------
	sei 
	ldx #$7F
	stx $9122 
//------------------------------
BRANCH_LOOP__2566_256C_OK:
//------------------------------
	ldy $9120 
	cpy $9120 
	bne BRANCH_LOOP__2566_256C_OK
	ldx #$FF
	stx $9122 
	ldx #$F7
	stx $9120 
	cli 
//------------------------------
BRANCH_LOOP__2579_257F_OK:
//------------------------------
	lda $911F 
	cmp $911F 
	bne BRANCH_LOOP__2579_257F_OK
	pha 
	and #$1C
	lsr  
	cpy #$80
	bcc BRANCH_LOOP__258B_2587_OK
	ora #$10
//------------------------------
BRANCH_LOOP__258B_2587_OK:
//------------------------------
	tay 
	pla 
	and #$20
	cmp #$20
	tya 
	ror  
	eor #$8F
	sta $0A 
	rts 
//------------------------------
	.byte $00,$00,$00,$00,$00,$00,$00,$00
//------------------------------
JUMP_BRANCH_25A0_2BA6_OK:
SUBROUTINE__25A0_2D5E_OK:
SUBROUTINE__25A0_2D61_OK:
JUMP_BRANCH_25A0_2E20_OK:
SUBROUTINE__25A0_2E8F_OK:
//------------------------------
	lda #$C7
	sta $01 
	lda #$96
	sta $02 
	ldy #$05
	lda #$02
//------------------------------
BRANCH_LOOP__25AC_25AF_OK:
//------------------------------
	sta ($01),Y 
	dey 
	bne BRANCH_LOOP__25AC_25AF_OK
	inc $01 
	inc $01 
	lda $01 
	sta $2600 
	lda #$12
	sta $2601 
	lda #$51
	sta $2602 
	lda #$01
	sta $2603 
	lda #$00
	sta $2604 
	lda #$12
	sta $02 
	lda #$4C
	sta ($01),Y 
	lda #$02
	sta $2608 
	rts 
//------------------------------
	.byte $00,$00,$00,$00
//------------------------------
JUMP_BRANCH_25E0_28D8_OK:
//------------------------------
	jsr SUBROUTINE__2510_25E0_OK
	jmp JUMP_BRANCH_2620_25E3_OK
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$04,$A6,$10,$50,$00
	.byte $00,$00,$00,$00,$07
	.byte $4B,$4C,$4D,$4E
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00
//------------------------------
JUMP_BRANCH_2620_25E3_OK:
JUMP_BRANCH_2620_2BB4_OK:
//------------------------------
	lda $2600 
	sta $01 
	lda $2601 
	sta $02 
	ldy #$00
	lda ($01),Y 
	ldx $2603 
	cmp $2609,X 
	beq BRANCH_LOOP__2639_2634_OK
	jmp JUMP_BRANCH_2B91_2636_OK
//------------------------------
BRANCH_LOOP__2639_2634_OK:
//------------------------------
	lda #$00
	sta $0B 
	lda $2602 
	sta ($01),Y 
	lda $02 
	clc 
	adc #$84
	sta $02 
	lda $2608 
	sta ($01),Y 
	lda $2602 
	cmp #$50
	bne BRANCH_LOOP__265C_2653_OK
	lda #$03
	sta $0B 
	jmp JUMP_BRANCH_26A7_2659_OK
//------------------------------
BRANCH_LOOP__265C_2653_OK:
//------------------------------
	cmp #$51
	bne BRANCH_LOOP__2667_265E_OK
	lda #$0C
	sta $0B 
	jmp JUMP_BRANCH_26A7_2664_OK
//------------------------------
BRANCH_LOOP__2667_265E_OK:
//------------------------------
	ldx #$00
	ldy #$0C
	lda $2602 
//------------------------------
BRANCH_LOOP__266E_2679_OK:
//------------------------------
	cmp $2348,X 
	beq BRANCH_LOOP__267B_2671_OK
	inx 
	inx 
	inx 
	inx 
	inx 
	dey 
	bne BRANCH_LOOP__266E_2679_OK
//------------------------------
BRANCH_LOOP__267B_2671_OK:
//------------------------------
	lda $2349,X 
	beq BRANCH_LOOP__2686_267E_OK
	lda #$01
	ora $0B
	sta $0B 
//------------------------------
BRANCH_LOOP__2686_267E_OK:
//------------------------------
	lda $234A,X 
	beq BRANCH_LOOP__2691_2689_OK
	lda #$08
	ora $0B
	sta $0B 
//------------------------------
BRANCH_LOOP__2691_2689_OK:
//------------------------------
	lda $234B,X 
	beq BRANCH_LOOP__269C_2694_OK
	lda #$02
	ora $0B
	sta $0B 
//------------------------------
BRANCH_LOOP__269C_2694_OK:
//------------------------------
	lda $234C,X 
	beq BRANCH_LOOP__26A7_269F_OK
	lda #$04
	ora $0B
	sta $0B 
//------------------------------
JUMP_BRANCH_26A7_2659_OK:
JUMP_BRANCH_26A7_2664_OK:
BRANCH_LOOP__26A7_269F_OK:
//------------------------------
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	lda $0A 
	and #$0F
	beq BRANCH_LOOP__272D_26B1_OK
	lda $0A 
	and $0B
	sta $0B 
	lda $0B 
	beq BRANCH_LOOP__272D_26BB_OK
	and #$01
	beq BRANCH_LOOP__26DB_26BF_OK
	ldy #$19
//------------------------------
BRANCH_LOOP__26C3_26D1_OK:
//------------------------------
	dec $2600 
	lda $2600 
	cmp #$FF
	bne BRANCH_LOOP__26D0_26CB_OK
	dec $2601 
//------------------------------
BRANCH_LOOP__26D0_26CB_OK:
//------------------------------
	dey 
	bne BRANCH_LOOP__26C3_26D1_OK
	lda #$00
	sta $2603 
	jmp JUMP_BRANCH_272D_26D8_OK
//------------------------------
BRANCH_LOOP__26DB_26BF_OK:
//------------------------------
	lda $0B 
	and #$08
	beq BRANCH_LOOP__26F1_26DF_OK
	inc $2600 
	bne BRANCH_LOOP__26E9_26E4_OK
	inc $2601 
//------------------------------
BRANCH_LOOP__26E9_26E4_OK:
//------------------------------
	lda #$01
	sta $2603 
	jmp JUMP_BRANCH_272D_26EE_OK
//------------------------------
BRANCH_LOOP__26F1_26DF_OK:
//------------------------------
	lda $0B 
	and #$02
	beq BRANCH_LOOP__2710_26F5_OK
	lda $2600 
	clc 
	adc #$19
	sta $2600 
	lda $2601 
	adc #$00
	sta $2601 
	lda #$02
	sta $2603 
	jmp JUMP_BRANCH_272D_270D_OK
//------------------------------
BRANCH_LOOP__2710_26F5_OK:
//------------------------------
	lda $0B 
	and #$04
	beq BRANCH_LOOP__272D_2714_OK
	dec $2600 
	lda $2600 
	cmp #$FF
	bne BRANCH_LOOP__2723_271E_OK
	dec $2601 
//------------------------------
BRANCH_LOOP__2723_271E_OK:
//------------------------------
	lda #$03
	sta $2603 
	nop 
	nop 
	nop 
	nop 
	nop 
//------------------------------
BRANCH_LOOP__272D_26B1_OK:
BRANCH_LOOP__272D_26BB_OK:
JUMP_BRANCH_272D_26D8_OK:
JUMP_BRANCH_272D_26EE_OK:
JUMP_BRANCH_272D_270D_OK:
BRANCH_LOOP__272D_2714_OK:
//------------------------------
	ldy #$00
	nop 
	lda $2600 
	sta $01 
	lda $2601 
	sta $02 
	lda ($01),Y 
	ldx #$08
//------------------------------
BRANCH_LOOP__273E_2747_OK:
//------------------------------
	cmp $2337,X 
	bne BRANCH_LOOP__2746_2741_OK
	jmp JUMP_BRANCH_2B91_2743_OK
//------------------------------
BRANCH_LOOP__2746_2741_OK:
//------------------------------
	dex 
	bne BRANCH_LOOP__273E_2747_OK
	sta $2602 
	lda $02 
	clc 
	adc #$84
	sta $02 
	lda ($01),Y 
	and #$07
	cmp #$02
	bne BRANCH_LOOP__2773_2759_OK
	lda #$02
	sta $2608 
	lda $2604 
	beq BRANCH_LOOP__276B_2763_OK
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
//------------------------------
BRANCH_LOOP__276B_2763_OK:
//------------------------------
	nop 
	nop 
	jsr SUBROUTINE__27F8_276D_OK
	jmp JUMP_BRANCH_2787_2770_OK
//------------------------------
BRANCH_LOOP__2773_2759_OK:
//------------------------------
	lda $2608 
	cmp #$07
	beq BRANCH_LOOP__2787_2778_OK
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	jsr SUBROUTINE__27C0_2784_OK
//------------------------------
JUMP_BRANCH_2787_2770_OK:
BRANCH_LOOP__2787_2778_OK:
//------------------------------
	lda $09 
	nop 
	sta ($01),Y 
	lda $2601 
	sta $02 
	ldx $2603 
	lda $2609,X 
	sta ($01),Y 
	rts 
//------------------------------
// $279A
.byte $00,$00,$07,$00,$07,$00,$4f,$96
.byte $36,$96,$1d,$96,$04,$96,$eb,$95
.byte $d2,$95,$b9,$95,$a0,$95,$87,$95
.byte $6e,$95,$55,$95,$3c,$95,$4f,$56
.byte $57,$58,$59,$00,$00,$00

//------------------------------
SUBROUTINE__27C0_2784_OK:
//------------------------------
	inc $2604 
	lda $2604 
	asl  
	tax 
	lda $2600 
	sta $279E,X 
	lda $2601 
	clc 
	adc #$84
	sta $279F,X 
	txa 
	cmp #$02
	bne BRANCH_LOOP__27DD_27DA_OK
	rts 
//------------------------------
BRANCH_LOOP__27DD_27DA_OK:
//------------------------------
	lda $279C,X 
	cmp $279E,X 
	bne BRANCH_LOOP__27E9_27E3_OK
	dec $2604 
	rts 
//------------------------------
BRANCH_LOOP__27E9_27E3_OK:
//------------------------------
	lda $2604 
	cmp #$0C
	beq BRANCH_LOOP__27F1_27EE_OK
	rts 
//------------------------------
BRANCH_LOOP__27F1_27EE_OK:
//------------------------------
	jmp JUMP_BRANCH_2880_27F1_OK
	.byte $00,$00,$00,$00
//------------------------------
SUBROUTINE__27F8_276D_OK:
//------------------------------
	lda $2604 
	asl  
	tax 
	lda $279E,X 
	cmp $2600 
	bne BRANCH_LOOP__2806_2803_OK
	rts 
//------------------------------
BRANCH_LOOP__2806_2803_OK:
//------------------------------
	lda $2604 
	cmp #$03
	beq BRANCH_LOOP__2818_280B_OK
	cmp #$07
	beq BRANCH_LOOP__2818_280F_OK
	cmp #$0B
	beq BRANCH_LOOP__2818_2813_OK
	jmp JUMP_BRANCH_2880_2815_OK
//------------------------------
BRANCH_LOOP__2818_280B_OK:
BRANCH_LOOP__2818_280F_OK:
BRANCH_LOOP__2818_2813_OK:
//------------------------------
	lda $2602 
	jmp JUMP_BRANCH_2821_281B_OK
//------------------------------
BRANCH_LOOP__281E_2826_OK:
//------------------------------
	jmp JUMP_BRANCH_2A44_281E_OK
//------------------------------
JUMP_BRANCH_2821_281B_OK:
//------------------------------
	ldx #$05
//------------------------------
BRANCH_LOOP__2823_2829_OK:
//------------------------------
	cmp $27B7,X 
	beq BRANCH_LOOP__281E_2826_OK
	dex 
	bne BRANCH_LOOP__2823_2829_OK
	jmp JUMP_BRANCH_2880_282B_OK
//------------------------------
JUMP_BRANCH_282E_28C5_OK:
JUMP_BRANCH_282E_2E3C_OK:
//------------------------------
	lda #$00
	sta $2604 
//------------------------------
JUMP_BRANCH_2833_2873_OK:
JUMP_BRANCH_2833_287B_OK:
//------------------------------
	lda $2600 
	sta $01 
	lda $2601 
	clc 
	adc #$84
	sta $02 
	rts 
//------------------------------
BRANCH_LOOP__2841_2885_OK:
SUBROUTINE__2841_2BA0_OK:
SUBROUTINE__2841_2D3A_OK:
//------------------------------
	lda #$07
	sta $2608 
	lda $2604 
	cmp #$00
	bne BRANCH_LOOP__2850_284B_OK
	jmp JUMP_BRANCH_2876_284D_OK
//------------------------------
BRANCH_LOOP__2850_284B_OK:
//------------------------------
	asl  
	tax 
//------------------------------
BRANCH_LOOP__2852_2867_OK:
//------------------------------
	lda $279E,X 
	sta $01 
	lda $279F,X 
	sta $02 
	ldy #$00
	lda #$07
	sta ($01),Y 
	jsr SUBROUTINE__289A_2862_OK
	dex 
	dex 
	bne BRANCH_LOOP__2852_2867_OK
	lda #$00
	sta $2604 
	lda #$C3
	sta VIC.VICCRD 
	jmp JUMP_BRANCH_2833_2873_OK
//------------------------------
JUMP_BRANCH_2876_284D_OK:
//------------------------------
	lda #$02
	sta $2608 
	jmp JUMP_BRANCH_2833_287B_OK
	.byte $02,$02
//------------------------------
JUMP_BRANCH_2880_27F1_OK:
JUMP_BRANCH_2880_2815_OK:
JUMP_BRANCH_2880_282B_OK:
//------------------------------
	lda $2604 
	cmp #$01
	bne BRANCH_LOOP__2841_2885_OK
	lda $27A0 
	sta $01 
	lda $27A1 
	sta $02 
	ldy #$00
	lda #$07
	sta ($01),Y 
	jmp JUMP_BRANCH_28C2_2897_OK
//------------------------------
SUBROUTINE__289A_2862_OK:
SUBROUTINE__289A_28C2_OK:
//------------------------------
	txa 
	pha 
	tya 
	pha 
	ldy #$0A
	ldx #$00
//------------------------------
BRANCH_LOOP__28A2_28BB_OK:
//------------------------------
	lda $2300,X 
	cmp $01 
	bne BRANCH_LOOP__28B5_28A7_OK
	jsr SUBROUTINE__29C6_28A9_OK
	nop 
	nop 
	bne BRANCH_LOOP__28B5_28AE_OK
	lda #$07
//------------------------------
JUMP_BRANCH_28B2_1B50_OK:
//------------------------------
	sta $2303,X 
//------------------------------
BRANCH_LOOP__28B5_28A7_OK:
BRANCH_LOOP__28B5_28AE_OK:
//------------------------------
	inx 
	inx 
	inx 
	inx 
	inx 
	dey 
	bne BRANCH_LOOP__28A2_28BB_OK
	pla 
	tay 
	pla 
	tax 
	rts 
//------------------------------
JUMP_BRANCH_28C2_2897_OK:
//------------------------------
	jsr SUBROUTINE__289A_28C2_OK
	jmp JUMP_BRANCH_282E_28C5_OK
//------------------------------
SUBROUTINE__28C8_2250_OK:
//------------------------------
	dec $0F 
	beq BRANCH_LOOP__28CD_28CA_OK
	rts 
//------------------------------
BRANCH_LOOP__28CD_28CA_OK:
//------------------------------
	lda $0E 
	sta $0F 
	jmp JUMP_BRANCH_2526_28D1_OK
//------------------------------
JUMP_BRANCH_28D4_252B_OK:
//------------------------------
	lda $0D 
	sta $08 
	jmp JUMP_BRANCH_25E0_28D8_OK
//------------------------------
SUBROUTINE__28DB_249B_OK:
//------------------------------
	sta $05 
	lda VIC.VICCR4 
	rts 
//------------------------------
SUBROUTINE__28E1_2256_OK:
//------------------------------
	dec $14 
	beq !skip+
	rts 
//------------------------------
!skip:
//------------------------------
	lda $13 
	sta $14 
	dec $10 
	beq !skip+
//------------------------------
!skip:
//------------------------------
	lda #$28
	sta $10 
	dec VIC.VICCRE 
	lda VIC.VICCRE 
	beq !skip+
	rts 
//------------------------------
!skip:
//------------------------------
	ldy #$02
//------------------------------
!loop:
//------------------------------
	inc $15 
	bne !skip+
	inc $16 
//------------------------------
!skip:
//------------------------------
	dey 
	bne !loop-
	ldy #$00
	lda ($15),Y 
	cmp #$FF
	beq !skip+
	sta VIC.VICCRC 
	iny 
	lda ($15),Y 
	sta $13 
	sta $14 
	lda #$0F
	sta VIC.VICCRE 
	rts 
//------------------------------
	nop 
//------------------------------
SUBROUTINE__2920_2225_OK:
!skip:
//------------------------------
	jmp JUMP_BRANCH_29D0_2920_OK

// $2923
.byte $15,$a9,$29,$85,$16,$60,$02,$02
.byte $87,$02,$9f,$02,$af,$02,$87,$01
.byte $9f,$02,$af,$02,$87,$01,$9f,$02
.byte $af,$02,$87,$02,$a4,$02,$b7,$02
.byte $87,$01,$a4,$02,$b7,$02,$87,$01
.byte $a4,$02,$b7,$02,$87,$02,$9f,$02
.byte $af,$02,$87,$01,$9f,$02,$af,$02
.byte $87,$01,$9f,$02,$af,$02,$a4,$02
.byte $a4,$02,$a4,$01,$a4,$02,$a4,$04
.byte $a4,$01,$a4,$01,$af,$01,$af,$01
.byte $b3,$01,$b3,$01,$b7,$02,$bb,$02
.byte $b7,$02,$af,$02,$a4,$02,$af,$02
.byte $a4,$02,$93,$02,$af,$02,$af,$01
.byte $b7,$01,$af,$02,$a4,$02,$9f,$01
.byte $9f,$01,$93,$02,$87,$04,$b7,$01
.byte $b7,$01,$bb,$02,$b7,$02,$af,$02
.byte $a4,$02,$af,$02,$a4,$02,$93,$02
.byte $af,$02,$af,$01,$b7,$01,$af,$02
.byte $a4,$02,$9f,$01,$9f,$01,$93,$02
.byte $87,$04,$00,$01,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff

//------------------------------
SUBROUTINE__29C6_28A9_OK:
//------------------------------
	lda $2301,X 
	clc 
	adc #$84
	cmp $02 
	rts 
//------------------------------
	.byte $FF
//------------------------------
JUMP_BRANCH_29D0_2920_OK:
//------------------------------
	lda #$29
	sta $15 
	sta $16 
	lda #$01
	sta $10 
	lda #$01
	sta $13 
	sta $14 
	ldy #$00
	lda #$01
	sta VIC.VICCRE 
	rts 
//------------------------------
BRANCH_LOOP__29E8_2A12_OK:
JUMP_BRANCH_29E8_2B28_OK:
//------------------------------
	ldx #$01
//------------------------------
BRANCH_LOOP__29EA_2A0B_OK:
//------------------------------
	lda VIC.VICCRD 
	cmp #$C3
	bne BRANCH_LOOP__29F9_29EF_OK
	lda #$E1
	sta VIC.VICCRD 
	jmp JUMP_BRANCH_2A0A_29F6_OK
//------------------------------
BRANCH_LOOP__29F9_29EF_OK:
//------------------------------
	cmp #$E1
	bne BRANCH_LOOP__2A05_29FB_OK
	lda #$F0
	sta VIC.VICCRD 
	jmp JUMP_BRANCH_2A0A_2A02_OK
//------------------------------
BRANCH_LOOP__2A05_29FB_OK:
//------------------------------
	lda #$00
	sta VIC.VICCRD 
//------------------------------
JUMP_BRANCH_2A0A_29F6_OK:
JUMP_BRANCH_2A0A_2A02_OK:
//------------------------------
	dex 
	bne BRANCH_LOOP__29EA_2A0B_OK
	rts 
//------------------------------
SUBROUTINE__2A0E_2259_OK:
//------------------------------
	lda $08 
	cmp #$01
	beq BRANCH_LOOP__29E8_2A12_OK
	rts 
//------------------------------
BRANCH_LOOP__2A17_2A38_BAD:
BRANCH_LOOP__2A15_2A41_OK:
//------------------------------
	lda VIC.VICCRB 
	cmp #$00
	bne BRANCH_LOOP__2A1D_2A1A_OK
	rts 
//------------------------------
BRANCH_LOOP__2A1D_2A1A_OK:
//------------------------------
	inc VIC.VICCRB 
	inc VIC.VICCRA 
	inc VIC.VICCRD 
	rts 
//------------------------------
	.byte $0F
	sta VIC.VICCRE 
	rts 
//------------------------------
	sta $9009,X 
	jmp JUMP_BRANCH_2A37_2A2F_OK
	lda #$00
	sta $9009,X 
//------------------------------
JUMP_BRANCH_2A37_2A2F_OK:
//------------------------------
	dex 
	bne BRANCH_LOOP__2A17_2A38_BAD
	rts 
//------------------------------
SUBROUTINE__2A3B_225C_OK:
//------------------------------
	lda $08 
	nop 
	nop 
	cmp #$01
	beq BRANCH_LOOP__2A15_2A41_OK
	rts 
//------------------------------
JUMP_BRANCH_2A44_281E_OK:
//------------------------------
	lda #$F2
	sta VIC.VICCRA 
	sta VIC.VICCRB 
	ldy #$03
	ldx $19 
	jsr SUBROUTINE__2A60_2A50_OK
	inc $17 
	lda $17 
	cmp #$24
	beq BRANCH_LOOP__2A7E_2A59_OK
	nop 
	nop 
	jmp JUMP_BRANCH_2A83_2A5D_OK
//------------------------------
SUBROUTINE__2A60_2A50_OK:
BRANCH_LOOP__2A60_2A79_OK:
SUBROUTINE__2A60_2B49_OK:
//------------------------------
	tya 
	pha 
//------------------------------
BRANCH_LOOP__2A62_2A74_OK:
//------------------------------
	lda ($1A),Y 
	clc 
	adc #$01
	sta ($1A),Y 
	cmp #$3A
	bne BRANCH_LOOP__2A76_2A6B_OK
	lda #$30
	sta ($1A),Y 
	dey 
	cpy #$FF
	bne BRANCH_LOOP__2A62_2A74_OK
//------------------------------
BRANCH_LOOP__2A76_2A6B_OK:
//------------------------------
	pla 
	tay 
	dex 
	bne BRANCH_LOOP__2A60_2A79_OK
	ldy #$00
	rts 
//------------------------------
BRANCH_LOOP__2A7E_2A59_OK:
//------------------------------
	jmp JUMP_BRANCH_2EEE_2A7E_OK
	pla 
	rts 
//------------------------------
JUMP_BRANCH_2A83_2A5D_OK:
//------------------------------
	jsr SUBROUTINE__2FDA_2A83_OK
	and #$07
	cmp #$07
	beq BRANCH_LOOP__2AB3_2A8A_OK
	lda $947C 
	and #$07
	cmp #$07
	beq BRANCH_LOOP__2AB3_2A93_OK
	lda $96BC 
	and #$07
	cmp #$07
	beq BRANCH_LOOP__2AB3_2A9C_OK
	lda $96D4 
	and #$07
	cmp #$07
	beq BRANCH_LOOP__2AB3_2AA5_OK
	lda $18 
	bne BRANCH_LOOP__2AB3_2AA9_OK
	lda #$20
	sta $18 
	lda #$01
	sta $20 
//------------------------------
BRANCH_LOOP__2AB3_2A8A_OK:
BRANCH_LOOP__2AB3_2A93_OK:
BRANCH_LOOP__2AB3_2A9C_OK:
BRANCH_LOOP__2AB3_2AA5_OK:
BRANCH_LOOP__2AB3_2AA9_OK:
//------------------------------
	jmp JUMP_BRANCH_2E38_2AB3_OK
//------------------------------
JUMP_BRANCH_2AB6_2B19_OK:
//------------------------------
	lda $18 
	bne BRANCH_LOOP__2ABB_2AB8_OK
	rts 
//------------------------------
BRANCH_LOOP__2ABB_2AB8_OK:
//------------------------------
	cmp #$FF
	bne BRANCH_LOOP__2AC4_2ABD_OK
	lda #$03
	sta $20 
	rts 
//------------------------------
BRANCH_LOOP__2AC4_2ABD_OK:
//------------------------------
	cmp #$20
	bne BRANCH_LOOP__2AD6_2AC6_OK
	lda $21 
	sta $18 
	lda #$90
	sta VIC.VICCRC 
	lda #$01
	sta $13 
	rts 
//------------------------------
BRANCH_LOOP__2AD6_2AC6_OK:
//------------------------------
	jsr SUBROUTINE__2B2B_2AD6_OK
	lda VIC.VICCRC 
	cmp #$C0
	beq BRANCH_LOOP__2AE1_2ADE_OK
	rts 
//------------------------------
BRANCH_LOOP__2AE1_2ADE_OK:
//------------------------------
	lda #$90
	sta VIC.VICCRC 
	dec $18 
	lda #$01
	sta $20 
	lda #$01
	sta $20 
	lda $18 
	cmp #$08
	bne BRANCH_LOOP__2AFB_2AF4_OK
//------------------------------
BRANCH_LOOP__2AF6_2AFD_OK:
BRANCH_LOOP__2AF6_2B01_OK:
BRANCH_LOOP__2AF6_2B05_OK:
//------------------------------
	lda #$06
	sta $20 
	rts 
//------------------------------
BRANCH_LOOP__2AFB_2AF4_OK:
//------------------------------
	cmp #$06
	beq BRANCH_LOOP__2AF6_2AFD_OK
	cmp #$04
	beq BRANCH_LOOP__2AF6_2B01_OK
	cmp #$02
	beq BRANCH_LOOP__2AF6_2B05_OK
	cmp #$01
	beq BRANCH_LOOP__2B0C_2B09_OK
	rts 
//------------------------------
BRANCH_LOOP__2B0C_2B09_OK:
//------------------------------
	lda #$FF
	sta $18 
	rts 
//------------------------------
SUBROUTINE__2B11_225F_OK:
//------------------------------
	lda.abs $0010 
	cmp #$10
	beq BRANCH_LOOP__2B19_2B16_OK
	rts 
//------------------------------
BRANCH_LOOP__2B19_2B16_OK:
//------------------------------
	jmp JUMP_BRANCH_2AB6_2B19_OK
	lda $08 
	cmp #$01
	beq BRANCH_LOOP__2B23_2B20_OK
	rts 
//------------------------------
BRANCH_LOOP__2B23_2B20_OK:
//------------------------------
	lda $18 
	beq BRANCH_LOOP__2B28_2B25_OK
	rts 
//------------------------------
BRANCH_LOOP__2B28_2B25_OK:
//------------------------------
	jmp JUMP_BRANCH_29E8_2B28_OK
//------------------------------
SUBROUTINE__2B2B_2AD6_OK:
//------------------------------
	inc VIC.VICCRC 
	lda #$0F
	sta VIC.VICCRE 
	lda #$20
	sta $10 
	rts 
//------------------------------
BRANCH_LOOP__2B38_2B95_OK:
//------------------------------
	lda $18 
	beq BRANCH_LOOP__2B52_2B3A_OK
	jsr SUBROUTINE__2FD2_2B3C_OK
	nop 
	beq BRANCH_LOOP__2B45_2B40_OK
	asl  
	sta $22 
//------------------------------
BRANCH_LOOP__2B45_2B40_OK:
//------------------------------
	ldx $22 
	ldy #$02
	jsr SUBROUTINE__2A60_2B49_OK
	lda #$C3
	jmp JUMP_BRANCH_2BB7_2B4E_OK
	rts 
//------------------------------
BRANCH_LOOP__2B52_2B3A_OK:
JUMP_BRANCH_2B52_2B97_OK:
//------------------------------
	lda #$00
	jsr SUBROUTINE__2EDB_2B54_OK
	lda #$80
	sta VIC.VICCRD 
	lda #$0F
	sta VIC.VICCRE 
	sta VIC.VICCRE 
//------------------------------
BRANCH_LOOP__2B64_2B6D_OK:
//------------------------------
	ldy #$50
//------------------------------
BRANCH_LOOP__2B66_2B67_OK:
BRANCH_LOOP__2B66_2B8C_OK:
//------------------------------
	dey 
	bne BRANCH_LOOP__2B66_2B67_OK
	nop 
	nop 
	dec $1F 
	bne BRANCH_LOOP__2B64_2B6D_OK
	nop 
	lda $2600 
	sta $01 
	lda $2601 
	sta $02 
	lda VIC.VICCRE 
	and #$03
	tax 
//------------------------------
BRANCH_LOOP__2B80_2B87_OK:
//------------------------------
	lda $2609,X 
	sta ($01),Y 
	dec $1F 
	bne BRANCH_LOOP__2B80_2B87_OK
	dec VIC.VICCRE 
	bne BRANCH_LOOP__2B66_2B8C_OK
	jmp JUMP_BRANCH_2D3A_2B8E_OK
//------------------------------
JUMP_BRANCH_2B91_2636_OK:
JUMP_BRANCH_2B91_2743_OK:
JUMP_BRANCH_2B91_2C19_OK:
//------------------------------
	lda $18 
	cmp #$FF
	bne BRANCH_LOOP__2B38_2B95_OK
	jmp JUMP_BRANCH_2B52_2B97_OK
	.byte $FF,$FF,$FF,$FF,$FF,$FF
//------------------------------
JUMP_BRANCH_2BA0_2BF5_OK:
//------------------------------
	jsr SUBROUTINE__2841_2BA0_OK
	jsr SUBROUTINE__2100_2BA3_OK
	jmp JUMP_BRANCH_25A0_2BA6_OK
	.byte $02
	ldx $2603 
	lda $2609,X 
	ldy #$00
	sta ($01),Y 
	jmp JUMP_BRANCH_2620_2BB4_OK
//------------------------------
JUMP_BRANCH_2BB7_2B4E_OK:
//------------------------------
	ldx $22 
	lda $2600 
	sta $01 
	lda $2601 
	sta $02 
	ldy #$00
	lda #$A0
	clc 
	adc $22 
	sta ($01),Y 
	lda $02 
	clc 
	adc #$84
	sta $02 
	lda #$80
	sta $1F 
//------------------------------
BRANCH_LOOP__2BD7_2BEE_OK:
//------------------------------
	ldx #$08
	ldy #$00
//------------------------------
BRANCH_LOOP__2BDB_2BDC_OK:
BRANCH_LOOP__2BDB_2BDF_OK:
//------------------------------
	dey 
	bne BRANCH_LOOP__2BDB_2BDC_OK
	dex 
	bne BRANCH_LOOP__2BDB_2BDF_OK
	lda $1F 
	and #$07
	sta ($01),Y 
	lda $1F 
	sta VIC.VICCRC 
	inc $1F 
	bne BRANCH_LOOP__2BD7_2BEE_OK
	lda #$90
	sta VIC.VICCRC 
	jmp JUMP_BRANCH_2BA0_2BF5_OK
//------------------------------
JUMP_BRANCH_2BF8_2508_OK:
//------------------------------
	lda $04 
	ldx #$04
//------------------------------
BRANCH_LOOP__2BFC_2C02_OK:
//------------------------------
	cmp $2608,X 
	beq BRANCH_LOOP__2C07_2BFF_OK
	dex 
	bne BRANCH_LOOP__2BFC_2C02_OK
	jmp JUMP_BRANCH_2543_2C04_OK
//------------------------------
BRANCH_LOOP__2C07_2BFF_OK:
//------------------------------
	pla 
	tax 
	lda $2602 
	sta $2304,X 
	lda $2608 
	sta $2303,X 
	pla 
	pla 
	pla 
	pla 
	jmp JUMP_BRANCH_2B91_2C19_OK
//------------------------------
SUBROUTINE__2C1C_2212_OK:
//------------------------------
	ldx #$00
//------------------------------
BRANCH_LOOP__2C1E_2C3A_OK:
//------------------------------
	lda $9400,X 
	sta $3500,X 
	sta $3900,X 
	lda $9500,X 
	sta $3600,X 
	sta $3A00,X 
	lda $9600,X 
	sta $3700,X 
	sta $3B00,X 
	inx 
	bne BRANCH_LOOP__2C1E_2C3A_OK
	lda $26 
	sta $26 
	lda #$01
	sta $29 
	lda #$03
	sta $3C00 
	sta $3C10 
	lda #$00
	sta $3C01 
	sta $3C11 
//------------------------------
SUBROUTINE__2C54_2D64_OK:
//------------------------------
	lda $29 
	cmp #$02
	bne BRANCH_LOOP__2C5C_2C58_OK
	ldx #$10
//------------------------------
BRANCH_LOOP__2C5C_2C58_OK:
//------------------------------
	lda $3C00,X 
	bne BRANCH_LOOP__2C7B_2C5F_OK
	cpx #$10
	bne BRANCH_LOOP__2C6A_2C63_OK
	ldx #$10
	jmp JUMP_BRANCH_2C6C_2C67_OK
//------------------------------
BRANCH_LOOP__2C6A_2C63_OK:
//------------------------------
	ldx #$00
//------------------------------
JUMP_BRANCH_2C6C_2C67_OK:
//------------------------------
	lda $3C00,X 
	beq BRANCH_LOOP__2C72_2C6F_OK
	rts 
//------------------------------
BRANCH_LOOP__2C72_2C6F_OK:
JUMP_BRANCH_2C72_2E35_OK:
//------------------------------
	jmp JUMP_BRANCH_2EFB_2C72_OK
	pla 
	nop 
	nop 
	nop 
	nop 
	rts 
//------------------------------
BRANCH_LOOP__2C7B_2C5F_OK:
//------------------------------
	lda #$10
	sta $24 
	ldy #$00
	lda $29 
	cmp #$02
	bne BRANCH_LOOP__2C89_2C85_OK
	ldy #$15
//------------------------------
BRANCH_LOOP__2C89_2C85_OK:
//------------------------------
	sty $23 
	lda $29 
	cmp #$01
	bne BRANCH_LOOP__2C98_2C8F_OK
	lda #$35
	sta $2B 
	jmp JUMP_BRANCH_2C9C_2C95_OK
//------------------------------
BRANCH_LOOP__2C98_2C8F_OK:
//------------------------------
	lda #$39
	sta $2B 
//------------------------------
JUMP_BRANCH_2C9C_2C95_OK:
//------------------------------
	lda #$00
	sta $2A 
	sta $27 
	lda #$94
	sta $28 
	ldx #$03
//------------------------------
BRANCH_LOOP__2CA8_2CB6_OK:
//------------------------------
	ldy #$00
//------------------------------
BRANCH_LOOP__2CAA_2CAF_OK:
//------------------------------
	lda ($2A),Y 
	sta ($27),Y 
	iny 
	bne BRANCH_LOOP__2CAA_2CAF_OK
	inc $28 
	inc $2B 
	dex 
	bne BRANCH_LOOP__2CA8_2CB6_OK
	ldy #$05
	lda #$35
	sta $1A 
	lda $29 
	cmp #$02
	bne BRANCH_LOOP__2CCA_2CC2_OK
	ldy #$04
	lda #$46
	sta $1A 
//------------------------------
BRANCH_LOOP__2CCA_2CC2_OK:
//------------------------------
	sty $09 
	rts 
//------------------------------
	nop 
	nop 
	nop 
//------------------------------
JUMP_BRANCH_2CD0_2D89_OK:
//------------------------------
	ldx #$05
	lda $00 
	sta $1F 
	ldy #$00
//------------------------------
BRANCH_LOOP__2CD8_2CF1_OK:
//------------------------------
	lda $2300,X 
	sta $01 
	lda $2301,X 
	clc 
	adc #$84
	sta $02 
	lda $2303,X 
	sta ($01),Y 
	inx 
	inx 
	inx 
	inx 
	inx 
	dec $1F 
	bne BRANCH_LOOP__2CD8_2CF1_OK
	lda $29 
	cmp #$01
	bne BRANCH_LOOP__2D00_2CF7_OK
	lda #$35
	sta $2B 
	jmp JUMP_BRANCH_2D04_2CFD_OK
//------------------------------
BRANCH_LOOP__2D00_2CF7_OK:
//------------------------------
	lda #$39
	sta $2B 
//------------------------------
JUMP_BRANCH_2D04_2CFD_OK:
//------------------------------
	lda #$00
	sta $2A 
	sta $27 
	lda #$94
	sta $28 
	ldx #$03
//------------------------------
BRANCH_LOOP__2D10_2D1E_OK:
//------------------------------
	ldy #$00
//------------------------------
BRANCH_LOOP__2D12_2D17_OK:
//------------------------------
	lda ($27),Y 
	sta ($2A),Y 
	iny 
	bne BRANCH_LOOP__2D12_2D17_OK
	inc $2B 
	inc $28 
	dex 
	bne BRANCH_LOOP__2D10_2D1E_OK
	lda $29 
	cmp #$02
	bne BRANCH_LOOP__2D28_2D24_OK
	ldx #$10
//------------------------------
BRANCH_LOOP__2D28_2D24_OK:
//------------------------------
	lda $3C00,X 
	tay 
	dey 
	lda #$20
	sta ($23),Y 
	dec $3C00,X 
	nop 
	nop 
	rts 
//------------------------------
	nop 
	nop 
	nop 
//------------------------------
JUMP_BRANCH_2D3A_2B8E_OK:
//------------------------------
	jsr SUBROUTINE__2841_2D3A_OK
	jsr SUBROUTINE__2D70_2D3D_OK
	lda $26 
	cmp #$01
	bne BRANCH_LOOP__2D4F_2D44_OK
//------------------------------
BRANCH_LOOP__2D46_2D55_OK:
JUMP_BRANCH_2D46_2D5B_OK:
//------------------------------
	jsr SUBROUTINE__2100_2D46_OK
	jmp JUMP_BRANCH_2D5E_2D49_OK
	nop 
	nop 
	nop 
//------------------------------
BRANCH_LOOP__2D4F_2D44_OK:
BRANCH_LOOP__2D50_2DB4_BAD:
//------------------------------
	inc $29 
	lda $29 
	cmp #$03
	bne BRANCH_LOOP__2D46_2D55_OK
	lda #$01
//------------------------------
BRANCH_LOOP__2D59_2DB9_OK:
//------------------------------
	sta $29 
	jmp JUMP_BRANCH_2D46_2D5B_OK
//------------------------------
JUMP_BRANCH_2D5E_2D49_OK:
//------------------------------
	jsr SUBROUTINE__25A0_2D5E_OK
//------------------------------
BRANCH_LOOP__2D62_2DBE_BAD:
//------------------------------
	jsr SUBROUTINE__25A0_2D61_OK
	jsr SUBROUTINE__2C54_2D64_OK
	lda #$02
//------------------------------
BRANCH_LOOP__2D6B_2DC3_BAD:
//------------------------------
	sta VIC.VICCRE 
	jmp JUMP_BRANCH_2D8D_2D6C_OK
	nop 
//------------------------------
SUBROUTINE__2D70_2D3D_OK:
JUMP_BRANCH_2D70_2ED1_OK:
//------------------------------
	ldx #$00
	lda $29 
//------------------------------
BRANCH_LOOP__2D74_2DC8_OK:
//------------------------------
	cmp #$02
	bne BRANCH_LOOP__2D7A_2D76_OK
	ldx #$10
//------------------------------
BRANCH_LOOP__2D7A_2D76_OK:
//------------------------------
	lda $17 
//------------------------------
BRANCH_LOOP__2D7D_2DCD_BAD:
//------------------------------
	sta $3C03,X 
//------------------------------
BRANCH_LOOP__2D80_2DDC_BAD:
//------------------------------
	lda $19 
//------------------------------
BRANCH_LOOP__2D83_2DD2_BAD:
//------------------------------
	sta $3C02,X 
	lda $18 
	sta $3C04,X 
	jmp JUMP_BRANCH_2CD0_2D89_OK
	nop 
//------------------------------
JUMP_BRANCH_2D8D_2D6C_OK:
//------------------------------
	ldx #$00
	lda $29 
	cmp #$02
	bne BRANCH_LOOP__2D97_2D93_OK
	ldx #$10
//------------------------------
BRANCH_LOOP__2D97_2D93_OK:
//------------------------------
	lda $3C02,X 
	sta $19 
	lda $3C03,X 
//------------------------------
BRANCH_LOOP__2DA0_2DD7_BAD:
//------------------------------
	sta $17 
	lda $3C04,X 
	sta $18 
	jsr SUBROUTINE__2DDD_2DA6_OK
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	rts 
//------------------------------
// $2DB0

.byte $96,$10,$00,$07,$50,$9a,$10,$00
.byte $07,$50,$9e,$10,$00,$07,$50,$a2
.byte $10,$00,$07,$50,$a6,$10,$00,$07
.byte $50,$aa,$10,$00,$07,$50,$ae,$10
.byte $00,$07,$50,$af,$10,$02,$07,$50
.byte $c7,$10,$02,$07,$50

SUBROUTINE__2DDD_2215_OK:
SUBROUTINE__2DDD_2DA6_OK:
SUBROUTINE__2DDD_2E92_OK:
	ldx #$2D
BRANCH_LOOP__2DDF_2DE6_OK:
	lda $2DAF,X
	sta $2304,X
	dex
	bne BRANCH_LOOP__2DDF_2DE6_OK
	ldx #$05
	ldy #$00
	lda #$09
	sta $1F 
//------------------------------
BRANCH_LOOP__2DF0_2E09_OK:
//------------------------------
	lda $2300,X 
	sta $01 
	lda $2301,X 
	clc 
	adc #$84
	sta $02 
	lda ($01),Y 
	sta $2303,X 
	inx 
	inx 
	inx 
	inx 
	inx 
	dec $1F 
	bne BRANCH_LOOP__2DF0_2E09_OK
	jmp JUMP_BRANCH_2ED4_2E0B_OK
//------------------------------
SUBROUTINE__2E0E_220F_OK:
//------------------------------
	lda $19 
	sta $3C12 
	lda #$00
	sta $3C13 
	lda #$00
	sta $3C14 
	nop 
	nop 
	nop 
	jmp JUMP_BRANCH_25A0_2E20_OK
	cpx #$10
	bne BRANCH_LOOP__2E28_2E25_OK
//------------------------------
BRANCH_LOOP__2E27_2E2C_OK:
BRANCH_LOOP__2E27_2E33_OK:
//------------------------------
	rts 
//------------------------------
BRANCH_LOOP__2E28_2E25_OK:
//------------------------------
	lda $26 
	cmp #$01
	bne BRANCH_LOOP__2E27_2E2C_OK
	lda $2C00 
	cmp #$00
	bne BRANCH_LOOP__2E27_2E33_OK
	jmp JUMP_BRANCH_2C72_2E35_OK
//------------------------------
JUMP_BRANCH_2E38_2AB3_OK:
//------------------------------
	lda #$01
	sta $22 
	jmp JUMP_BRANCH_282E_2E3C_OK
	.byte $00
//------------------------------
JUMP_BRANCH_2E40_2EF1_OK:
//------------------------------
	ldx #$10
//------------------------------
BRANCH_LOOP__2E42_2E5E_OK:
//------------------------------
	lda #$E0
	sta $1F 
//------------------------------
BRANCH_LOOP__2E46_2E5B_OK:
//------------------------------
	ldy #$00
//------------------------------
BRANCH_LOOP__2E48_2E52_OK:
//------------------------------
	sta $9464,Y 
	sta $9500,Y 
	sta $9600,Y 
	iny 
	bne BRANCH_LOOP__2E48_2E52_OK
	lda $1F 
	sta VIC.VICCRC 
	inc $1F 
	bne BRANCH_LOOP__2E46_2E5B_OK
	dex 
	bne BRANCH_LOOP__2E42_2E5E_OK
	inc $19 
	lda #$00
	sta $18 
	lda #$01
	sta $22 
	lda #$00
	sta $17 
	inc $00 
	lda $19 
	cmp #$0A
	bne BRANCH_LOOP__2E7A_2E74_OK
	lda #$09
	sta $19 
//------------------------------
BRANCH_LOOP__2E7A_2E74_OK:
//------------------------------
	lda $19 
	sta $00 
	lda #$00
	sta VIC.VICCRC 
	sta VIC.VICCRB 
	sta VIC.VICCRA 
	jsr SUBROUTINE__21AE_2E89_OK
	jsr SUBROUTINE__2100_2E8C_OK
	jsr SUBROUTINE__25A0_2E8F_OK
	jsr SUBROUTINE__2DDD_2E92_OK
	jmp JUMP_BRANCH_2EF4_2E95_OK
	jmp MainGameLoop
//------------------------------
SUBROUTINE__2E9B_2262_OK:
//------------------------------
	lda $08 
	cmp #$01
	beq BRANCH_LOOP__2EA2_2E9F_OK
	rts 
//------------------------------
BRANCH_LOOP__2EA2_2E9F_OK:
//------------------------------
	dec $2A 
	beq BRANCH_LOOP__2EA7_2EA4_OK
	rts 
//------------------------------
BRANCH_LOOP__2EA7_2EA4_OK:
//------------------------------
	lda #$05
	sta $2A 
	ldx #$00
	lda $29 
	cmp #$02
	bne BRANCH_LOOP__2EB5_2EB1_OK
	ldx #$10
//------------------------------
BRANCH_LOOP__2EB5_2EB1_OK:
//------------------------------
	ldy $3C00,X 
	dey 
	lda ($23),Y 
	cmp #$20
	beq BRANCH_LOOP__2EC4_2EBD_OK
	lda #$20
	sta ($23),Y 
	rts 
//------------------------------
BRANCH_LOOP__2EC4_2EBD_OK:
//------------------------------
	lda #$4B
	sta ($23),Y 
	rts 
//------------------------------
	rti 
//------------------------------
	lda #$05
	sta $2A 
	nop 
	nop 
	nop 
	jmp JUMP_BRANCH_2D70_2ED1_OK
//------------------------------
JUMP_BRANCH_2ED4_2E0B_OK:
//------------------------------
	lda $19 
	sta $00 
	jmp JUMP_BRANCH_2F40_2ED8_OK
//------------------------------
SUBROUTINE__2EDB_2B54_OK:
SUBROUTINE__2EDB_2EEE_OK:
SUBROUTINE__2EDB_2EFB_OK:
SUBROUTINE__2EDB_2F4F_OK:
SUBROUTINE__2EDB_2F99_OK:
//------------------------------
	lda #$00
	sta VIC.VICCRA 
	sta VIC.VICCRB 
	sta VIC.VICCRC 
	sta VIC.VICCRD 
	lda #$03
	sta $20 
	rts 
//------------------------------
JUMP_BRANCH_2EEE_2A7E_OK:
//------------------------------
	jsr SUBROUTINE__2EDB_2EEE_OK
	jmp JUMP_BRANCH_2E40_2EF1_OK
//------------------------------
JUMP_BRANCH_2EF4_2E95_OK:
//------------------------------
	pla 
	pla 
	pla 
	pla 
	jmp MainGameLoop
//------------------------------
JUMP_BRANCH_2EFB_2C72_OK:
//------------------------------
	jsr SUBROUTINE__2EDB_2EFB_OK
	lda #$0F
	sta VIC.VICCRE 
	jsr SUBROUTINE__21AE_2F03_OK
	ldx #$09
//------------------------------
BRANCH_LOOP__2F08_2F0F_OK:
//------------------------------
	lda $2F36,X 
	sta $1101,X 
	dex 
	bne BRANCH_LOOP__2F08_2F0F_OK
	lda #$FF
	sta $1F 
//------------------------------
BRANCH_LOOP__2F15_2F2E_OK:
//------------------------------
	ldy $1F 
//------------------------------
BRANCH_LOOP__2F17_2F18_OK:
BRANCH_LOOP__2F17_2F26_OK:
//------------------------------
	dex 
	bne BRANCH_LOOP__2F17_2F18_OK
	sty VIC.VICCRA 
	sty VIC.VICCRB 
	sty VIC.VICCRC 
	dey 
	cpy #$80
	bne BRANCH_LOOP__2F17_2F26_OK
	dec $1F 
	lda $1F 
	cmp #$C0
	bne BRANCH_LOOP__2F15_2F2E_OK
	jmp JUMP_BRANCH_2F55_2F30_OK
	pla 
	rts 
//------------------------------
// $2F35
	.byte $0D,$05,$07,$01
	.byte $0D,$05,$20,$0F
	.byte $16,$05,$12
//------------------------------
JUMP_BRANCH_2F40_2ED8_OK:
//------------------------------
	lda $19 
	asl  
	sta $21 
	lda #$20
	sec 
	sbc $21 
	sta $21 
	nop 
	nop 
	nop 
	jsr SUBROUTINE__2EDB_2F4F_OK
	jmp JUMP_BRANCH_2390_2F52_OK
//------------------------------
JUMP_BRANCH_2F55_2F30_OK:
//------------------------------
	ldy #$00
	ldx #$05
//------------------------------
BRANCH_LOOP__2F59_2F67_OK:
//------------------------------
	lda $1035,Y 
	cmp $207B,Y 
	beq BRANCH_LOOP__2F65_2F5F_OK
	bpl BRANCH_LOOP__2F69_2F61_OK
	bmi BRANCH_LOOP__2F77_2F63_OK
//------------------------------
BRANCH_LOOP__2F65_2F5F_OK:
//------------------------------
	iny 
	dex 
	bne BRANCH_LOOP__2F59_2F67_OK
//------------------------------
BRANCH_LOOP__2F69_2F61_OK:
//------------------------------
	ldx #$05
//------------------------------
BRANCH_LOOP__2F6B_2F75_OK:
//------------------------------
	lda $1034,X 
	sta $207A,X 
	sta $1055,X 
	dex 
	bne BRANCH_LOOP__2F6B_2F75_OK
//------------------------------
BRANCH_LOOP__2F77_2F63_OK:
//------------------------------
	ldy #$00
	ldx #$05
//------------------------------
BRANCH_LOOP__2F7B_2F89_OK:
//------------------------------
	lda $1046,Y 
	cmp $207B,Y 
	beq BRANCH_LOOP__2F87_2F81_OK
	bpl BRANCH_LOOP__2F8B_2F83_OK
	bmi BRANCH_LOOP__2F99_2F85_OK
//------------------------------
BRANCH_LOOP__2F87_2F81_OK:
//------------------------------
	iny 
	dex 
	bne BRANCH_LOOP__2F7B_2F89_OK
//------------------------------
BRANCH_LOOP__2F8B_2F83_OK:
//------------------------------
	ldx #$05
//------------------------------
BRANCH_LOOP__2F8D_2F97_OK:
//------------------------------
	lda $1045,X 
	sta $207A,X 
	sta $1055,X 
	dex 
	bne BRANCH_LOOP__2F8D_2F97_OK
//------------------------------
BRANCH_LOOP__2F99_2F85_OK:
//------------------------------
	jsr SUBROUTINE__2EDB_2F99_OK
	nop 
	nop 
	nop 
	pla 
	pla 
	pla 
	pla 
	jmp JUMP_BRANCH_3060_2FA3_OK
//------------------------------
SUBROUTINE__2FA6_2FD2_OK:
SUBROUTINE__2FA6_2FDA_OK:
//------------------------------
	txa 
	pha 
	tya 
	pha 
	lda $00 
	sta $1F 
	ldx #$05
	ldy #$00
//------------------------------
BRANCH_LOOP__2FB2_2FCB_OK:
//------------------------------
	lda $2300,X 
	sta $01 
	lda $2301,X 
	clc 
	adc #$84
	sta $02 
	lda $2303,X 
	sta ($01),Y 
	inx 
	inx 
	inx 
	inx 
	inx 
	dec $1F 
	bne BRANCH_LOOP__2FB2_2FCB_OK
	pla 
	tay 
	pla 
	tax 
	rts 
//------------------------------
SUBROUTINE__2FD2_2B3C_OK:
//------------------------------
	jsr SUBROUTINE__2FA6_2FD2_OK
	lda $22 
	cmp #$10
	rts 
//------------------------------
SUBROUTINE__2FDA_2A83_OK:
//------------------------------
	jsr SUBROUTINE__2FA6_2FDA_OK
	lda $9464 
	rts 
//------------------------------
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00
//------------------------------
DrawOptionsTitleScreen:
//------------------------------
	jsr SUBROUTINE__21AE_3000_OK
	ldx #$12
//------------------------------
BRANCH_LOOP__3005_300C_OK:
//------------------------------
	lda $30FF,X 
	sta $107F,X 
	dex 
	bne BRANCH_LOOP__3005_300C_OK
	ldx #$05
//------------------------------
BRANCH_LOOP__3010_301D_OK:
//------------------------------
	lda $3111,X 
	sta $10B9,X 
	lda $3116,X 
	sta $10D2,X 
	dex 
	bne BRANCH_LOOP__3010_301D_OK
	ldx #$19
//------------------------------
BRANCH_LOOP__3021_3028_OK:
//------------------------------
	lda $311B,X 
	sta $10F9,X 
	dex 
	bne BRANCH_LOOP__3021_3028_OK
	nop 
	ldx #$07
//------------------------------
BRANCH_LOOP__302D_303A_OK:
//------------------------------
	lda $3134,X 
//------------------------------
SUBROUTINE__3030_206A_OK:
//------------------------------
	sta $1135,X 
	lda $313B,X 
	sta $114E,X 
	dex 
	bne BRANCH_LOOP__302D_303A_OK
	ldx #$14
//------------------------------
BRANCH_LOOP__303E_3051_OK:
//------------------------------
	lda $3142,X 
	sta $1178,X 
	lda $3156,X 
	sta $11AA,X 
	lda $316A,X 
	sta $11DC,X 
	dex 
	bne BRANCH_LOOP__303E_3051_OK
	ldx #$14
//------------------------------
BRANCH_LOOP__3055_305C_OK:
//------------------------------
	lda $317E,X 
	sta $120E,X 
	dex 
	bne BRANCH_LOOP__3055_305C_OK
	rts 
//------------------------------
	nop 
//------------------------------
JUMP_BRANCH_3060_2022_OK:
JUMP_BRANCH_3060_2FA3_OK:
//------------------------------
	jsr DrawOptionsTitleScreen
//------------------------------
BRANCH_LOOP__3063_3089_OK:
BRANCH_LOOP__3063_30B9_OK:
JUMP_BRANCH_3063_30D3_OK:
//------------------------------

//make screen colours flash
// set inital colour to 2 (Red)
//
	ldx #$02
//------------------------------
!NextFlashColour:
//------------------------------
	txa 
	ldy #$00
//------------------------------
!FillScreen:
//------------------------------
	sta GAMESETTINGS.ScreenColour + $64,Y 
	sta GAMESETTINGS.ScreenColour + $100,Y 
	sta GAMESETTINGS.ScreenColour + $200,Y 
	dey 
	bne !FillScreen-
	inx
	// Check if we are at last colour (8 - Yellow) 
	cpx #$08
	bne !NextFlashColour-
	jsr SUBROUTINE__2560_3079_OK
	lda $0A 
	and #$80
	beq BRANCH_LOOP__3085_3080_OK
	jmp JUMP_BRANCH_3200_3082_OK
//------------------------------
BRANCH_LOOP__3085_3080_OK:
//------------------------------
	lda $C5 
	cmp #$40
	beq BRANCH_LOOP__3063_3089_OK
	cmp #$27
	bne BRANCH_LOOP__30A1_308D_OK
	inc $3156 
	lda $3156 
	cmp #$3A
	bne BRANCH_LOOP__30CA_3097_OK
	lda #$31
	sta $3156 
	jmp JUMP_BRANCH_30CA_309E_OK
//------------------------------
BRANCH_LOOP__30A1_308D_OK:
//------------------------------
	cmp #$2F
	bne BRANCH_LOOP__30B7_30A3_OK
	inc $316A 
	lda $316A 
	cmp #$3A
	bne BRANCH_LOOP__30CA_30AD_OK
	lda #$31
	sta $316A 
	jmp JUMP_BRANCH_30CA_30B4_OK
//------------------------------
BRANCH_LOOP__30B7_30A3_OK:
//------------------------------
	cmp #$37
	bne BRANCH_LOOP__3063_30B9_OK
	inc $317E 
	lda $317E 
	cmp #$33
	bne BRANCH_LOOP__30CA_30C3_OK
	lda #$31
	sta $317E 
//------------------------------
BRANCH_LOOP__30CA_3097_OK:
JUMP_BRANCH_30CA_309E_OK:
BRANCH_LOOP__30CA_30AD_OK:
JUMP_BRANCH_30CA_30B4_OK:
BRANCH_LOOP__30CA_30C3_OK:
//------------------------------
	jsr DrawOptionsTitleScreen
//------------------------------
BRANCH_LOOP__30CD_30D1_OK:
//------------------------------
	lda $C5 
	cmp #$40
	bne BRANCH_LOOP__30CD_30D1_OK
	jmp JUMP_BRANCH_3063_30D3_OK
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
// $3100

.byte $0c,$0c,$01,$0d,$01,$13,$0f,$06
.byte $14,$20,$10,$12,$05,$13,$05,$0e
.byte $14,$13,$41,$42,$43,$44,$45,$46
.byte $47,$48,$49,$4a,$01,$04,$16,$01
.byte $0e,$03,$05,$04,$20,$07,$01,$0d
.byte $05,$20,$13,$0f,$06,$14,$17,$01
.byte $12,$05,$20,$02,$19,$81,$82,$83
.byte $84,$85,$86,$87,$88,$89,$20,$8a
.byte $8b,$8c,$8d,$06,$31,$3a,$20,$0e
.byte $0f,$2e,$20,$10,$15,$12,$13,$15
.byte $05,$12,$13,$3a,$20,$20,$33,$06
.byte $33,$3a,$20,$13,$10,$05,$05,$04
.byte $20,$20,$20,$20,$20,$20,$20,$3a
.byte $20,$20,$31,$06,$35,$3a,$20,$0e
.byte $0f,$2e,$20,$10,$0c,$01,$19,$05
.byte $12,$13,$20,$3a,$20,$20,$31,$10
.byte $12,$05,$13,$13,$20,$06,$09,$12
.byte $05,$20,$14,$0f,$20,$02,$05,$07
.byte $09,$0e,$2e

 nop
 nop
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
//------------------------------
JUMP_BRANCH_31B2_1B6C_OK:
JUMP_BRANCH_31B2_1BEE_OK:
//------------------------------
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
//------------------------------
JUMP_BRANCH_3200_3082_OK:
//------------------------------
	ldy #$30
	lda $317E 
	sta $26 
//------------------------------
BRANCH_LOOP__3207_320A_OK:
//------------------------------
	dec $26 
	dey 
	bne BRANCH_LOOP__3207_320A_OK
	ldy #$30
	lda $3156 
	sta $19 
//------------------------------
BRANCH_LOOP__3213_3216_OK:
//------------------------------
	dec $19 
	dey 
	bne BRANCH_LOOP__3213_3216_OK
	lda #$AA
	sta $0D 
	lda $316A 
	sta $1F 
	ldy #$30
//------------------------------
BRANCH_LOOP__3223_3226_OK:
//------------------------------
	dec $1F 
	dey 
	bne BRANCH_LOOP__3223_3226_OK
//------------------------------
BRANCH_LOOP__3228_3231_OK:
//------------------------------
	lda $0D 
	sec 
	sbc #$0A
	sta $0D 
	dec $1F 
	bne BRANCH_LOOP__3228_3231_OK
	jsr DrawScreenHeader
	jmp JUMP_BRANCH_2200_3236_OK

// $3239

.byte $02,$02,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$cb
.byte $f0,$00,$7f,$00,$7f,$24,$3f,$30
.byte $7f,$00,$ff,$20,$ff,$34,$7f,$14
.byte $9f,$00,$ff,$00,$ff,$14,$5f,$34
.byte $3f,$00,$ff,$00,$ff,$10,$6f,$14
.byte $bf,$00,$ff,$00,$ff,$30,$7f,$04
.byte $3f,$00,$ff,$00,$ff,$10,$3f,$14
.byte $7f,$00,$ff,$00,$ff,$34,$7f,$30
.byte $ff,$00,$ff,$00,$ff,$30,$7f,$30
.byte $ff,$00,$ff,$00,$ff,$30,$7d,$14
.byte $bf,$00,$ff,$00,$ff,$10,$7f,$34
.byte $3f,$00,$ff,$00,$ff,$10,$7f,$04
.byte $5f,$00,$ff,$00,$ff,$30,$3f,$20
.byte $eb,$00,$ff,$00,$ff,$10,$3f,$30
.byte $bf,$00,$ff,$00,$ff,$90,$3f,$04
.byte $3f,$00,$ff,$00,$ff,$20,$3f,$34
.byte $bf,$20,$ff,$20,$ff,$34,$3f,$30
.byte $7f,$00,$ff,$20,$ff,$24,$ff,$70
.byte $bf,$00,$ff,$10,$ff,$34,$bf,$30
.byte $7f,$20,$ff,$20,$ff,$32,$7f,$a4
.byte $3f,$00,$ff,$00,$ff,$30,$1f,$30
.byte $bf,$00,$ff,$00,$ff,$30,$ff,$34
.byte $3f,$00,$ff,$04,$ff,$10,$3f,$34
.byte $fb,$00,$7f,$00,$ff,$30,$3f,$34
.byte $ff,$10,$bf,$00,$ff,$30,$ff,$30
.byte $3f,$00,$ff,$10,$ff,$34,$bf,$20
.byte $7f,$00,$ff,$00,$ff,$34,$ff,$34
.byte $7f,$00,$ff,$00,$ff,$30,$bf,$10
.byte $3f,$00,$ff,$10,$ff,$30,$3f,$20
.byte $7f,$00,$bf,$00,$ff,$34,$7f,$30
.byte $3f,$00,$ff,$00,$ff,$30,$3f,$30
.byte $3f,$20,$ff,$10,$ff,$30,$1f,$44
.byte $3f,$20,$ff,$20,$ff,$30,$6f,$fc
.byte $08,$00,$ff,$00,$ff,$02,$ff,$01
.byte $ff,$00,$ff,$00,$ff,$00,$f7,$01
.byte $ff,$00,$ff,$00,$ff,$83,$ff,$13
.byte $3f,$00,$ff,$00,$ff,$02,$7f,$00
.byte $ff,$00,$ff,$00,$ff,$01,$f7,$00
.byte $ff,$00,$ff,$00,$ff,$42,$f7,$00
.byte $ff,$00,$ff,$00,$ff,$11,$ff,$02
.byte $ff,$00,$ff,$00,$ff,$02,$ff,$00
.byte $bf,$00,$f7,$00,$ff,$21,$f7,$02
.byte $f7,$00,$ff,$00,$ff,$02,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$01,$f7,$01
.byte $ff,$00,$ff,$00,$ff,$02,$ef,$13
.byte $b7,$00,$ff,$00,$ff,$02,$f7,$01
.byte $ff,$00,$ff,$02,$ff,$00,$f7,$41
.byte $f7,$02,$ff,$00,$ff,$22,$ff,$00
.byte $ff,$00,$bf,$00,$ff,$02,$df,$01
.byte $ff,$00,$f7,$00,$ff,$02,$f7,$01
.byte $ff,$00,$ff,$00,$ff,$82,$f7,$02
.byte $df,$00,$ff,$02,$ff,$02,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$00,$df,$03
.byte $ff,$00,$ff,$01,$ff,$00,$df,$02
.byte $ff,$00,$ff,$00,$ff,$00,$7f,$01
.byte $ff,$00,$ff,$01,$ff,$00,$ff,$01
.byte $ff,$00,$ff,$00,$ff,$02,$ff,$01
.byte $ff,$00,$ff,$00,$ff,$02,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$01,$f7,$02
.byte $ff,$00,$ff,$02,$ff,$21,$ff,$01
.byte $bf,$00,$ff,$00,$ff,$02,$f7,$00
.byte $f7,$00,$ff,$00,$f7,$06,$ef,$02
.byte $ff,$00,$ff,$00,$ff,$20,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$02,$ff,$01
.byte $ff,$00,$ff,$00,$ff,$03,$ff,$55
.byte $05,$05,$c0,$20,$20,$c0,$00,$00
.byte $c0,$20,$23,$c3,$03,$03,$c3,$20
.byte $20,$c0,$f0,$80,$c4,$54,$54,$c0
.byte $00,$00,$c0,$20,$20,$c0,$10,$20
.byte $c0,$50,$50,$c3,$83,$83,$c3,$53
.byte $50,$c0,$f0,$80,$c0,$50,$50,$c0
.byte $00,$03,$c3,$20,$21,$c1,$01,$01
.byte $c1,$20,$20,$c0,$00,$00,$c0,$20
.byte $20,$00,$f3,$83,$50,$51,$51,$01
.byte $01,$c1,$20,$20,$c0,$00,$10,$c0
.byte $50,$50,$c0,$91,$80,$c3,$53,$53
.byte $c3,$03,$f0,$c0,$50,$50,$c0,$00
.byte $00,$c0,$20,$27,$c7,$07,$07,$c7
.byte $27,$27,$c7,$07,$07,$c7,$27,$27
.byte $c7,$07,$f7,$c7,$57,$57,$c7,$07
.byte $07,$c7,$27,$27,$c7,$07,$17,$c7
.byte $57,$57,$c7,$97,$87,$c7,$57,$57
.byte $97,$07,$f7,$57,$57,$57,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$27
.byte $27,$c7,$07,$07,$c7,$27,$27,$c7
.byte $c7,$07,$c7,$57,$57,$c7,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$57
.byte $57,$c7,$47,$d7,$c7,$57,$57,$c7
.byte $97,$07,$c7,$57,$57,$c7,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$27
.byte $27,$c7,$07,$07,$c7,$27,$27,$d7
.byte $87,$07,$57,$57,$57,$07,$07,$c7
.byte $27,$27,$c7,$07,$07,$c7,$27,$57
.byte $c7,$67,$47,$c7,$57,$57,$c7,$37
.byte $97,$c7,$47,$57,$c7,$07,$07,$c7
.byte $27,$27,$c7,$07,$07,$c7,$27,$27
.byte $c7,$07,$07,$c7,$27,$27,$c7,$27
.byte $c7,$07,$07,$c7,$27,$27,$c7,$07
.byte $07,$c7,$27,$27,$c7,$87,$87,$c7
.byte $57,$57,$c7,$07,$07,$c7,$27,$27
.byte $c7,$07,$07,$c7,$27,$57,$c7,$37
.byte $47,$c7,$57,$57,$57,$17,$17,$57
.byte $47,$57,$07,$07,$c7,$27,$27,$c7
.byte $07,$07,$c7,$27,$27,$c7,$07,$07
.byte $c7,$27,$27,$c7,$87,$87,$c7,$57
.byte $57,$c7,$07,$07,$c7,$27,$27,$c7
.byte $07,$07,$c7,$27,$27,$c7,$17,$37
.byte $c7,$57,$57,$c7,$47,$17,$c7,$47
.byte $47,$c7,$07,$07,$c7,$27,$27,$c7
.byte $07,$07,$c7,$27,$27,$c7,$07,$07
.byte $c7,$27,$27,$77,$87,$87,$57,$57
.byte $57,$07,$07,$c7,$27,$27,$c7,$07
.byte $07,$c7,$27,$27,$c7,$07,$17,$c7
.byte $57,$57,$c7,$c7,$47,$c7,$47,$47
.byte $c7,$07,$07,$c7,$27,$27,$c7,$07
.byte $07,$c7,$27,$27,$c7,$07,$07,$c7
.byte $27,$27,$c7,$57,$87,$c7,$57,$57
.byte $c7,$07,$07,$c7,$27,$27,$c7,$07
.byte $07,$c7,$27,$27,$c7,$07,$17,$c7
.byte $57,$57,$97,$c7,$47,$57,$47,$57
.byte $f7,$07,$c7,$27,$27,$c7,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$27
.byte $27,$c7,$87,$77,$c7,$57,$57,$c7
.byte $07,$07,$c7,$27,$27,$c7,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$57
.byte $57,$c7,$87,$c7,$c7,$47,$47,$c7
.byte $f7,$07,$c7,$27,$27,$c7,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$27
.byte $27,$87,$87,$57,$57,$57,$57,$27
.byte $27,$a7,$47,$07,$a7,$27,$27,$57
.byte $57,$57,$57,$57,$57,$27,$47,$a7
.byte $27,$27,$a7,$07,$27,$a7,$27,$27
.byte $a7,$27,$47,$a7,$27,$57,$a7,$d7
.byte $17,$a7,$47,$47,$a7,$07,$f7,$a7
.byte $57,$27,$a7,$47,$27,$a7,$27,$27
.byte $a7,$07,$47,$a7,$27,$27,$a7,$57
.byte $57,$a7,$57,$57,$a7,$27,$47,$a7
.byte $27,$27,$a7,$07,$27,$a7,$27,$27
.byte $a7,$27,$47,$a7,$27,$57,$57,$d7
.byte $57,$57,$47,$57,$f7,$07,$a7,$57
.byte $57,$a7,$47,$07,$a7,$27,$27,$a7
.byte $e7,$07,$a7,$27,$27,$a7,$57,$57
.byte $a7,$57,$57,$a7,$e7,$27,$a7,$27
.byte $27,$a7,$47,$07,$a7,$27,$27,$a7
.byte $e7,$07,$a7,$27,$27,$a7,$57,$d7
.byte $a7,$47,$47,$a7,$f7,$07,$a7,$57
.byte $57,$a7,$47,$47,$a7,$27,$27,$a7
.byte $e7,$07,$a7,$27,$27,$57,$57,$57
.byte $57,$57,$57,$07,$e7,$a7,$27,$27
.byte $a7,$47,$47,$a7,$27,$27,$a7,$07
.byte $e7,$a7,$27,$27,$a7,$57,$57,$a7
.byte $47,$47,$a7,$f7,$f7,$a7,$57,$57
.byte $a7,$07,$47,$a7,$27,$27,$a7,$07
.byte $67,$a7,$27,$27,$a7,$57,$57,$a2
.byte $52,$52,$a2,$02,$e7,$a7,$27,$27
.byte $a7,$07,$47,$a7,$27,$27,$a7,$07
.byte $67,$a7,$27,$27,$57,$57,$57,$57
.byte $47,$57,$07,$f7,$a7,$57,$57,$a7
.byte $f7,$07,$a7,$27,$27,$a7,$77,$07
.byte $a7,$27,$27,$a7,$57,$57,$a7,$57
.byte $57,$a7,$77,$07,$a7,$27,$27,$5f
.byte $93,$00,$ff,$00,$ff,$80,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$a0,$f7,$80
.byte $ff,$00,$ff,$00,$ff,$a1,$df,$00
.byte $ff,$00,$ff,$00,$ff,$20,$fe,$08
.byte $d6,$00,$ff,$00,$ff,$21,$fe,$00
.byte $ff,$00,$ff,$00,$ff,$20,$fe,$84
.byte $fe,$00,$ff,$00,$ff,$24,$ff,$00
.byte $fe,$00,$ff,$00,$ff,$00,$fe,$00
.byte $ff,$00,$ff,$00,$ff,$00,$fe,$a1
.byte $f7,$00,$ff,$00,$ff,$04,$bf,$00
.byte $ff,$00,$ff,$00,$ff,$20,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$20,$ff,$88
.byte $be,$00,$ff,$00,$ff,$00,$bf,$a0
.byte $ff,$00,$ff,$00,$ff,$20,$ff,$00
.byte $7e,$00,$ff,$00,$ff,$a4,$fe,$80
.byte $fe,$00,$ff,$00,$ff,$80,$df,$80
.byte $ff,$00,$ff,$00,$ff,$01,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$00,$fd,$00
.byte $df,$00,$ff,$00,$ff,$00,$fe,$20
.byte $7e,$00,$ff,$00,$ff,$20,$fc,$88
.byte $fe,$00,$ff,$00,$ff,$08,$fe,$22
.byte $fe,$00,$ff,$00,$ff,$80,$fe,$90
.byte $fe,$00,$ff,$00,$ff,$01,$bf,$00
.byte $7f,$00,$ff,$00,$ff,$20,$ff,$b2
.byte $fe,$00,$ff,$00,$ff,$91,$ee,$80
.byte $ff,$00,$ff,$00,$ff,$80,$fe,$20
.byte $ff,$00,$ff,$00,$ff,$80,$ef,$20
.byte $ff,$00,$ff,$00,$ff,$80,$ef,$00
.byte $df,$00,$ff,$00,$ff,$80,$fe,$00
.byte $ff,$00,$ff,$00,$ff,$08,$de,$20
.byte $ff,$00,$ff,$00,$ff,$80,$fe,$00
.byte $ff,$00,$ff,$00,$ff,$00,$6f,$55
.byte $05,$05,$c0,$20,$20,$c0,$00,$00
.byte $c0,$20,$23,$c3,$03,$03,$c3,$20
.byte $20,$c0,$f0,$80,$c4,$54,$54,$c0
.byte $00,$00,$c0,$20,$20,$c0,$10,$20
.byte $c0,$50,$50,$c3,$83,$83,$c3,$53
.byte $50,$c0,$f0,$80,$c0,$50,$50,$c0
.byte $00,$03,$c3,$20,$21,$c1,$01,$01
.byte $c1,$20,$20,$c0,$00,$00,$c0,$20
.byte $20,$00,$f3,$83,$50,$51,$51,$01
.byte $01,$c1,$20,$20,$c0,$00,$10,$c0
.byte $50,$50,$c0,$91,$80,$c3,$53,$53
.byte $c3,$03,$f0,$c0,$50,$50,$c0,$00
.byte $00,$c0,$20,$27,$c7,$07,$07,$c7
.byte $27,$27,$c7,$07,$07,$c7,$27,$27
.byte $c7,$07,$f7,$c7,$57,$57,$c7,$07
.byte $07,$c7,$27,$27,$c7,$07,$17,$c7
.byte $57,$57,$c7,$97,$87,$c7,$57,$57
.byte $97,$07,$f7,$57,$57,$57,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$27
.byte $27,$c7,$07,$07,$c7,$27,$27,$c7
.byte $c7,$07,$c7,$57,$57,$c7,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$57
.byte $57,$c7,$47,$d7,$c7,$57,$57,$c7
.byte $97,$07,$c7,$57,$57,$c7,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$27
.byte $27,$c7,$07,$07,$c7,$27,$27,$d7
.byte $87,$07,$57,$57,$57,$07,$07,$c7
.byte $27,$27,$c7,$07,$07,$c7,$27,$57
.byte $c7,$67,$47,$c7,$57,$57,$c7,$37
.byte $97,$c7,$47,$57,$c7,$07,$07,$c7
.byte $27,$27,$c7,$07,$07,$c7,$27,$27
.byte $c7,$07,$07,$c7,$27,$27,$c7,$27
.byte $c7,$07,$07,$c7,$27,$27,$c7,$07
.byte $07,$c7,$27,$27,$c7,$87,$87,$c7
.byte $57,$57,$c7,$07,$07,$c7,$27,$27
.byte $c7,$07,$07,$c7,$27,$57,$c7,$37
.byte $47,$c7,$57,$57,$57,$17,$17,$57
.byte $47,$57,$07,$07,$c7,$27,$27,$c7
.byte $07,$07,$c7,$27,$27,$c7,$07,$07
.byte $c7,$27,$27,$c7,$87,$87,$c7,$57
.byte $57,$c7,$07,$07,$c7,$27,$27,$c7
.byte $07,$07,$c7,$27,$27,$c7,$17,$37
.byte $c7,$57,$57,$c7,$47,$17,$c7,$47
.byte $47,$c7,$07,$07,$c7,$27,$27,$c7
.byte $07,$07,$c7,$27,$27,$c7,$07,$07
.byte $c7,$27,$27,$77,$87,$87,$57,$57
.byte $57,$07,$07,$c7,$27,$27,$c7,$07
.byte $07,$c7,$27,$27,$c7,$07,$17,$c7
.byte $57,$57,$c7,$c7,$47,$c7,$47,$47
.byte $c7,$07,$07,$c7,$27,$27,$c7,$07
.byte $07,$c7,$27,$27,$c7,$07,$07,$c7
.byte $27,$27,$c7,$57,$87,$c7,$57,$57
.byte $c7,$07,$07,$c7,$27,$27,$c7,$07
.byte $07,$c7,$27,$27,$c7,$07,$17,$c7
.byte $57,$57,$97,$c7,$47,$57,$47,$57
.byte $f7,$07,$c7,$27,$27,$c7,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$27
.byte $27,$c7,$87,$77,$c7,$57,$57,$c7
.byte $07,$07,$c7,$27,$27,$c7,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$57
.byte $57,$c7,$87,$c7,$c7,$47,$47,$c7
.byte $f7,$07,$c7,$27,$27,$c7,$07,$07
.byte $c7,$27,$27,$c7,$07,$07,$c7,$27
.byte $27,$87,$87,$57,$57,$57,$57,$27
.byte $27,$a7,$47,$07,$a7,$27,$27,$57
.byte $57,$57,$57,$57,$57,$27,$47,$a7
.byte $27,$27,$a7,$07,$27,$a7,$27,$27
.byte $a7,$27,$47,$a7,$27,$57,$a7,$d7
.byte $17,$a7,$47,$47,$a7,$07,$f7,$a7
.byte $57,$27,$a7,$47,$27,$a7,$27,$27
.byte $a7,$07,$47,$a7,$27,$27,$a7,$57
.byte $57,$a7,$57,$57,$a7,$27,$47,$a7
.byte $27,$27,$a7,$07,$27,$a7,$27,$27
.byte $a7,$27,$47,$a7,$27,$57,$57,$d7
.byte $57,$57,$47,$57,$f7,$07,$a7,$57
.byte $57,$a7,$47,$07,$a7,$27,$27,$a7
.byte $e7,$07,$a7,$27,$27,$a7,$57,$57
.byte $a7,$57,$57,$a7,$e7,$27,$a7,$27
.byte $27,$a7,$47,$07,$a7,$27,$27,$a7
.byte $e7,$07,$a7,$27,$27,$a7,$57,$d7
.byte $a7,$47,$47,$a7,$f7,$07,$a7,$57
.byte $57,$a7,$47,$47,$a7,$27,$27,$a7
.byte $e7,$07,$a7,$27,$27,$57,$57,$57
.byte $57,$57,$57,$07,$e7,$a7,$27,$27
.byte $a7,$47,$47,$a7,$27,$27,$a7,$07
.byte $e7,$a7,$27,$27,$a7,$57,$57,$a7
.byte $47,$47,$a7,$f7,$f7,$a7,$57,$57
.byte $a7,$07,$47,$a7,$27,$27,$a7,$07
.byte $67,$a7,$27,$27,$a7,$57,$57,$a2
.byte $52,$52,$a2,$02,$e7,$a7,$27,$27
.byte $a7,$07,$47,$a7,$27,$27,$a7,$07
.byte $67,$a7,$27,$27,$57,$57,$57,$57
.byte $47,$57,$07,$f7,$a7,$57,$57,$a7
.byte $f7,$07,$a7,$27,$27,$a7,$77,$07
.byte $a7,$27,$27,$a7,$57,$57,$a7,$57
.byte $57,$a7,$77,$07,$a7,$27,$27,$03
.byte $00,$03,$06,$00,$ff,$00,$ef,$20
.byte $9f,$00,$ff,$00,$ff,$20,$f7,$03
.byte $00,$03,$00,$00,$ff,$00,$a5,$06
.byte $ff,$00,$ff,$00,$ff,$00,$af,$20
.byte $ff,$00,$ff,$00,$ff,$00,$a7,$20
.byte $f7,$00,$ff,$00,$ff,$00,$b7,$20
.byte $ff,$00,$ff,$00,$ff,$91,$af,$40
.byte $af,$00,$ff,$00,$ff,$00,$b7,$01
.byte $ff,$00,$ff,$00,$ff,$82,$f7,$00
.byte $ff,$00,$ff,$00,$ff,$00,$bf,$00
.byte $f7,$00,$ff,$00,$ff,$20,$df,$80
.byte $af,$00,$ff,$00,$ff,$00,$ff,$00
.byte $f7,$00,$ff,$00,$ff,$10,$ef,$00
.byte $f7,$00,$ff,$00,$ff,$02,$ef,$40
.byte $e7,$00,$ff,$00,$ff,$a0,$fd,$02
.byte $ff,$00,$ff,$00,$ff,$00,$f6,$09
.byte $bf,$00,$ff,$00,$ff,$10,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$00,$e9,$20
.byte $ef,$00,$ff,$00,$ff,$00,$f7,$00
.byte $ff,$00,$ff,$00,$ff,$00,$f7,$00
.byte $bf,$00,$ff,$00,$ff,$00,$ad,$00
.byte $bf,$00,$ff,$00,$ff,$00,$8f,$00
.byte $bf,$00,$ff,$00,$ff,$00,$ff,$02
.byte $b7,$00,$ff,$00,$ff,$81,$a7,$00
.byte $ff,$00,$ff,$00,$ff,$80,$ed,$00
.byte $ba,$00,$ff,$00,$ff,$00,$f7,$00
.byte $e7,$00,$ff,$00,$ff,$80,$ff,$42
.byte $ef,$00,$ff,$00,$ff,$00,$af,$52
.byte $e5,$00,$ff,$00,$ff,$20,$bf,$00
.byte $ff,$00,$ff,$00,$ff,$00,$ff,$1a
.byte $af,$00,$ff,$00,$ff,$00,$f7,$01
.byte $e6,$00,$ff,$00,$ff,$0a,$ff,$ec
.byte $86,$00,$ff,$00,$ff,$00,$ff,$19
.byte $f9,$00,$ff,$00,$ff,$12,$ff,$16
.byte $fd,$00,$ff,$00,$ff,$12,$fe,$00
.byte $f6,$00,$ff,$00,$ff,$10,$ff,$00
.byte $fb,$00,$ff,$00,$ff,$20,$f5,$01
.byte $ff,$00,$ff,$00,$ff,$52,$ff,$10
.byte $fd,$00,$ff,$00,$ff,$90,$ff,$00
.byte $fb,$00,$ff,$00,$ff,$18,$bd,$10
.byte $7b,$00,$ff,$00,$ff,$10,$ff,$10
.byte $fb,$00,$ff,$00,$ff,$10,$fb,$12
.byte $ff,$00,$ff,$00,$ff,$00,$fd,$10
.byte $fb,$00,$ff,$00,$ff,$02,$cf,$00
.byte $ff,$00,$ff,$00,$ff,$18,$fd,$00
.byte $ff,$00,$ff,$00,$ff,$02,$ff,$10
.byte $ff,$00,$ff,$00,$ff,$01,$ef,$12
.byte $ff,$00,$ff,$00,$ff,$02,$f9,$12
.byte $fb,$00,$ff,$00,$ff,$10,$fb,$12
.byte $ff,$00,$ff,$00,$ff,$0a,$ff,$12
.byte $ff,$00,$ff,$00,$ff,$10,$ff,$06
.byte $fc,$00,$ff,$00,$ff,$00,$f3,$00
.byte $f9,$00,$ff,$00,$ff,$20,$fd,$12
.byte $f3,$00,$ff,$00,$ff,$90,$ff,$12
.byte $f9,$00,$ff,$00,$ff,$12,$ff,$10
.byte $fd,$00,$ff,$00,$ff,$02,$fb,$12
.byte $fb,$00,$ff,$00,$ff,$00,$fb,$12
.byte $fe,$00,$ff,$00,$ff,$02,$f7,$00
.byte $fa,$00,$ff,$00,$ff,$13,$fb,$10
.byte $ff,$00,$ff,$00,$ff,$10,$f9,$10
.byte $fb,$00,$ff,$00,$ff,$10,$fd,$12
.byte $fa,$00,$ff,$00,$ff,$11,$f7,$80
.byte $ff,$00,$ff,$00,$ff,$04,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$00,$7a,$ef
.byte $ca,$00,$ff,$00,$ff,$00,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$00,$7f,$00
.byte $ff,$00,$ff,$00,$ff,$00,$fd,$00
.byte $ff,$00,$ff,$00,$ff,$02,$fd,$08
.byte $ff,$00,$ff,$00,$ff,$00,$fd,$02
.byte $f7,$00,$ff,$00,$ff,$00,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$00,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$00,$f3,$00
.byte $ff,$00,$ff,$00,$ff,$20,$ff,$00
.byte $ff,$00,$ff,$00,$ff,$01,$ff,$00
.byte $f7,$00,$ff,$00,$ff,$02,$f7,$00
.byte $ff,$00,$ff,$00,$ff,$00,$f5,$00
.byte $bf,$00,$ff,$00,$ff,$00,$ff,$10
.byte $f7,$00,$ff,$00,$ff,$00,$fd,$00
.byte $67,$00,$ff,$00,$ff,$08,$f5,$00
.byte $b7,$00,$ff,$00,$ff,$a5,$ff,$00
.byte $f5,$00,$ff,$00,$ff,$00,$f5,$00
.byte $f7,$00,$ff,$00,$ff,$00,$ff,$00
.byte $fd,$00,$ff,$00,$ff,$02,$f7,$00
.byte $f7,$00,$ff,$00,$ff,$00,$f7,$00
.byte $f7,$00,$ff,$00,$ff,$00,$f7,$10
.byte $ff,$00,$ff,$00,$ff,$00,$bf,$80
.byte $ff,$00,$ff,$00,$ff,$00,$fd,$40
.byte $f5,$00,$ff,$00,$ff,$14,$fd,$00
.byte $f7,$00,$ff,$00,$ff,$08,$f7,$01
.byte $ef,$00,$ff,$00,$ff,$00,$f7,$00
.byte $ff,$00,$ff,$00,$ff,$10,$f7,$01
.byte $ff,$00,$ff,$00,$ff,$00,$f5,$50
.byte $fd,$00,$ff,$00,$ff,$01,$f7,$00
.byte $fd,$00,$ff,$00,$ff,$04,$fd,$00
.byte $ff,$00,$ff,$00,$ff,$00,$ff,$00
.byte $7f,$00,$ff,$00,$ff,$92,$ff,$ff
.byte $d5,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$20
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$20,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $20,$00,$ff,$00,$ff,$40,$00,$00
.byte $00,$00,$fb,$00,$ff,$40,$00,$80
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$80,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $02,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$60,$01,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$08
.byte $00,$00,$ff,$00,$ff,$04,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$08
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$11
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$00,$00
.byte $02,$00,$ff,$00,$ff,$01,$00,$00
.byte $00,$00,$ff,$00,$ff,$00,$ff