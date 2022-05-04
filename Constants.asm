// Character set @ $1200

GAMESETTINGS:
    {
        .label Screen           = $1000
        .label ScreenColour     = $9400
        .label UNUSED_BASIC_RAM = $12BC
        .label GridStart        = $1064
        .label GridRows         = $08
        .label GridCols         = $08
        .label GridWidth        = $18
        .label GridHeight       = $18
        .label ScreenRowsx_4    = $64
        .label MOVE_UP_DOWN     = GAMESETTINGS.GridWidth+1

    }

// Vic20 Memory map constants
VIC:
    {
        .label VICCR0       = $9000
        .label VICCR1       = $9001
        .label VICCR2       = $9002
        .label VICCR3       = $9003
        .label VICCR4       = $9004
        .label VICCR5       = $9005
        .label VICCR6       = $9006
        .label VICCR7       = $9007
        .label VICCR8       = $9008
        .label VICCR9       = $9009
        .label VICCRA       = $900a
        .label VICCRB       = $900b
        .label VICCRC       = $900c
        .label VICCRD       = $900d
        .label VICCRE       = $900e
        .label VICCRF       = $900f
    }
// VIA
VIA:
    { 
        .label VIAPA2       = $911f

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
        .label ZP_TEMP_01       = $02   //grid position
        .label ZP_03            = $03   // see zp2
        .label ZP_TEMP_02       = $04   //grid position2
        .label ZP_05            = $05   // see zp4
        .label ZP_TEMP_03       = $06 
        .label ZP_07            = $07 
        .label ZP_08            = $08
        .label ZP_09            = $09
        .label JOYSTICK_DIR     = $0a
        .label ZP_0b            = $0b
        .label ZP_0D            = $0d

        .label ZP_Pursures      = $19
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
KERNAL:
{
    .label ISCNTC       =   $FFE1       //Check for Stop Key
}
