
#import "Vic20MemoryMap.asm"

// Character set @ $1200

GAMESETTINGS:
    {
        .label Screen                       = DISPLAY.SCREENX
        .label ScreenColour                 = DISPLAY.COLORMAPX
        .label UNUSED_BASIC_RAM             = $12BC
        .label GridStart                    = $1064
        .label GridRows                     = $08
        .label GridCols                     = $08
        .label GridWidth                    = $18
        .label GridHeight                   = $18
        .label ScreenRowsx_4                = $64
        .label MOVE_POSITION_UP_OR_DOWN     = GAMESETTINGS.GridWidth+1  //Move 1 full line up or down from current position

    }

// Keyboard Scancodes
KEYBOARD:
    {
        .label NUL = $40
        .label KEY_F1  = $27
        .label KEY_F3  = $2F
        .label KEY_F5  = $37
    }
// Zero Page
PAGEZERO:
    {
        .label ZP_00            = $00
        .label ZP_01            = $01
        .label ZP_02            = $02   //  grid position
        .label ZP_03            = $03   //  
        .label ZP_04            = $04   //  grid position2
        .label ZP_05            = $05   //  
        .label ZP_06            = $06 
        .label ZP_07            = $07 
        .label ZP_08            = $08
        .label ZP_09            = $09
        .label JOYSTICK_DIR     = $0a
        .label ZP_0b            = $0b
        .label ZP_GameSpeed     = $0d
        .label ZP_completedBlk  = $17
        .label ZP_18            = $18
        .label ZP_Pursures      = $19
 //                               = $21
        .label ZP_Speed         = $1f
        .label ZP_Players       = $26
        .label LSTX             = $C5
    }
// Characters
CHAR:
    {
        .label ship_up      = $4b
        .label ship_right   = $4c
        .label ship_down    = $4d 
        .label ship_left    = $4e 
        .label grid_cross   = $4f 
        .label grid_vert    = $50
        .label grid_hori    = $51
        .label grid_tlc     = $53
        .label grid_trc     = $52
        .label grid_brc     = $54
        .label grid_blc     = $55
        .label grid_T_right = $56
        .label grid_T_left  = $57
        .label grid_T_down  = $58
        .label grid_T_up    = $59
        .label Bug1_up      = $5b 
        .label Bug1_right   = $5c 
        .label Bug1_down    = $5d 
        .label Bug1_left    = $5e 
        .label Bug2_up      = $5f 
        .label Bug2_right   = $60
        .label Bug2_down    = $51
        .label Bug2_left    = $62
    }
