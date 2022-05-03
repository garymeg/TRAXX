* = $1200
#import "TraxxCSKick.asm"

* =$2000 "Program"
				cld 
				lda #$CD
				sta $9005 
				lda #$08
				sta $900F 
				lda #$BC
				sta $9003 
				lda #$1A
				sta $9001 
				lda #$19
				sta $9002 
				lda #$09
				sta $9000 
				jsr Draw_Game_Status_Screen
				jmp Title_Options_Screen	//JUMP_3060_2022_OK

			// -------------------------------------------------------------------------------

			TitleScreen:
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

			TitleScreenColour:
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
Draw_Game_Status_Screen:
	// SUBROUTINE_20ED_201F_OK:
	// SUBROUTINE_20ED_3233_OK:
			//------------------------------
				ldy #$64
			//------------------------------
			LOOP_SKIP_20EF_20FC_OK:
			//------------------------------
				lda $2024,Y 
				sta $0FFF,Y 
				lda $2088,Y 
				sta $93FF,Y 
				dey 
				bne LOOP_SKIP_20EF_20FC_OK
				rts 
			//------------------------------
SUBROUTINE_20FF_337A_OK:
SUBROUTINE_20FF_3392_OK:
SUBROUTINE_20FF_33FA_OK:
			//------------------------------
				nop 
			//------------------------------
Draw_Play_Grid:
	// SUBROUTINE_2100_2203_OK:
	// SUBROUTINE_2100_2BA3_OK:
	// SUBROUTINE_2100_2D46_OK:
	// SUBROUTINE_2100_2E8C_OK:
			//------------------------------
				lda #$10
				sta $03 
				sta $05 
				lda #$64
				sta $02 
				sta $04 
				ldx #$08
			//------------------------------
			LOOP_SKIP_210E_2131_OK:
			//------------------------------
				ldy #$17
				lda #$51
			//------------------------------
			LOOP_SKIP_2112_2115_OK:
			//------------------------------
				sta ($04),Y 
				dey 
				bne LOOP_SKIP_2112_2115_OK
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
				bne LOOP_SKIP_210E_2131_OK
				lda $02 
				sta $04 
				lda $03 
				sta $05 
				ldy #$00
			//------------------------------
			LOOP_SKIP_213D_2178_OK:
			//------------------------------
				lda #$58
				sta ($04),Y 
				ldx #$18
			//------------------------------
			LOOP_SKIP_2143_2163_OK:
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
				jsr SUBROUTINE_2195_2154_OK
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
				bne LOOP_SKIP_2143_2163_OK
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
				bne LOOP_SKIP_213D_2178_OK
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
	SUBROUTINE_2195_2154_OK:
			//------------------------------
				lda ($04),Y 
				cmp #$51
				bne LOOP_SKIP_21A0_2199_OK
				lda #$4F
				sta $06 
				rts 
			//------------------------------
			LOOP_SKIP_21A0_2199_OK:
			//------------------------------
				cmp #$56
				bne LOOP_SKIP_21A7_21A2_OK
				sta $06 
				rts 
			//------------------------------
			LOOP_SKIP_21A7_21A2_OK:
			//------------------------------
				cmp #$57
				bne LOOP_SKIP_21AD_21A9_OK
				sta $06 
			//------------------------------
			LOOP_SKIP_21AD_21A9_OK:
			//------------------------------
				rts 
			//------------------------------
Clear_The_Screen:
	// SUBROUTINE_21AE_2200_OK:
	// SUBROUTINE_21AE_2E89_OK:
	// SUBROUTINE_21AE_2F03_OK:
	// SUBROUTINE_21AE_3000_OK:
			//------------------------------
				lda #$10
				sta $05 
				lda #$64
				sta $04 
				ldx #$1A
			//------------------------------
			LOOP_SKIP_21B8_21D1_OK:
			//------------------------------
				ldy #$00
			//------------------------------
			LOOP_SKIP_21BA_21C1_OK:
			//------------------------------
				lda #$20
				jsr Print_Character_To_Screen_In_Yellow
				cpy #$1A
				bne LOOP_SKIP_21BA_21C1_OK
				lda $04 
				clc 
				adc #$19
				sta $04 
				lda $05 
				adc #$00
				sta $05 
				dex 
				bne LOOP_SKIP_21B8_21D1_OK
				rts 
			//------------------------------
	Print_Character_To_Screen_In_Yellow:
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
	JUMP_2200_3236_OK:
			//------------------------------
				jsr Clear_The_Screen
				jsr Draw_Play_Grid
				lda $19
				sta $19
				lda #$0F
				sta $900E 
				jsr SUBROUTINE_2E0E_220F_OK
				jsr SUBROUTINE_2C1C_2212_OK
				jsr SUBROUTINE_2DDD_2215_OK
				nop 
				lda #$03
				sta $0E 
				sta $0F 
				lda $0D 
				sta $0D 
				sta $08 
				jsr SUBROUTINE_2920_2225_OK
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
			JUMP_2250_2265_OK:
			LOOP_SKIP_2250_2294_OK:
			JUMP_2250_2E98_OK:
			JUMP_2250_2EF8_OK:
			//------------------------------
				
				
				jsr SUBROUTINE_28C8_2250_OK
				jsr SUBROUTINE_2560_2253_OK      //Get Joystick
				jsr SUBROUTINE_28E1_2256_OK      //Play Music
				jsr SUBROUTINE_2A0E_2259_OK
				jsr SUBROUTINE_2A3B_225C_OK
				jsr SUBROUTINE_2B11_225F_OK
				jsr SUBROUTINE_2E9B_2262_OK
				jmp JUMP_2250_2265_OK
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
				jsr $FFE1
				bne LOOP_SKIP_2250_2294_OK
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
			JUMP_2390_2F52_OK:
			//------------------------------
				lda $00 
				sta $FD 
			//------------------------------
			LOOP_SKIP_2394_23B2_OK:
			//------------------------------
				ldx #$00
				ldy $FD 
			//------------------------------
			LOOP_SKIP_2398_239E_OK:
			//------------------------------
				inx 
				inx 
				inx 
				inx 
				inx 
				dey 
				bne LOOP_SKIP_2398_239E_OK
				lda $2300,X 
				sta $01 
				lda $2301,X 
				sta $02 
				jsr SUBROUTINE_23B5_23AA_OK
				jsr SUBROUTINE_23CE_23AD_OK
				dec $FD 
				bne LOOP_SKIP_2394_23B2_OK
				rts 
			//------------------------------
SUBROUTINE_23B5_23AA_OK:
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
SUBROUTINE_23CE_23AD_OK:
			//------------------------------
				txa 
				pha 
				tya 
				pha 
				ldx #$80
			//------------------------------
			LOOP_SKIP_23D4_23D8_OK:
			LOOP_SKIP_23D4_23DB_OK:
			//------------------------------
				stx $900D 
				dey 
				bne LOOP_SKIP_23D4_23D8_OK
				inx 
				bne LOOP_SKIP_23D4_23DB_OK
			//------------------------------
			LOOP_SKIP_23DD_23E1_OK:
			LOOP_SKIP_23DD_23E6_OK:
			//------------------------------
				stx $900D 
				dey 
				bne LOOP_SKIP_23DD_23E1_OK
				dex 
				cpx #$7E
				bne LOOP_SKIP_23DD_23E6_OK
				pla 
				tay 
				pla 
				tax 
				rts 
			//------------------------------
				.byte $00,$00,$00
			//------------------------------
SUBROUTINE_23F0_251E_OK:
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
				bne LOOP_SKIP_2409_2403_OK
				lda #$04
				sta $03 
			//------------------------------
			LOOP_SKIP_2409_2403_OK:
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
			JUMP_241A_2559_OK:
			//------------------------------
				lda $2302,X 
				cmp #$00
				beq LOOP_SKIP_243F_241F_OK
				cmp #$02
				beq LOOP_SKIP_243F_2423_OK
				cmp #$01
				bne LOOP_SKIP_2434_2427_OK
				inc $2300,X 
				bne LOOP_SKIP_2431_242C_OK
				inc $2301,X 
			//------------------------------
			LOOP_SKIP_2431_242C_OK:
			//------------------------------
				jmp JUMP_2468_2431_OK
			//------------------------------
			LOOP_SKIP_2434_2427_OK:
			//------------------------------
				ldy #$01
				jsr SUBROUTINE_2532_2436_OK
				nop 
				nop 
				nop 
				jmp JUMP_2468_243C_OK
			//------------------------------
			LOOP_SKIP_243F_241F_OK:
			LOOP_SKIP_243F_2423_OK:
			//------------------------------
				cmp #$02
				beq LOOP_SKIP_2457_2441_OK
				nop 
				nop 
				nop 
				jsr SUBROUTINE_2530_2446_OK
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
				jmp JUMP_2468_2454_OK
			//------------------------------
			LOOP_SKIP_2457_2441_OK:
			//------------------------------
				lda $2300,X 
				clc 
				adc #$19
				sta $2300,X 
				lda $2301,X 
				adc #$00
				sta $2301,X 
			//------------------------------
			JUMP_2468_2431_OK:
			JUMP_2468_243C_OK:
			JUMP_2468_2454_OK:
			//------------------------------
				lda $2300,X 
				sta $01 
				lda $2301,X 
				sta $02 
				lda ($01),Y 
				cmp #$50
				beq LOOP_SKIP_24D8_2476_OK
				cmp #$51
				beq LOOP_SKIP_24D8_247A_OK
				sta $04 
				txa 
				pha 
				ldy #$0C
				ldx #$00
			//------------------------------
			LOOP_SKIP_2484_2491_OK:
			//------------------------------
				lda $2348,X 
				cmp $04 
				beq LOOP_SKIP_2495_2489_OK
				inx 
				inx 
				inx 
				inx 
				inx 
				dey 
				bne LOOP_SKIP_2484_2491_OK
				beq LOOP_SKIP_2508_2493_OK
			//------------------------------
			LOOP_SKIP_2495_2489_OK:
			//------------------------------
				stx $06 
				pla 
				tax 
				lda #$03
				jsr SUBROUTINE_28DB_249B_OK
				nop 
				and #$01
				beq LOOP_SKIP_24A7_24A1_OK
				lda #$01
				sta $05 
			//------------------------------
			LOOP_SKIP_24A7_24A1_OK:
			//------------------------------
				ldy $05 
			//------------------------------
			LOOP_SKIP_24A9_24B9_OK:
			JUMP_24A9_24D3_OK:
			//------------------------------
				inc $2302,X 
				lda $2302,X 
				cmp #$04
				bne LOOP_SKIP_24B8_24B1_OK
				lda #$00
				sta $2302,X 
			//------------------------------
			LOOP_SKIP_24B8_24B1_OK:
			//------------------------------
				dey 
				bne LOOP_SKIP_24A9_24B9_OK
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
				bne LOOP_SKIP_24D6_24CD_OK
				pla 
				tax 
				ldy #$02
				jmp JUMP_24A9_24D3_OK
			//------------------------------
			LOOP_SKIP_24D6_24CD_OK:
			//------------------------------
				pla 
				tax 
			//------------------------------
			LOOP_SKIP_24D8_2476_OK:
			LOOP_SKIP_24D8_247A_OK:
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
SUBROUTINE_24FF_3384_BAD:
			//------------------------------
				lda ($01),Y 
				sta $2303,X 
				lda $20 
				sta ($01),Y 
				rts 
			//------------------------------
			LOOP_SKIP_2508_2493_OK:
			//------------------------------
				jmp JUMP_2BF8_2508_OK
				.byte $00,$00,$00,$00,$00
			//------------------------------
SUBROUTINE_2510_25E0_OK:
			//------------------------------
				ldy #$00
				lda $00 
				sta $FD 
			//------------------------------
			LOOP_SKIP_2516_2523_OK:
			//------------------------------
				lda $FD 
				asl  
				asl  
				clc 
				adc $FD 
				tax 
				jsr SUBROUTINE_23F0_251E_OK
				dec $FD 
				bne LOOP_SKIP_2516_2523_OK
				rts 
			//------------------------------
			JUMP_2526_28D1_OK:
			//------------------------------
				dec $08 
				beq LOOP_SKIP_252B_2528_OK
				rts 
			//------------------------------
			LOOP_SKIP_252B_2528_OK:
			//------------------------------
				jmp JUMP_28D4_252B_OK
				.byte $00,$00
			//------------------------------
SUBROUTINE_2530_2446_OK:
			//------------------------------
				ldy #$28 //#$19
			//------------------------------
SUBROUTINE_2532_2436_OK:
			LOOP_SKIP_2532_2540_OK:
			//------------------------------
				dec $2300,X 
				lda $2300,X 
				cmp #$FF
				bne LOOP_SKIP_253F_253A_OK
				dec $2301,X 
			//------------------------------
			LOOP_SKIP_253F_253A_OK:
			//------------------------------
				dey 
				bne LOOP_SKIP_2532_2540_OK
				rts 
			//------------------------------
			JUMP_2543_2C04_OK:
			//------------------------------
				pla 
				tax 
				ldy #$02
			//------------------------------
			LOOP_SKIP_2547_2557_OK:
			//------------------------------
				inc $2302,X 
				lda $2302,X 
				cmp #$04
				bne LOOP_SKIP_2556_254F_OK
				lda #$00
				sta $2302,X 
			//------------------------------
			LOOP_SKIP_2556_254F_OK:
			//------------------------------
				dey 
				bne LOOP_SKIP_2547_2557_OK
				jmp JUMP_241A_2559_OK
				.byte $00,$00,$00,$00
			//------------------------------
SUBROUTINE_2560_2253_OK:
SUBROUTINE_2560_3079_OK:
			//------------------------------
				sei 
				ldx #$7F
				stx $9122 
			//------------------------------
			LOOP_SKIP_2566_256C_OK:
			//------------------------------
				ldy $9120 
				cpy $9120 
				bne LOOP_SKIP_2566_256C_OK
				ldx #$FF
				stx $9122 
				ldx #$F7
				stx $9120 
				cli 
			//------------------------------
			LOOP_SKIP_2579_257F_OK:
			//------------------------------
				lda $911F 
				cmp $911F 
				bne LOOP_SKIP_2579_257F_OK
				pha 
				and #$1C
				lsr  
				cpy #$80
				bcc LOOP_SKIP_258B_2587_OK
				ora #$10
			//------------------------------
			LOOP_SKIP_258B_2587_OK:
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
			JUMP_25A0_2BA6_OK:
SUBROUTINE_25A0_2D5E_OK:
SUBROUTINE_25A0_2D61_OK:
			JUMP_25A0_2E20_OK:
SUBROUTINE_25A0_2E8F_OK:
			//------------------------------
				lda #$C7
				sta $01 
				lda #$96
				sta $02 
				ldy #$05
				lda #$02
			//------------------------------
			LOOP_SKIP_25AC_25AF_OK:
			//------------------------------
				sta ($01),Y 
				dey 
				bne LOOP_SKIP_25AC_25AF_OK
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
			JUMP_25E0_28D8_OK:
			//------------------------------
				jsr SUBROUTINE_2510_25E0_OK
				jmp JUMP_2620_25E3_OK
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
			JUMP_2620_25E3_OK:
			JUMP_2620_2BB4_OK:
			//------------------------------
				lda $2600 
				sta $01 
				lda $2601 
				sta $02 
				ldy #$00
				lda ($01),Y 
				ldx $2603 
				cmp $2609,X 
				beq LOOP_SKIP_2639_2634_OK
				jmp JUMP_2B91_2636_OK
			//------------------------------
			LOOP_SKIP_2639_2634_OK:
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
				bne LOOP_SKIP_265C_2653_OK
				lda #$03
				sta $0B 
				jmp JUMP_26A7_2659_OK
			//------------------------------
			LOOP_SKIP_265C_2653_OK:
			//------------------------------
				cmp #$51
				bne LOOP_SKIP_2667_265E_OK
				lda #$0C
				sta $0B 
				jmp JUMP_26A7_2664_OK
			//------------------------------
			LOOP_SKIP_2667_265E_OK:
			//------------------------------
				ldx #$00
				ldy #$0C
				lda $2602 
			//------------------------------
			LOOP_SKIP_266E_2679_OK:
			//------------------------------
				cmp $2348,X 
				beq LOOP_SKIP_267B_2671_OK
				inx 
				inx 
				inx 
				inx 
				inx 
				dey 
				bne LOOP_SKIP_266E_2679_OK
			//------------------------------
			LOOP_SKIP_267B_2671_OK:
			//------------------------------
				lda $2349,X 
				beq LOOP_SKIP_2686_267E_OK
				lda #$01
				ora $0B
				sta $0B 
			//------------------------------
			LOOP_SKIP_2686_267E_OK:
			//------------------------------
				lda $234A,X 
				beq LOOP_SKIP_2691_2689_OK
				lda #$08
				ora $0B
				sta $0B 
			//------------------------------
			LOOP_SKIP_2691_2689_OK:
			//------------------------------
				lda $234B,X 
				beq LOOP_SKIP_269C_2694_OK
				lda #$02
				ora $0B
				sta $0B 
			//------------------------------
			LOOP_SKIP_269C_2694_OK:
			//------------------------------
				lda $234C,X 
				beq LOOP_SKIP_26A7_269F_OK
				lda #$04
				ora $0B
				sta $0B 
			//------------------------------
			JUMP_26A7_2659_OK:
			JUMP_26A7_2664_OK:
			LOOP_SKIP_26A7_269F_OK:
			//------------------------------
				nop 
				nop 
				nop 
				nop 
				nop 
				nop 
				lda $0A 
				and #$0F
				beq LOOP_SKIP_272D_26B1_OK
				lda $0A 
				and $0B
				sta $0B 
				lda $0B 
				beq LOOP_SKIP_272D_26BB_OK
				and #$01
				beq LOOP_SKIP_26DB_26BF_OK
				ldy #$19
			//------------------------------
			LOOP_SKIP_26C3_26D1_OK:
			//------------------------------
				dec $2600 
				lda $2600 
				cmp #$FF
				bne LOOP_SKIP_26D0_26CB_OK
				dec $2601 
			//------------------------------
			LOOP_SKIP_26D0_26CB_OK:
			//------------------------------
				dey 
				bne LOOP_SKIP_26C3_26D1_OK
				lda #$00
				sta $2603 
				jmp JUMP_272D_26D8_OK
			//------------------------------
			LOOP_SKIP_26DB_26BF_OK:
			//------------------------------
				lda $0B 
				and #$08
				beq LOOP_SKIP_26F1_26DF_OK
				inc $2600 
				bne LOOP_SKIP_26E9_26E4_OK
				inc $2601 
			//------------------------------
			LOOP_SKIP_26E9_26E4_OK:
			//------------------------------
				lda #$01
				sta $2603 
				jmp JUMP_272D_26EE_OK
			//------------------------------
			LOOP_SKIP_26F1_26DF_OK:
			//------------------------------
				lda $0B 
				and #$02
				beq LOOP_SKIP_2710_26F5_OK
				lda $2600 
				clc 
				adc #$19
				sta $2600 
				lda $2601 
				adc #$00
				sta $2601 
				lda #$02
				sta $2603 
				jmp JUMP_272D_270D_OK
			//------------------------------
			LOOP_SKIP_2710_26F5_OK:
			//------------------------------
				lda $0B 
				and #$04
				beq LOOP_SKIP_272D_2714_OK
				dec $2600 
				lda $2600 
				cmp #$FF
				bne LOOP_SKIP_2723_271E_OK
				dec $2601 
			//------------------------------
			LOOP_SKIP_2723_271E_OK:
			//------------------------------
				lda #$03
				sta $2603 
				nop 
				nop 
				nop 
				nop 
				nop 
			//------------------------------
			LOOP_SKIP_272D_26B1_OK:
			LOOP_SKIP_272D_26BB_OK:
			JUMP_272D_26D8_OK:
			JUMP_272D_26EE_OK:
			JUMP_272D_270D_OK:
			LOOP_SKIP_272D_2714_OK:
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
			LOOP_SKIP_273E_2747_OK:
			//------------------------------
				cmp $2337,X 
				bne LOOP_SKIP_2746_2741_OK
				jmp JUMP_2B91_2743_OK
			//------------------------------
			LOOP_SKIP_2746_2741_OK:
			//------------------------------
				dex 
				bne LOOP_SKIP_273E_2747_OK
				sta $2602 
				lda $02 
				clc 
				adc #$84
				sta $02 
				lda ($01),Y 
				and #$07
				cmp #$02
				bne LOOP_SKIP_2773_2759_OK
				lda #$02
				sta $2608 
				lda $2604 
				beq LOOP_SKIP_276B_2763_OK
				nop 
				nop 
				nop 
				nop 
				nop 
				nop 
			//------------------------------
			LOOP_SKIP_276B_2763_OK:
			//------------------------------
				nop 
				nop 
				jsr SUBROUTINE_27F8_276D_OK
				jmp JUMP_2787_2770_OK
			//------------------------------
			LOOP_SKIP_2773_2759_OK:
			//------------------------------
				lda $2608 
				cmp #$07
				beq LOOP_SKIP_2787_2778_OK
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
				jsr SUBROUTINE_27C0_2784_OK
			//------------------------------
			JUMP_2787_2770_OK:
			LOOP_SKIP_2787_2778_OK:
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
SUBROUTINE_27C0_2784_OK:
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
				bne LOOP_SKIP_27DD_27DA_OK
				rts 
			//------------------------------
			LOOP_SKIP_27DD_27DA_OK:
			//------------------------------
				lda $279C,X 
				cmp $279E,X 
				bne LOOP_SKIP_27E9_27E3_OK
				dec $2604 
				rts 
			//------------------------------
			LOOP_SKIP_27E9_27E3_OK:
			//------------------------------
				lda $2604 
				cmp #$0C
				beq LOOP_SKIP_27F1_27EE_OK
				rts 
			//------------------------------
			LOOP_SKIP_27F1_27EE_OK:
			//------------------------------
				jmp JUMP_2880_27F1_OK
				.byte $00,$00,$00,$00
			//------------------------------
SUBROUTINE_27F8_276D_OK:
			//------------------------------
				lda $2604 
				asl  
				tax 
				lda $279E,X 
				cmp $2600 
				bne LOOP_SKIP_2806_2803_OK
				rts 
			//------------------------------
			LOOP_SKIP_2806_2803_OK:
			//------------------------------
				lda $2604 
				cmp #$03
				beq LOOP_SKIP_2818_280B_OK
				cmp #$07
				beq LOOP_SKIP_2818_280F_OK
				cmp #$0B
				beq LOOP_SKIP_2818_2813_OK
				jmp JUMP_2880_2815_OK
			//------------------------------
			LOOP_SKIP_2818_280B_OK:
			LOOP_SKIP_2818_280F_OK:
			LOOP_SKIP_2818_2813_OK:
			//------------------------------
				lda $2602 
				jmp JUMP_2821_281B_OK
			//------------------------------
			LOOP_SKIP_281E_2826_OK:
			//------------------------------
				jmp JUMP_2A44_281E_OK
			//------------------------------
			JUMP_2821_281B_OK:
			//------------------------------
				ldx #$05
			//------------------------------
			LOOP_SKIP_2823_2829_OK:
			//------------------------------
				cmp $27B7,X 
				beq LOOP_SKIP_281E_2826_OK
				dex 
				bne LOOP_SKIP_2823_2829_OK
				jmp JUMP_2880_282B_OK
			//------------------------------
			JUMP_282E_28C5_OK:
			JUMP_282E_2E3C_OK:
			//------------------------------
				lda #$00
				sta $2604 
			//------------------------------
			JUMP_2833_2873_OK:
			JUMP_2833_287B_OK:
			//------------------------------
				lda $2600 
				sta $01 
				lda $2601 
				clc 
				adc #$84
				sta $02 
				rts 
			//------------------------------
			LOOP_SKIP_2841_2885_OK:
SUBROUTINE_2841_2BA0_OK:
SUBROUTINE_2841_2D3A_OK:
			//------------------------------
				lda #$07
				sta $2608 
				lda $2604 
				cmp #$00
				bne LOOP_SKIP_2850_284B_OK
				jmp JUMP_2876_284D_OK
			//------------------------------
			LOOP_SKIP_2850_284B_OK:
			//------------------------------
				asl  
				tax 
			//------------------------------
			LOOP_SKIP_2852_2867_OK:
			//------------------------------
				lda $279E,X 
				sta $01 
				lda $279F,X 
				sta $02 
				ldy #$00
				lda #$07
				sta ($01),Y 
				jsr SUBROUTINE_289A_2862_OK
				dex 
				dex 
				bne LOOP_SKIP_2852_2867_OK
				lda #$00
				sta $2604 
				lda #$C3
				sta $900D 
				jmp JUMP_2833_2873_OK
			//------------------------------
			JUMP_2876_284D_OK:
			//------------------------------
				lda #$02
				sta $2608 
				jmp JUMP_2833_287B_OK
				.byte $02,$02
			//------------------------------
			JUMP_2880_27F1_OK:
			JUMP_2880_2815_OK:
			JUMP_2880_282B_OK:
			//------------------------------
				lda $2604 
				cmp #$01
				bne LOOP_SKIP_2841_2885_OK
				lda $27A0 
				sta $01 
				lda $27A1 
				sta $02 
				ldy #$00
				lda #$07
				sta ($01),Y 
				jmp JUMP_28C2_2897_OK
			//------------------------------
SUBROUTINE_289A_2862_OK:
SUBROUTINE_289A_28C2_OK:
			//------------------------------
				txa 
				pha 
				tya 
				pha 
				ldy #$0A
				ldx #$00
			//------------------------------
			LOOP_SKIP_28A2_28BB_OK:
			//------------------------------
				lda $2300,X 
				cmp $01 
				bne LOOP_SKIP_28B5_28A7_OK
				jsr SUBROUTINE_29C6_28A9_OK
				nop 
				nop 
				bne LOOP_SKIP_28B5_28AE_OK
				lda #$07
			//------------------------------
			JUMP_28B2_1B50_OK:
			//------------------------------
				sta $2303,X 
			//------------------------------
			LOOP_SKIP_28B5_28A7_OK:
			LOOP_SKIP_28B5_28AE_OK:
			//------------------------------
				inx 
				inx 
				inx 
				inx 
				inx 
				dey 
				bne LOOP_SKIP_28A2_28BB_OK
				pla 
				tay 
				pla 
				tax 
				rts 
			//------------------------------
			JUMP_28C2_2897_OK:
			//------------------------------
				jsr SUBROUTINE_289A_28C2_OK
				jmp JUMP_282E_28C5_OK
			//------------------------------
SUBROUTINE_28C8_2250_OK:
			//------------------------------
				dec $0F 
				beq LOOP_SKIP_28CD_28CA_OK
				rts 
			//------------------------------
			LOOP_SKIP_28CD_28CA_OK:
			//------------------------------
				lda $0E 
				sta $0F 
				jmp JUMP_2526_28D1_OK
			//------------------------------
			JUMP_28D4_252B_OK:
			//------------------------------
				lda $0D 
				sta $08 
				jmp JUMP_25E0_28D8_OK
			//------------------------------
SUBROUTINE_28DB_249B_OK:
			//------------------------------
				sta $05 
				lda $9004 
				rts 
			//------------------------------
SUBROUTINE_28E1_2256_OK:
			//------------------------------
				dec $14 
				beq LOOP_SKIP_28E6_28E3_OK
				rts 
			//------------------------------
			LOOP_SKIP_28E6_28E3_OK:
			//------------------------------
				lda $13 
				sta $14 
				dec $10 
				beq LOOP_SKIP_28EF_28EC_OK
				rts 
			//------------------------------
			LOOP_SKIP_28EF_28EC_OK:
			//------------------------------
				lda #$28
				sta $10 
				dec $900E 
				lda $900E 
				beq LOOP_SKIP_28FC_28F9_OK
				rts 
			//------------------------------
			LOOP_SKIP_28FC_28F9_OK:
			//------------------------------
				ldy #$02
			//------------------------------
			LOOP_SKIP_28FE_2905_OK:
			//------------------------------
				inc $15 
				bne LOOP_SKIP_2904_2900_OK
				inc $16 
			//------------------------------
			LOOP_SKIP_2904_2900_OK:
			//------------------------------
				dey 
				bne LOOP_SKIP_28FE_2905_OK
				ldy #$00
				lda ($15),Y 
				cmp #$FF
				beq LOOP_SKIP_2920_290D_OK
				sta $900C 
				iny 
				lda ($15),Y 
				sta $13 
				sta $14 
				lda #$0F
				sta $900E 
				rts 
			//------------------------------
				nop 
			//------------------------------
SUBROUTINE_2920_2225_OK:
			LOOP_SKIP_2920_290D_OK:
			//------------------------------
				jmp JUMP_29D0_2920_OK

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
SUBROUTINE_29C6_28A9_OK:
			//------------------------------
				lda $2301,X 
				clc 
				adc #$84
				cmp $02 
				rts 
			//------------------------------
				.byte $FF
			//------------------------------
			JUMP_29D0_2920_OK:
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
				sta $900E 
				rts 
			//------------------------------
			LOOP_SKIP_29E8_2A12_OK:
			JUMP_29E8_2B28_OK:
			//------------------------------
				ldx #$01
			//------------------------------
			LOOP_SKIP_29EA_2A0B_OK:
			//------------------------------
				lda $900D 
				cmp #$C3
				bne LOOP_SKIP_29F9_29EF_OK
				lda #$E1
				sta $900D 
				jmp JUMP_2A0A_29F6_OK
			//------------------------------
			LOOP_SKIP_29F9_29EF_OK:
			//------------------------------
				cmp #$E1
				bne LOOP_SKIP_2A05_29FB_OK
				lda #$F0
				sta $900D 
				jmp JUMP_2A0A_2A02_OK
			//------------------------------
			LOOP_SKIP_2A05_29FB_OK:
			//------------------------------
				lda #$00
				sta $900D 
			//------------------------------
			JUMP_2A0A_29F6_OK:
			JUMP_2A0A_2A02_OK:
			//------------------------------
				dex 
				bne LOOP_SKIP_29EA_2A0B_OK
				rts 
			//------------------------------
SUBROUTINE_2A0E_2259_OK:
			//------------------------------
				lda $08 
				cmp #$01
				beq LOOP_SKIP_29E8_2A12_OK
				rts 
			//------------------------------
			LOOP_SKIP_2A17_2A38_BAD:
			LOOP_SKIP_2A15_2A41_OK:
			//------------------------------
				lda $900B 
				cmp #$00
				bne LOOP_SKIP_2A1D_2A1A_OK
				rts 
			//------------------------------
			LOOP_SKIP_2A1D_2A1A_OK:
			//------------------------------
				inc $900B 
				inc $900A 
				inc $900D 
				rts 
			//------------------------------
				.byte $0F
				sta $900E 
				rts 
			//------------------------------
				sta $9009,X 
				jmp JUMP_2A37_2A2F_OK
				lda #$00
				sta $9009,X 
			//------------------------------
			JUMP_2A37_2A2F_OK:
			//------------------------------
				dex 
				bne LOOP_SKIP_2A17_2A38_BAD
				rts 
			//------------------------------
SUBROUTINE_2A3B_225C_OK:
			//------------------------------
				lda $08 
				nop 
				nop 
				cmp #$01
				beq LOOP_SKIP_2A15_2A41_OK
				rts 
			//------------------------------
			JUMP_2A44_281E_OK:
			//------------------------------
				lda #$F2
				sta $900A 
				sta $900B 
				ldy #$03
				ldx $19 
				jsr SUBROUTINE_2A60_2A50_OK
				inc $17 
				lda $17 
				cmp #$24
				beq LOOP_SKIP_2A7E_2A59_OK
				nop 
				nop 
				jmp JUMP_2A83_2A5D_OK
			//------------------------------
SUBROUTINE_2A60_2A50_OK:
			LOOP_SKIP_2A60_2A79_OK:
SUBROUTINE_2A60_2B49_OK:
			//------------------------------
				tya 
				pha 
			//------------------------------
			LOOP_SKIP_2A62_2A74_OK:
			//------------------------------
				lda ($1A),Y 
				clc 
				adc #$01
				sta ($1A),Y 
				cmp #$3A
				bne LOOP_SKIP_2A76_2A6B_OK
				lda #$30
				sta ($1A),Y 
				dey 
				cpy #$FF
				bne LOOP_SKIP_2A62_2A74_OK
			//------------------------------
			LOOP_SKIP_2A76_2A6B_OK:
			//------------------------------
				pla 
				tay 
				dex 
				bne LOOP_SKIP_2A60_2A79_OK
				ldy #$00
				rts 
			//------------------------------
			LOOP_SKIP_2A7E_2A59_OK:
			//------------------------------
				jmp JUMP_2EEE_2A7E_OK
				pla 
				rts 
			//------------------------------
			JUMP_2A83_2A5D_OK:
			//------------------------------
				jsr SUBROUTINE_2FDA_2A83_OK
				and #$07
				cmp #$07
				beq LOOP_SKIP_2AB3_2A8A_OK
				lda $947C 
				and #$07
				cmp #$07
				beq LOOP_SKIP_2AB3_2A93_OK
				lda $96BC 
				and #$07
				cmp #$07
				beq LOOP_SKIP_2AB3_2A9C_OK
				lda $96D4 
				and #$07
				cmp #$07
				beq LOOP_SKIP_2AB3_2AA5_OK
				lda $18 
				bne LOOP_SKIP_2AB3_2AA9_OK
				lda #$20
				sta $18 
				lda #$01
				sta $20 
			//------------------------------
			LOOP_SKIP_2AB3_2A8A_OK:
			LOOP_SKIP_2AB3_2A93_OK:
			LOOP_SKIP_2AB3_2A9C_OK:
			LOOP_SKIP_2AB3_2AA5_OK:
			LOOP_SKIP_2AB3_2AA9_OK:
			//------------------------------
				jmp JUMP_2E38_2AB3_OK
			//------------------------------
			JUMP_2AB6_2B19_OK:
			//------------------------------
				lda $18 
				bne LOOP_SKIP_2ABB_2AB8_OK
				rts 
			//------------------------------
			LOOP_SKIP_2ABB_2AB8_OK:
			//------------------------------
				cmp #$FF
				bne LOOP_SKIP_2AC4_2ABD_OK
				lda #$03
				sta $20 
				rts 
			//------------------------------
			LOOP_SKIP_2AC4_2ABD_OK:
			//------------------------------
				cmp #$20
				bne LOOP_SKIP_2AD6_2AC6_OK
				lda $21 
				sta $18 
				lda #$90
				sta $900C 
				lda #$01
				sta $13 
				rts 
			//------------------------------
			LOOP_SKIP_2AD6_2AC6_OK:
			//------------------------------
				jsr SUBROUTINE_2B2B_2AD6_OK
				lda $900C 
				cmp #$C0
				beq LOOP_SKIP_2AE1_2ADE_OK
				rts 
			//------------------------------
			LOOP_SKIP_2AE1_2ADE_OK:
			//------------------------------
				lda #$90
				sta $900C 
				dec $18 
				lda #$01
				sta $20 
				lda #$01
				sta $20 
				lda $18 
				cmp #$08
				bne LOOP_SKIP_2AFB_2AF4_OK
			//------------------------------
			LOOP_SKIP_2AF6_2AFD_OK:
			LOOP_SKIP_2AF6_2B01_OK:
			LOOP_SKIP_2AF6_2B05_OK:
			//------------------------------
				lda #$06
				sta $20 
				rts 
			//------------------------------
			LOOP_SKIP_2AFB_2AF4_OK:
			//------------------------------
				cmp #$06
				beq LOOP_SKIP_2AF6_2AFD_OK
				cmp #$04
				beq LOOP_SKIP_2AF6_2B01_OK
				cmp #$02
				beq LOOP_SKIP_2AF6_2B05_OK
				cmp #$01
				beq LOOP_SKIP_2B0C_2B09_OK
				rts 
			//------------------------------
			LOOP_SKIP_2B0C_2B09_OK:
			//------------------------------
				lda #$FF
				sta $18 
				rts 
			//------------------------------
SUBROUTINE_2B11_225F_OK:
			//------------------------------
				lda.abs $0010 
				cmp #$10
				beq LOOP_SKIP_2B19_2B16_OK
				rts 
			//------------------------------
			LOOP_SKIP_2B19_2B16_OK:
			//------------------------------
				jmp JUMP_2AB6_2B19_OK
				lda $08 
				cmp #$01
				beq LOOP_SKIP_2B23_2B20_OK
				rts 
			//------------------------------
			LOOP_SKIP_2B23_2B20_OK:
			//------------------------------
				lda $18 
				beq LOOP_SKIP_2B28_2B25_OK
				rts 
			//------------------------------
			LOOP_SKIP_2B28_2B25_OK:
			//------------------------------
				jmp JUMP_29E8_2B28_OK
			//------------------------------
SUBROUTINE_2B2B_2AD6_OK:
			//------------------------------
				inc $900C 
				lda #$0F
				sta $900E 
				lda #$20
				sta $10 
				rts 
			//------------------------------
			LOOP_SKIP_2B38_2B95_OK:
			//------------------------------
				lda $18 
				beq LOOP_SKIP_2B52_2B3A_OK
				jsr SUBROUTINE_2FD2_2B3C_OK
				nop 
				beq LOOP_SKIP_2B45_2B40_OK
				asl  
				sta $22 
			//------------------------------
			LOOP_SKIP_2B45_2B40_OK:
			//------------------------------
				ldx $22 
				ldy #$02
				jsr SUBROUTINE_2A60_2B49_OK
				lda #$C3
				jmp JUMP_2BB7_2B4E_OK
				rts 
			//------------------------------
			LOOP_SKIP_2B52_2B3A_OK:
			JUMP_2B52_2B97_OK:
			//------------------------------
				lda #$00
				jsr SUBROUTINE_2EDB_2B54_OK
				lda #$80
				sta $900D 
				lda #$0F
				sta $900E 
				sta $900E 
			//------------------------------
			LOOP_SKIP_2B64_2B6D_OK:
			//------------------------------
				ldy #$50
			//------------------------------
			LOOP_SKIP_2B66_2B67_OK:
			LOOP_SKIP_2B66_2B8C_OK:
			//------------------------------
				dey 
				bne LOOP_SKIP_2B66_2B67_OK
				nop 
				nop 
				dec $1F 
				bne LOOP_SKIP_2B64_2B6D_OK
				nop 
				lda $2600 
				sta $01 
				lda $2601 
				sta $02 
				lda $900E 
				and #$03
				tax 
			//------------------------------
			LOOP_SKIP_2B80_2B87_OK:
			//------------------------------
				lda $2609,X 
				sta ($01),Y 
				dec $1F 
				bne LOOP_SKIP_2B80_2B87_OK
				dec $900E 
				bne LOOP_SKIP_2B66_2B8C_OK
				jmp JUMP_2D3A_2B8E_OK
			//------------------------------
			JUMP_2B91_2636_OK:
			JUMP_2B91_2743_OK:
			JUMP_2B91_2C19_OK:
			//------------------------------
				lda $18 
				cmp #$FF
				bne LOOP_SKIP_2B38_2B95_OK
				jmp JUMP_2B52_2B97_OK
				.byte $FF,$FF,$FF,$FF,$FF,$FF
			//------------------------------
			JUMP_2BA0_2BF5_OK:
			//------------------------------
				jsr SUBROUTINE_2841_2BA0_OK
				jsr Draw_Play_Grid
				jmp JUMP_25A0_2BA6_OK
				.byte $02
				ldx $2603 
				lda $2609,X 
				ldy #$00
				sta ($01),Y 
				jmp JUMP_2620_2BB4_OK
			//------------------------------
			JUMP_2BB7_2B4E_OK:
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
			LOOP_SKIP_2BD7_2BEE_OK:
			//------------------------------
				ldx #$08
				ldy #$00
			//------------------------------
			LOOP_SKIP_2BDB_2BDC_OK:
			LOOP_SKIP_2BDB_2BDF_OK:
			//------------------------------
				dey 
				bne LOOP_SKIP_2BDB_2BDC_OK
				dex 
				bne LOOP_SKIP_2BDB_2BDF_OK
				lda $1F 
				and #$07
				sta ($01),Y 
				lda $1F 
				sta $900C 
				inc $1F 
				bne LOOP_SKIP_2BD7_2BEE_OK
				lda #$90
				sta $900C 
				jmp JUMP_2BA0_2BF5_OK
			//------------------------------
			JUMP_2BF8_2508_OK:
			//------------------------------
				lda $04 
				ldx #$04
			//------------------------------
			LOOP_SKIP_2BFC_2C02_OK:
			//------------------------------
				cmp $2608,X 
				beq LOOP_SKIP_2C07_2BFF_OK
				dex 
				bne LOOP_SKIP_2BFC_2C02_OK
				jmp JUMP_2543_2C04_OK
			//------------------------------
			LOOP_SKIP_2C07_2BFF_OK:
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
				jmp JUMP_2B91_2C19_OK
			//------------------------------
SUBROUTINE_2C1C_2212_OK:
			//------------------------------
				ldx #$00
			//------------------------------
			LOOP_SKIP_2C1E_2C3A_OK:
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
				bne LOOP_SKIP_2C1E_2C3A_OK
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
SUBROUTINE_2C54_2D64_OK:
			//------------------------------
				lda $29 
				cmp #$02
				bne LOOP_SKIP_2C5C_2C58_OK
				ldx #$10
			//------------------------------
			LOOP_SKIP_2C5C_2C58_OK:
			//------------------------------
				lda $3C00,X 
				bne LOOP_SKIP_2C7B_2C5F_OK
				cpx #$10
				bne LOOP_SKIP_2C6A_2C63_OK
				ldx #$10
				jmp JUMP_2C6C_2C67_OK
			//------------------------------
			LOOP_SKIP_2C6A_2C63_OK:
			//------------------------------
				ldx #$00
			//------------------------------
			JUMP_2C6C_2C67_OK:
			//------------------------------
				lda $3C00,X 
				beq LOOP_SKIP_2C72_2C6F_OK
				rts 
			//------------------------------
			LOOP_SKIP_2C72_2C6F_OK:
			JUMP_2C72_2E35_OK:
			//------------------------------
				jmp JUMP_2EFB_2C72_OK
				pla 
				nop 
				nop 
				nop 
				nop 
				rts 
			//------------------------------
			LOOP_SKIP_2C7B_2C5F_OK:
			//------------------------------
				lda #$10
				sta $24 
				ldy #$00
				lda $29 
				cmp #$02
				bne LOOP_SKIP_2C89_2C85_OK
				ldy #$15
			//------------------------------
			LOOP_SKIP_2C89_2C85_OK:
			//------------------------------
				sty $23 
				lda $29 
				cmp #$01
				bne LOOP_SKIP_2C98_2C8F_OK
				lda #$35
				sta $2B 
				jmp JUMP_2C9C_2C95_OK
			//------------------------------
			LOOP_SKIP_2C98_2C8F_OK:
			//------------------------------
				lda #$39
				sta $2B 
			//------------------------------
			JUMP_2C9C_2C95_OK:
			//------------------------------
				lda #$00
				sta $2A 
				sta $27 
				lda #$94
				sta $28 
				ldx #$03
			//------------------------------
			LOOP_SKIP_2CA8_2CB6_OK:
			//------------------------------
				ldy #$00
			//------------------------------
			LOOP_SKIP_2CAA_2CAF_OK:
			//------------------------------
				lda ($2A),Y 
				sta ($27),Y 
				iny 
				bne LOOP_SKIP_2CAA_2CAF_OK
				inc $28 
				inc $2B 
				dex 
				bne LOOP_SKIP_2CA8_2CB6_OK
				ldy #$05
				lda #$35
				sta $1A 
				lda $29 
				cmp #$02
				bne LOOP_SKIP_2CCA_2CC2_OK
				ldy #$04
				lda #$46
				sta $1A 
			//------------------------------
			LOOP_SKIP_2CCA_2CC2_OK:
			//------------------------------
				sty $09 
				rts 
			//------------------------------
				nop 
				nop 
				nop 
			//------------------------------
			JUMP_2CD0_2D89_OK:
			//------------------------------
				ldx #$05
				lda $00 
				sta $1F 
				ldy #$00
			//------------------------------
			LOOP_SKIP_2CD8_2CF1_OK:
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
				bne LOOP_SKIP_2CD8_2CF1_OK
				lda $29 
				cmp #$01
				bne LOOP_SKIP_2D00_2CF7_OK
				lda #$35
				sta $2B 
				jmp JUMP_2D04_2CFD_OK
			//------------------------------
			LOOP_SKIP_2D00_2CF7_OK:
			//------------------------------
				lda #$39
				sta $2B 
			//------------------------------
			JUMP_2D04_2CFD_OK:
			//------------------------------
				lda #$00
				sta $2A 
				sta $27 
				lda #$94
				sta $28 
				ldx #$03
			//------------------------------
			LOOP_SKIP_2D10_2D1E_OK:
			//------------------------------
				ldy #$00
			//------------------------------
			LOOP_SKIP_2D12_2D17_OK:
			//------------------------------
				lda ($27),Y 
				sta ($2A),Y 
				iny 
				bne LOOP_SKIP_2D12_2D17_OK
				inc $2B 
				inc $28 
				dex 
				bne LOOP_SKIP_2D10_2D1E_OK
				lda $29 
				cmp #$02
				bne LOOP_SKIP_2D28_2D24_OK
				ldx #$10
			//------------------------------
			LOOP_SKIP_2D28_2D24_OK:
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
			JUMP_2D3A_2B8E_OK:
			//------------------------------
				jsr SUBROUTINE_2841_2D3A_OK
				jsr SUBROUTINE_2D70_2D3D_OK
				lda $26 
				cmp #$01
				bne LOOP_SKIP_2D4F_2D44_OK
			//------------------------------
			LOOP_SKIP_2D46_2D55_OK:
			JUMP_2D46_2D5B_OK:
			//------------------------------
				jsr Draw_Play_Grid
				jmp JUMP_2D5E_2D49_OK
				nop 
				nop 
				nop 
			//------------------------------
			LOOP_SKIP_2D4F_2D44_OK:
			LOOP_SKIP_2D50_2DB4_BAD:
			//------------------------------
				inc $29 
				lda $29 
				cmp #$03
				bne LOOP_SKIP_2D46_2D55_OK
				lda #$01
			//------------------------------
			LOOP_SKIP_2D59_2DB9_OK:
			//------------------------------
				sta $29 
				jmp JUMP_2D46_2D5B_OK
			//------------------------------
			JUMP_2D5E_2D49_OK:
			//------------------------------
				jsr SUBROUTINE_25A0_2D5E_OK
			//------------------------------
			LOOP_SKIP_2D62_2DBE_BAD:
			//------------------------------
				jsr SUBROUTINE_25A0_2D61_OK
				jsr SUBROUTINE_2C54_2D64_OK
				lda #$02
			//------------------------------
			LOOP_SKIP_2D6B_2DC3_BAD:
			//------------------------------
				sta $900E 
				jmp JUMP_2D8D_2D6C_OK
				nop 
			//------------------------------
SUBROUTINE_2D70_2D3D_OK:
			JUMP_2D70_2ED1_OK:
			//------------------------------
				ldx #$00
				lda $29 
			//------------------------------
			LOOP_SKIP_2D74_2DC8_OK:
			//------------------------------
				cmp #$02
				bne LOOP_SKIP_2D7A_2D76_OK
				ldx #$10
			//------------------------------
			LOOP_SKIP_2D7A_2D76_OK:
			//------------------------------
				lda $17 
			//------------------------------
			LOOP_SKIP_2D7D_2DCD_BAD:
			//------------------------------
				sta $3C03,X 
			//------------------------------
			LOOP_SKIP_2D80_2DDC_BAD:
			//------------------------------
				lda $19 
			//------------------------------
			LOOP_SKIP_2D83_2DD2_BAD:
			//------------------------------
				sta $3C02,X 
				lda $18 
				sta $3C04,X 
				jmp JUMP_2CD0_2D89_OK
				nop 
			//------------------------------
			JUMP_2D8D_2D6C_OK:
			//------------------------------
				ldx #$00
				lda $29 
				cmp #$02
				bne LOOP_SKIP_2D97_2D93_OK
				ldx #$10
			//------------------------------
			LOOP_SKIP_2D97_2D93_OK:
			//------------------------------
				lda $3C02,X 
				sta $19 
				lda $3C03,X 
			//------------------------------
			LOOP_SKIP_2DA0_2DD7_BAD:
			//------------------------------
				sta $17 
				lda $3C04,X 
				sta $18 
				jsr SUBROUTINE_2DDD_2DA6_OK
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

SUBROUTINE_2DDD_2215_OK:
SUBROUTINE_2DDD_2DA6_OK:
SUBROUTINE_2DDD_2E92_OK:
				ldx #$2D
			LOOP_SKIP_2DDF_2DE6_OK:
				lda $2DAF,X
				sta $2304,X
				dex
				bne LOOP_SKIP_2DDF_2DE6_OK
				ldx #$05
				ldy #$00
				lda #$09
				sta $1F 
			//------------------------------
			LOOP_SKIP_2DF0_2E09_OK:
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
				bne LOOP_SKIP_2DF0_2E09_OK
				jmp JUMP_2ED4_2E0B_OK
			//------------------------------
SUBROUTINE_2E0E_220F_OK:
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
				jmp JUMP_25A0_2E20_OK
				cpx #$10
				bne LOOP_SKIP_2E28_2E25_OK
			//------------------------------
			LOOP_SKIP_2E27_2E2C_OK:
			LOOP_SKIP_2E27_2E33_OK:
			//------------------------------
				rts 
			//------------------------------
			LOOP_SKIP_2E28_2E25_OK:
			//------------------------------
				lda $26 
				cmp #$01
				bne LOOP_SKIP_2E27_2E2C_OK
				lda $2C00 
				cmp #$00
				bne LOOP_SKIP_2E27_2E33_OK
				jmp JUMP_2C72_2E35_OK
			//------------------------------
			JUMP_2E38_2AB3_OK:
			//------------------------------
				lda #$01
				sta $22 
				jmp JUMP_282E_2E3C_OK
				.byte $00
			//------------------------------
			JUMP_2E40_2EF1_OK:
			//------------------------------
				ldx #$10
			//------------------------------
			LOOP_SKIP_2E42_2E5E_OK:
			//------------------------------
				lda #$E0
				sta $1F 
			//------------------------------
			LOOP_SKIP_2E46_2E5B_OK:
			//------------------------------
				ldy #$00
			//------------------------------
			LOOP_SKIP_2E48_2E52_OK:
			//------------------------------
				sta $9464,Y 
				sta $9500,Y 
				sta $9600,Y 
				iny 
				bne LOOP_SKIP_2E48_2E52_OK
				lda $1F 
				sta $900C 
				inc $1F 
				bne LOOP_SKIP_2E46_2E5B_OK
				dex 
				bne LOOP_SKIP_2E42_2E5E_OK
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
				bne LOOP_SKIP_2E7A_2E74_OK
				lda #$09
				sta $19 
			//------------------------------
			LOOP_SKIP_2E7A_2E74_OK:
			//------------------------------
				lda $19 
				sta $00 
				lda #$00
				sta $900C 
				sta $900B 
				sta $900A 
				jsr Clear_The_Screen
				jsr Draw_Play_Grid
				jsr SUBROUTINE_25A0_2E8F_OK
				jsr SUBROUTINE_2DDD_2E92_OK
				jmp JUMP_2EF4_2E95_OK
				jmp JUMP_2250_2E98_OK
			//------------------------------
SUBROUTINE_2E9B_2262_OK:
			//------------------------------
				lda $08 
				cmp #$01
				beq LOOP_SKIP_2EA2_2E9F_OK
				rts 
			//------------------------------
			LOOP_SKIP_2EA2_2E9F_OK:
			//------------------------------
				dec $2A 
				beq LOOP_SKIP_2EA7_2EA4_OK
				rts 
			//------------------------------
			LOOP_SKIP_2EA7_2EA4_OK:
			//------------------------------
				lda #$05
				sta $2A 
				ldx #$00
				lda $29 
				cmp #$02
				bne LOOP_SKIP_2EB5_2EB1_OK
				ldx #$10
			//------------------------------
			LOOP_SKIP_2EB5_2EB1_OK:
			//------------------------------
				ldy $3C00,X 
				dey 
				lda ($23),Y 
				cmp #$20
				beq LOOP_SKIP_2EC4_2EBD_OK
				lda #$20
				sta ($23),Y 
				rts 
			//------------------------------
			LOOP_SKIP_2EC4_2EBD_OK:
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
				jmp JUMP_2D70_2ED1_OK
			//------------------------------
			JUMP_2ED4_2E0B_OK:
			//------------------------------
				lda $19 
				sta $00 
				jmp JUMP_2F40_2ED8_OK
			//------------------------------
SUBROUTINE_2EDB_2B54_OK:
SUBROUTINE_2EDB_2EEE_OK:
SUBROUTINE_2EDB_2EFB_OK:
SUBROUTINE_2EDB_2F4F_OK:
SUBROUTINE_2EDB_2F99_OK:
			//------------------------------
				lda #$00
				sta $900A 
				sta $900B 
				sta $900C 
				sta $900D 
				lda #$03
				sta $20 
				rts 
			//------------------------------
			JUMP_2EEE_2A7E_OK:
			//------------------------------
				jsr SUBROUTINE_2EDB_2EEE_OK
				jmp JUMP_2E40_2EF1_OK
			//------------------------------
			JUMP_2EF4_2E95_OK:
			//------------------------------
				pla 
				pla 
				pla 
				pla 
				jmp JUMP_2250_2EF8_OK
			//------------------------------
			JUMP_2EFB_2C72_OK:
			//------------------------------
				jsr SUBROUTINE_2EDB_2EFB_OK
				lda #$0F
				sta $900E 
				jsr Clear_The_Screen
				ldx #$09
			//------------------------------
			LOOP_SKIP_2F08_2F0F_OK:
			//------------------------------
				lda $2F36,X 
				sta $1101,X 
				dex 
				bne LOOP_SKIP_2F08_2F0F_OK
				lda #$FF
				sta $1F 
			//------------------------------
			LOOP_SKIP_2F15_2F2E_OK:
			//------------------------------
				ldy $1F 
			//------------------------------
			LOOP_SKIP_2F17_2F18_OK:
			LOOP_SKIP_2F17_2F26_OK:
			//------------------------------
				dex 
				bne LOOP_SKIP_2F17_2F18_OK
				sty $900A 
				sty $900B 
				sty $900C 
				dey 
				cpy #$80
				bne LOOP_SKIP_2F17_2F26_OK
				dec $1F 
				lda $1F 
				cmp #$C0
				bne LOOP_SKIP_2F15_2F2E_OK
				jmp JUMP_2F55_2F30_OK
				pla 
				rts 
			//------------------------------
			// $2F35
				.byte $0D,$05,$07,$01
				.byte $0D,$05,$20,$0F
				.byte $16,$05,$12
			//------------------------------
			JUMP_2F40_2ED8_OK:
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
				jsr SUBROUTINE_2EDB_2F4F_OK
				jmp JUMP_2390_2F52_OK
			//------------------------------
			JUMP_2F55_2F30_OK:
			//------------------------------
				ldy #$00
				ldx #$05
			//------------------------------
			LOOP_SKIP_2F59_2F67_OK:
			//------------------------------
				lda $1035,Y 
				cmp $207B,Y 
				beq LOOP_SKIP_2F65_2F5F_OK
				bpl LOOP_SKIP_2F69_2F61_OK
				bmi LOOP_SKIP_2F77_2F63_OK
			//------------------------------
			LOOP_SKIP_2F65_2F5F_OK:
			//------------------------------
				iny 
				dex 
				bne LOOP_SKIP_2F59_2F67_OK
			//------------------------------
			LOOP_SKIP_2F69_2F61_OK:
			//------------------------------
				ldx #$05
			//------------------------------
			LOOP_SKIP_2F6B_2F75_OK:
			//------------------------------
				lda $1034,X 
				sta $207A,X 
				sta $1055,X 
				dex 
				bne LOOP_SKIP_2F6B_2F75_OK
			//------------------------------
			LOOP_SKIP_2F77_2F63_OK:
			//------------------------------
				ldy #$00
				ldx #$05
			//------------------------------
			LOOP_SKIP_2F7B_2F89_OK:
			//------------------------------
				lda $1046,Y 
				cmp $207B,Y 
				beq LOOP_SKIP_2F87_2F81_OK
				bpl LOOP_SKIP_2F8B_2F83_OK
				bmi LOOP_SKIP_2F99_2F85_OK
			//------------------------------
			LOOP_SKIP_2F87_2F81_OK:
			//------------------------------
				iny 
				dex 
				bne LOOP_SKIP_2F7B_2F89_OK
			//------------------------------
			LOOP_SKIP_2F8B_2F83_OK:
			//------------------------------
				ldx #$05
			//------------------------------
			LOOP_SKIP_2F8D_2F97_OK:
			//------------------------------
				lda $1045,X 
				sta $207A,X 
				sta $1055,X 
				dex 
				bne LOOP_SKIP_2F8D_2F97_OK
			//------------------------------
			LOOP_SKIP_2F99_2F85_OK:
			//------------------------------
				jsr SUBROUTINE_2EDB_2F99_OK
				nop 
				nop 
				nop 
				pla 
				pla 
				pla 
				pla 
				jmp Title_Options_Screen // JUMP_3060_2FA3_OK
			//------------------------------
	SUBROUTINE_2FA6_2FD2_OK:
	SUBROUTINE_2FA6_2FDA_OK:
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
				LOOP_SKIP_2FB2_2FCB_OK:
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
					bne LOOP_SKIP_2FB2_2FCB_OK
					pla 
					tay 
					pla 
					tax 
					rts 
				//------------------------------
	SUBROUTINE_2FD2_2B3C_OK:
				//------------------------------
					jsr SUBROUTINE_2FA6_2FD2_OK
					lda $22 
					cmp #$10
					rts 
				//------------------------------
	SUBROUTINE_2FDA_2A83_OK:
				//------------------------------
					jsr SUBROUTINE_2FA6_2FDA_OK
					lda $9464 
					rts 
				//------------------------------
					.byte $00,$00,$00,$00,$00,$00,$00,$00
					.byte $00,$00,$00,$00,$00,$00,$00,$00
					.byte $00,$00,$00,$00,$00,$00,$00,$00
					.byte $00,$00,$00,$00,$00,$00,$00
				//------------------------------
		Draw_Title_Options:
		// SUBROUTINE_3000_3060_OK:
		// SUBROUTINE_3000_30CA_OK:
				//------------------------------
					jsr Clear_The_Screen
					ldx #$12
				//------------------------------
				LOOP_SKIP_3005_300C_OK:
				//------------------------------
					lda $30FF,X 
					sta $107F,X 
					dex 
					bne LOOP_SKIP_3005_300C_OK
					ldx #$05
				//------------------------------
				LOOP_SKIP_3010_301D_OK:
				//------------------------------
					lda $3111,X 
					sta $10B9,X 
					lda $3116,X 
					sta $10D2,X 
					dex 
					bne LOOP_SKIP_3010_301D_OK
					ldx #$19
				//------------------------------
				LOOP_SKIP_3021_3028_OK:
				//------------------------------
					lda $311B,X 
					sta $10F9,X 
					dex 
					bne LOOP_SKIP_3021_3028_OK
					nop 
					ldx #$07
				//------------------------------
				LOOP_SKIP_302D_303A_OK:
				//------------------------------
					lda $3134,X 
				//------------------------------
	SUBROUTINE_3030_206A_OK:
			//------------------------------
				sta $1135,X 
				lda $313B,X 
				sta $114E,X 
				dex 
				bne LOOP_SKIP_302D_303A_OK
				ldx #$14
			//------------------------------
			LOOP_SKIP_303E_3051_OK:
			//------------------------------
				lda $3142,X 
				sta $1178,X 
				lda $3156,X 
				sta $11AA,X 
				lda $316A,X 
				sta $11DC,X 
				dex 
				bne LOOP_SKIP_303E_3051_OK
				ldx #$14
			//------------------------------
			LOOP_SKIP_3055_305C_OK:
			//------------------------------
				lda $317E,X 
				sta $120E,X 
				dex 
				bne LOOP_SKIP_3055_305C_OK
				rts 
			//------------------------------
				nop 
			//------------------------------
			Title_Options_Screen:
				// JUMP_3060_2022_OK:
				// JUMP_3060_2FA3_OK:
			//------------------------------
				jsr Draw_Title_Options //SUBROUTINE_3000_3060_OK
			//------------------------------
			LOOP_SKIP_3063_3089_OK:
			LOOP_SKIP_3063_30B9_OK:
			JUMP_3063_30D3_OK:
			//------------------------------
				ldx #$02
			//------------------------------
			LOOP_SKIP_3065_3077_OK:
			//------------------------------
				txa 
				ldy #$00
			//------------------------------
			LOOP_SKIP_3068_3072_OK:
			//------------------------------
				sta $9464,Y 
				sta $9500,Y 
				sta $9600,Y 
				dey 
				bne LOOP_SKIP_3068_3072_OK
				inx 
				cpx #$08
				bne LOOP_SKIP_3065_3077_OK
				jsr SUBROUTINE_2560_3079_OK
				lda $0A 
				and #$80
				beq LOOP_SKIP_3085_3080_OK
				jmp JUMP_3200_3082_OK
			//------------------------------
			LOOP_SKIP_3085_3080_OK:
			//------------------------------
				lda $C5 
				cmp #$40
				beq LOOP_SKIP_3063_3089_OK
				cmp #$27
				bne LOOP_SKIP_30A1_308D_OK
				inc $3156 
				lda $3156 
				cmp #$3A
				bne LOOP_SKIP_30CA_3097_OK
				lda #$31
				sta $3156 
				jmp JUMP_30CA_309E_OK
			//------------------------------
			LOOP_SKIP_30A1_308D_OK:
			//------------------------------
				cmp #$2F
				bne LOOP_SKIP_30B7_30A3_OK
				inc $316A 
				lda $316A 
				cmp #$3A
				bne LOOP_SKIP_30CA_30AD_OK
				lda #$31
				sta $316A 
				jmp JUMP_30CA_30B4_OK
			//------------------------------
			LOOP_SKIP_30B7_30A3_OK:
			//------------------------------
				cmp #$37
				bne LOOP_SKIP_3063_30B9_OK
				inc $317E 
				lda $317E 
				cmp #$33
				bne LOOP_SKIP_30CA_30C3_OK
				lda #$31
				sta $317E 
			//------------------------------
			LOOP_SKIP_30CA_3097_OK:
			JUMP_30CA_309E_OK:
			LOOP_SKIP_30CA_30AD_OK:
			JUMP_30CA_30B4_OK:
			LOOP_SKIP_30CA_30C3_OK:
			//------------------------------
				jsr Draw_Title_Options //SUBROUTINE_3000_30CA_OK
			//------------------------------
			LOOP_SKIP_30CD_30D1_OK:
			//------------------------------
				lda $C5 
				cmp #$40
				bne LOOP_SKIP_30CD_30D1_OK
				jmp JUMP_3063_30D3_OK
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
			JUMP_31B2_1B6C_OK:
			JUMP_31B2_1BEE_OK:
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
			JUMP_3200_3082_OK:
			//------------------------------
				ldy #$30
				lda $317E 
				sta $26 
			//------------------------------
			LOOP_SKIP_3207_320A_OK:
			//------------------------------
				dec $26 
				dey 
				bne LOOP_SKIP_3207_320A_OK
				ldy #$30
				lda $3156 
				sta $19 
			//------------------------------
			LOOP_SKIP_3213_3216_OK:
			//------------------------------
				dec $19 
				dey 
				bne LOOP_SKIP_3213_3216_OK
				lda #$AA
				sta $0D 
				lda $316A 
				sta $1F 
				ldy #$30
			//------------------------------
			LOOP_SKIP_3223_3226_OK:
			//------------------------------
				dec $1F 
				dey 
				bne LOOP_SKIP_3223_3226_OK
			//------------------------------
			LOOP_SKIP_3228_3231_OK:
			//------------------------------
				lda $0D 
				sec 
				sbc #$0A
				sta $0D 
				dec $1F 
				bne LOOP_SKIP_3228_3231_OK
				jsr Draw_Game_Status_Screen
				jmp JUMP_2200_3236_OK

			// $3239
