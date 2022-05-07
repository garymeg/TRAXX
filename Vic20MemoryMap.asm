#importonce
//            Vic20 MEMORY NAME
//            Put together by
//            Gary Metheringham

//            from 'Compute's Mapping the Vic20'

/*
      How to use this file in your vic20 .asm file
      import at the beginning of your .asm file
      then use the format groupName.locatioNname

      lda PAGE0.LDTND
      sta PAGE0.USER
      jsr BASIC.RND
*/

//              PAGE0       = $0 - FF                 Decimal 0 - 255
//              STACK       = $100-lFF                Decimal >       256 - 318
//              BKSHARED    = $200 - 3FF              Decimal >       319 - 1023        KERNAL & BASIC SHARED ROUTINES
//              COLORMAPS   = $9400 - 95FF            Decimal >       37888
//              RAMBLK4     = $A000 - BFFF            Decimal >       40960
//              BASIC       = $C000 - DFFF            Decimal >       49152
//              BASICSPILL  = $E000 - E49F            Decimal >       57344
//              KERNAL      = $E4A0 - FFFF            Decimal >       58528


PAGE0: // Zero Page Named
    {
        .label      USRPOK           = $0    // The INITBA routine initializes this location during power-on\/reset.        Decimal >       0
        .label      ADDPRC           = $1    // The USR jump vector in LSB/MSB (displacement/page) form.        Decimal >       1-2
        .label      ADRAY1           = $3    // Vector to floating point/integer conversion routines.        Decimal >       3-4
        .label      ADRAY2           = $5    // Vector to the integer to floating point conversion routines, starting at MAKFP.        Decimal >       5-6
        .label      CHARAC           = $7    // Search-character for scanning BASIC statements.        Decimal >       7
        .label      ENDCHR           = $8    // Scan-quotes flag for scanning BASIC statements.        Decimal >       8
        .label      TRMPOS           = $9    // Column that the cursor was on just before last TAB or SPG        Decimal >       9
        .label      VERCHK           = $A    // Tape: 0=LOAD, 1=VERIFY/LOAD sets this byte to 0 and VERIFY sets it to 1.        Decimal >       10
        .label      COUNT            = $B    // Buffer index/array dimensions.        Decimal >       11
        .label      DIMFLG           = $C    // Flags for locate-or-build-array routines.        Decimal >       12
        .label      VALTYP           = $D    // Type of variable: 255 ($FF)=string, 00=numeric         Decimal >       13
        .label      INTFLG           = $E    // Numeric variable type: 128 ($80)=integer, 00=floating point        Decimal >       14
        .label      GARBFL           = $F    // Flag byte: LIST quote/collect done/tokenize character.        Decimal >       15
        .label      SUBFLG           = $10   // Subscript or FN X flag byte.        Decimal >       16
        .label      INPFLG           = $11   // Indicates which of READ, INPUT, or GET is active.        Decimal >       17
        .label      TANSGN           = $12   // TAN/ SIN sign/comparison results.        Decimal >       18
        .label      CHANNL           = $13   // Current channel number for BASIC input/output routines.        Decimal >       19
        .label      LINNUM           = $14   // Line number integer in two-byte LSB/MSB format.        Decimal >       20 - 21
        .label      TEMPPT           = $16   // Pointer to available slot in temporary string stack.        Decimal >       22
        .label      LASTPT           = $17   // Pointer to the last string descriptor used in the stack.        Decimal >       23 - 24
        .label      TEMPST           = $19   // Descriptor stack for three temporary strings.        Decimal >       25 - 26
        .label      INDEX            = $22   // Miscellaneous temporary pointers and SAVE areas.        Decimal >       34 - 37
        .label      RESHO            = $26   // BASIC multiplication work area.        Decimal >       38 - 42
        .label      TXTTAB           = $2B   // Pointer to the start of the tokenized BASIC program.        Decimal >       43 - 44
        .label      VARTAB           = $2D   // Pointer to the end of BASIC program, -start of variables.        Decimal >       45 - 46
        .label      ARYTAB           = $2F   // Pointer to the end of BASIC variables, start of arrays.        Decimal >       47 - 48
        .label      STREND           = $31   // Pointer to the bottom of BASIC active strings.        Decimal >       49 - 50
        .label      FRETOP           = $33   // Pointer to the most current string added or moved.        Decimal >       51 - 52
        .label      FRESPC           = $35   // Pointer to the end of BASIC memory.        Decimal >       53 - 54
        .label      MEMSIZ           = $37   // Line number of the BASIC statement being executed, in LSB/MSB format.        Decimal >       55 - 56
        .label      CURLIN           = $39   // Previous BASIC line number executed, in LSB/MSB form.        Decimal >       57 - 58
        .label      OLDLIN           = $3B   // Saves TXTPTR pointer of statement being executed, for CONT        Decimal >       59 - 60
        .label      OLDTXT           = $3D   // Current DATA line number in LSB/MSB form.        Decimal >       61 - 62
        .label      DATLIN           = $3F   // Pointer to the current BASIC data item.        Decimal >       63 - 64
        .label      DATPTR           = $41   // Pointer to source of INPUT, GET, and READ information.        Decimal >       65 - 66
        .label      INPPTR           = $43   // Current BASIC variable name with type flags.        Decimal >       67 - 68
        .label      VARNAM           = $45   // Pointer to the descriptor of the current BASIC variable.        Decimal >       69 - 70
        .label      VARPNT           = $47   // Pointer to BASIC variable used in FOR loop.        Decimal >       71 - 72
        .label      FORPNT           = $49   // Pointer to BASIC variable used in FOR loop. These locations are also used by many routines for other purposes.        Decimal >       73 - 74
        .label      OPPTR            = $4B   // Math operator displacement/INPUT TXTPTR. These locations serve as the displacement of the current math operator in a table during formula evaluation. The math operator table is at location 49280 ($C080).        Decimal >       75 - 76
        .label      OPMASK           = $4D   // Comparison desired mask. This location's value is created by the expression evaluator rou tine FRMVL. A value of 1 indicates a greater-than check, 2 signifies an equals check, and 4 flags a less-than check. They may be used in combination by adding the values. See also location 18 ($12).        Decimal >       77
        .label      DEFPNT           = $4E   // Pointer to current FN descriptor in variable storage. DEF FN uses this location as a pointer to the descriptor created. During FN, this is a pointer to the FN descriptor used to save the evaluation results. This is also a work pointer for garbage collection.        Decimal >       78 - 79
        .label      DSCPNT           = $50   // Pointer to the current string descriptor. This location is used and set by the string assignment and handling routines. Location 82 ($52) is related to this location.        Decimal >       80 - 81
        .label      SIZE             = $52   // Length of the current BASIC string. See location 80 ($50).        Decimal >       82
        .label      FOUR6            = $53   // Constant, set at either 3 or 7, for garbage collection. Used to instruct garbage collection routines whether a three- or seven-byte string descriptor is being collected.      Decimal >       83
        .label      JMPER            = $54   // BASIC numeric work area. Another busy work area for BASIC. Because so many BASIC routines use and overlay this area, none of it can be assumed to con tain any specific data at any one time.        Decimal >       84 - 86
        .label      TEMPF3           = $57   // BASIC floating point accumulator one. 97 $61 FACEXP Exponent of the value + 128. • 98-101 $62-65 FACHO Normalized mantissa of the value. • 102 $66 FACSGN Sign: 0=positive, 128-255 ($80-FF)=negative       Decimal >       87 - 96
        .label      FAG              = $61   // BASIC series evaluation number of items. This location is used by the mathematical formula evaluation routine to indicate the number of evaluations to be done. A complex formula may need several levels of evaluation of terms before themfinal result can be determined. This location contains the number of terms to be resolved.        Decimal >       97 - 102
        .label      SGNFLG           = $67   // High order FAC propagation word. Overflow. Overflow work area byte resulting from normalization of FAC when a floating point number is being constructed.        Decimal >       103
        .label      BITS             = $68   // BASIC floating point accumulator two. Appendix B has a full description of each of the floating point accumulators, as well as an explanation of floating point numbers and conversion.        Decimal >       104
        .label      ARG              = $69   // FAC to FAC2 sign comparison. This is used to indicate the difference or likeness of signs. 0 in this address means FAC and FAC2 have same sign, while a value of 225 ($FF) means their signs are different. Along with locations 112-114 ($70-72), this address is used as a work area for string handling routines. Locations 111-112 ($6F-$70) are also used as a pointer to a string.        Decimal >       105 - 110
        .label      ARGEXP           = $69   // Low order of FAC mantissa for rounding. With location 111 ($6F), this location is used by string handlers as a pointer to string.        Decimal >       105 - 110
        .label      FAC2             = $69   // Series evaluation pointer. This is a pointer to the table of constants for the trigonometric function being evaluated by the formula evaluation routines. For this, the location will point somewhere within the tables starting at 58171 ($E33B), 55745 ($D9C1), 57284 ($DFC4), or 58092 ($E2EC).        Decimal >       105 - 110
        .label      ARISGN           = $6F   //        Decimal >       111
        .label      FACOV            = $70   //        Decimal >       112  
        .label      FBUFPT           = $71   //         Decimal >       113 - 114
        .label      CHRGET           = $73   // // Get-BASIC-character routine; This routine is used to scan BASIC lines or any other area that a calling routine desires by setting TXTPTR. Either the next character or the current character can be retrieved,        Decimal >       115 - 120
        .label      CHRGOT           = $79   // // Get-BASIC-character routine; This routine is used to scan BASIC lines or any other area that a calling routine desires by setting TXTPTR. Either the next character or the current character can be retrieved,        Decimal >       121
        .label      TXTPTR           = $7A   // // Get-BASIC-character routine; This routine is used to scan BASIC lines or any other area that a calling routine desires by setting TXTPTR. Either the next character or the current character can be retrieved,        Decimal >       122 - 138
        .label      RNDCl            = $8B   // BASIC RND work area, last random number, or initial seed. This routine is initialized at power-on/reset, along with the CHRGET routine, from a master copy in ROM. The copying of this area to zero page is done by the routine INITBA at location 58276 ($E3A4). The initial value of this location is .811635157,        Decimal >       139 - 143
        .label      STATUS           = $90   // ST status of I/O completion. Kernal routines that open channels or perform input/output P"] functions check and set this location. When BASIC examines this status or sets the ST variable for the programmer to examine, a jump is made to the Kernal vector CRDST.         Decimal >       144
        .label      STKEY            = $91   // Keyswitch PIA: bottom keyboard row scan. Each time the jiffy clock TIME is updated by the Kernal, the contents of VIA2PA2 (VIA 2-Port A) are copied to this location.        Decimal >       145
        .label      SVXT             = $92   // Tape: 0/1 bit timebase fluctuation during read operations. This location stores the difference between the actual time for  the dipole just read and the adjustable timebase. This determines whether a dipole is considered to be 0 or 1.      Decimal >       146
        .label      VERCK            = $93   // Tape: 0=LOAD, 1=VERIFY        Decimal >       147
        .label      C3PO             = $94   // Serial: output deferred character flag. This location is used by the Kernal serial output routines to determine when to send the buffered output serial character stored in location 149 ($95).        Decimal >       148
        .label      BSOUR            = $95   // Serial: output buffered character. A value of 255 ($FF) in this location indicates that no character is waiting for serial output.        Decimal >       149
        .label      SYNO             = $96   // Tape: block found flag, tape leader length bit count. This location's values indicate during tape LOAD that: • 0: either no block is recognized yet or a block is recognized and data is being read from that block. • 16-126: has read at least 16 leader bits during read of the tape leader either before the first block or between blocks 1 and 2, and is now waiting for the word marker at the end of the leader.        Decimal >       150
        .label      XSAV             = $97   // .X register SAVE area for get and put ASCII characters routines. 158 ($9E) is also used by output routines. The INITEM routine uses this location to test for the start of  RAM and to insure that locations 0-1024 are accessible.       Decimal >       151
        .label      LDTND            = $98   // Number of currently open files, not to exceed ten. ) This is used as an end index for the last-used entry in the file, device number, and secondary address data tables, found at the following locations: 601 ($259) LAT File number table 611 ($263) FAT Device number table 621 ($26D) SAT Secondary address table        Decimal >       152
        .label      DFLTN            = $99   // Device number of the current input device. Used by the Kernal to determine the routines called for processing the received data. VIC-20 devices are: 0 keyboard, 1 tape, 2 RS-232/user port, 3 screen, 4-5 printer, 8-11 disk Device numbers, 4-31 could be any serial device.        Decimal >       153
        .label      DFLTO            = $9A   // Device number of output device. BASIC passes the file number to the Kernal when PRINT# or CMD causes an indirect jump via the vector at 800 ($320) to 62217 ($F309), open-channel-for-output.         Decimal >       154
        .label      PRTY             = $9B   // Tape: character parity. This location is used to help detect missing dropped bits in tape data. It's also a parity work byte during tape load and save, with bit 0 used to calculate parity. Odd parity is used when the parity bits' total number of l's, for all 8 data bits, is an odd number.        Decimal >       155
        .label      DPSW             = $9C   // Tape: dipole switch/byte-received flag. During tape load, the following values in this location mean that: 1: a byte has been completely received. 0: the computer is waiting for the next byte or is still receiving a byte.        Decimal >       156
        .label      MSGFLG           = $9D   // Kernal message control flag. The following values in this location signify: 128 ($80) = Kernal control messages wanted 64 ($40) = Kernal error messages wanted 192 ($C0) = Kernal control and error messages wanted If bit 7 is off, no Kernal control messages, such as SAVING, FOUND, PRESS PLAY, and so on, will be shown on the screen. I I If bit 6 is off, no Kernal I/O ERROR number messages will be displayed.        Decimal >       157
        .label      PTR1             = $9E   // Tape: error log index/filename index/header I.D./out byte. This location is used by various tape routines for several purposes: Tape SAVE. Temporary storage for tape I.D. header. The header values are: 1 = relocatable, 2 = user data record, 3 = nonrelocatable, 4 = user data header, 5 = end of tape         Decimal >       158
        .label      PTR2             = $9F   // Tape: pass 2 error pointer/tape buffer filename index. This location is also used for several tape routine operations, such as: | I Tape LOAD. Pass 2 error correction index, and indexes — through stack error location address. This is limited to a value no greater than the pass 1 error correction index. See 158 ($9E).        Decimal >       159
        .label      TIME             = $A0   // Jiffy clock, realtime clock. These locations keep a count of the jiffies, one-sixtieths of a second, since power-on. They're reset to zero after 24 hours. Tape I/O interferes with both accurate clocking and testing of the STOP key; but serial I/O interference, from the disk drive or a printer, for example, is negligible. The individual locations in this routine have these functions: 160 ($A0) is incremented every 18.2044 minutes 161 ($A1) every 4.26667 seconds 162 ($A2) every .01667 second (one jiffy])        Decimal >       160 - 162
        .label      PCNTR            = $A3   // Serial: input bit count/Tape: input/output bit count. Serial. If the high order flag bit is on, this indicates that the last byte has been sent to the serial device. Tape. Count of bits remaining to be written for a byte during tape write, or bits remaining to be read for a byte during tape read. This location is initialized to 8 before each byte and decremented after each bit is written or read.        Decimal >       163
        .label      FIRT             = $A4   // Serial: input byte/cycle counter/Tape: dipole number. Serial. The input byte read in during a serial LOAD or VERIFY. Tape read/write. Flag to indicate which dipole has been processed. Set to 1 if you just processed the first half of the dipole or to 0 if you just processed the second half.        Decimal >       164
        .label      CNTDN            = $A5   // Tape: block sync countdown/Serial: countdown. Tape. Countdown for block synchronization. During tape SAVE, is a counter for block countdown characters written to tape before each block's data begins.        Decimal >       165
        .label      BUFPNT           = $A6   // Tape: count of characters in the tape buffer. This location is used to count bytes when writing the tape header, and when accumulating BASIC program output for the tape buffer.         Decimal >       166
        .label      INBIT            = $A7   // Tape: write leader count/read block reverse counter. RS-232: bit 0 is the temporary storage for input bit. Tape. Write leader length counter.        Decimal >       167
        .label      BITCI            = $A8   // Tape: error flags, 0 = no errors/long word marker switch. RS-232: input byte bit count and output new byte. Tape. During SAVE, this is a switch for word marker write. If the value is 0, it's writing the long time for a word marker dipole. If 1 is the value, the long time for a word marker dipole has already been written.         Decimal >       168
        .label      RINONE           = $A9   // Tape: dipole balance counter/medium word marker switch. RS-232: input flag for checking for a start bit. Tape. During SAVE, this byte acts as a switch for word marker write. If its value is 0, then write the 1 time, medium time, for a word marker dipole. If its value is 1, the 1 time for a word marker dipole has already been written.        Decimal >       169
        .label      RIDATA           = $AA   // Tape: input status flags, sync countdown. RS-232: byte assembly. If the SAVE starting address is greater than the ending address, this location is set to 128 ($80), indicating invalid parameters.        Decimal >       170
        .label      RIPRTY           = $AB   // Tape: write leader counter/read checksum comparison.RS-232: input parity/checksum bit storage. Tape. When writing leader dipoles to tape, this is used as a counter for an outer loop that must count down to — 1 before the routine will stop writing leader dipoles. This results in a total number of leader dipoles written equal to the value of INBIT multiplied by the value in RIPRTY, plus one. See location 167 ($A7), INBIT for its value.        Decimal >       171
        .label      SAL              = $AC   // Tape/Serial: start address for LOAD/SAVE/VERIFY. Copied here from 193 ($C1), the pointer to start of I/O area, this location is then used as a pointer through the data, and incremented as the data is sent or loaded. Location 174 ($AE) contains the end+1 address to be attained in this pointer. These locations may be pointed to any area when calling Kernal LOAD and SAVE routines.       Decimal >       172 - 173
        .label      EAL              = $AE   // Tape: ending address for LOAD, SAVE, and VERIFY. Serial: loading address for LOAD/VERIFY, end address plus 1 for SAVE. This location is initially set by the Kernal SAVE routine from parameters passed to it.        Decimal >       174 - 175
        .label      CMPO             = $B0   // Tape: dipole timing adjustment values. Timer 1 of VIA 2 at location 37156 ($9124) is adjusted with this value during the reading of tape.        Decimal >       176
        .label      TEMPI            = $B1   // Tape: dipole timing timer 2 difference. Timer 1 of VIA 2 at location 37156 ($9124) is adjusted with this value during the reading of tape.        Decimal >       177
        .label      TAPE1            = $B2   // Tape: pointer to tape buffer. Initialized by power-on/reset, this location normally points to 828 ($33C). BASIC uses the tape buffer for all program tape data 1/O. LOAD and SAVE only use the tape buffer for tape header records. Serial devices use the buffer at 512 ($200), but filename information is sent from the location the pointer at 187 ($BB) indicates, the length specified in 183 ($B7). RS-232 allocates its 512 bytes of buffers (256 in, 256 out) from the top of available RAM.        Decimal >       178 - 179
        .label      BITTS            = $B4   // Tape: miscellaneous flags/RS-232: various uses. Tape. Nonzero means tape routines are ready to receive data byte. This is reset to zero between blocks. RS-232. Transmit bit count out, timer enable flag, parity, and stop bit manipulation.        Decimal >       180
        .label      NXTBIT           = $B5   // Tape: flag for currently reading data or leader. RS-232: next bit to be sent or EOT. During tape LOAD, this address indicates where the tape LOAD routine is currently reading data.        Decimal >       181
        .label      RODATA           = $B6   // Tape: accumulator for number of read errors. RS-232: byte disassembly area for buffer pointed to by 249 ($F9). This holds the byte currently being sent from the RS-232 buffer.        Decimal >       182
        .label      FNLE1SJ          = $B7   // Number of characters in filename. Only the first 16 characters of a filename will show in a FOUND message, so the message is never longer than a 22-column line.        Decimal >       183
        .label      LA               = $B8   // Current logical file number being used. A maximum of ten files can be open at any one time. The file number can range between 1 and 255. If the file number is greater than 127, a linefeed character is sent to the file following any carriage returns.         Decimal >       184
        .label      SA               = $B9   // Current secondary address being used, The valid range of this number is 0-31 for serial devices and 0-127 for nonserial devices. 0, 1, and 15-31 have special meanings for DOS. Use 2-14 for disk data files.        Decimal >       185
        .label      FA               = $BA   // Current device number being used. This location is also called the primary address in some documentation. VIC-20 devices are: 0 keyboard, 1 tape, 2 RS-232/user port, 3 screen, 4-5 printer, 8-11 disk, 4-31 could also be any serial device. See location 611 ($263) FAT device number table. See locations 184 ($B8), 185 ($B9), 153 ($99), and 154 ($9A),        Decimal >       186
        .label      FNADR            = $BB   // Pointer to the current filename. If an OPEN, LOAD, SAVE, or VERIFY for tape doesn't specify a filename, then location 183 ($B7), the length of the filename, contains zero, and this pointer is unpredictable.        Decimal >       187 - 188
        .label      ROPRTY           = $BD   // RS-232: send parity calculation work byte. Tape: byte just read or shifting byte currently being written. During SAVE, this byte is saved to tape. After one bit is written to tape, the byte is shifted right one bit, and the procedure repeats until all eight bits have been written. During LOAD, this location holds the byte that has been read after being built in 191 ($BF).        Decimal >       189
        .label      FSBLK            = $BE   // Tape: which copy of block remaining to read/write. • A 2 in this location means both copies of block remain to save/load. • 1 in this location means that the last copy of block remains to save/load. • A 0 means that both copies of block are done.        Decimal >       190
        .label      MYCH             = $BF   // Tape: input byte currently being constructed. During tape read, the bits read from tape are rotated into the high order to low order bits to build a byte. Once eight bits have been received, the byte is considered complete.        Decimal >       191
        .label      CAS1             = $C0   // Tape: motor interlock switch. A nonzero value here, which is possible only if some tape buttons are pressed down, prevents any change of tape motor switch. The IRQ interrupt handler at location 60095 ($EABF) normally sets this location to 0 if no tape buttons are pressed down.        Decimal >       192
        .label      STAL             = $C1   // Tape/Serial: pointer to the start of the I/O area. These locations are initially set in SAVE/LOAD from parameters passed to them.        Decimal >       193 - 194
        .label      MEMUSS           = $C3   // Pointer to the RAM area being LOADed.        Decimal >       195 - 196
        .label      LSTX             = $C5   // Matrix coordinate of last key pressed. 64 if none pressed.        Decimal >       197
        .label      NDX              = $C6   // Number of characters (0-10) in the keyboard buffer at 631 ($277).        Decimal >       198
        .label      RVS              = $C7   // Flag for reversed screen characters.        Decimal >       199
        .label      INDX             = $C8   // Pointer to the end of line for input.        Decimal >       200
        .label      LXSP             = $C9   // Current cursor INPUT logical X-Y position (line, column). This location is used by GET and INPUT, the GETIN and CHRIN routines, when reading the screen.        Decimal >       201 - 202
        .label      SFDX             = $CB   // Matrix coordinate of current key pressed. 64 if none, See Table 1-1 at location 197 ($C5)>        Decimal >       203
        .label      BLNSW            = $CC   // Cursor blink switch. 0=flash, nonzero=quiet. This location insures that the cursor won't flash when characters I I are in the keyboard buffer. See location 631 ($277) for a summation of keyboard-related RAM locations.        Decimal >       204
        .label      BLNCT            = $CD   // Cursor countdown before blink. Normally set for 20 jiffies between blinks of the cursor, as counted by the interrupt routine IRQ, this location makes the cursor blink three times per second. Every time the cursor blinks, locations 206 ($CE) and 647 ($287) are updated. Turning the reverse on and off for the character under the cursor causes the blinking image.        Decimal >       205
        .label      GDBLN            = $CE   // Character under cursor in screen POKE code. Screen POKE codes (?) can be converted to ASCII (A) by the following routine, with R being set to 1 if the screen POKE code was for a reverse character.        Decimal >       206
        .label      BLNON            = $CF   // Cursor blink status. 1=reversed character, 0=nonreversed. This location indicates whether the current cursor blink has reversed or unreversed the character under the cursor.       Decimal >       207
        .label      CRSW             = $D0   // Flag indicating if input from screen or keyboard. Zero in this location indicates input from the keyboard. Other values indicate input from the screen. Possible values are 0, 21, 43, 65, or 87.        Decimal >       208
        .label      PNT              = $D1   // Pointer to the start of the logical line that the cursor is on. This pointer indicates the line in screen map RAM. When the line is a continuation of a previous line, this pointer contains the location of the start of the continued line. The MSB of this pointer is also the screen page that the logical line is in.        Decimal >       209 - 210
        .label      PNTR             = $D3   // Cursor position within the logical screen line. The range of this location's value is 0-87 ($0-57). This is typically used as an index added to location 209-210 ($D1-D2), pointer to the start of the logical line that curspr is oil        Decimal >       211
        .label      QTSW             = $D4   // Flag to indicate if within quote marks. A 0 value in this location indicates not within quotes, a 1 indicates within quotes.        Decimal >       212
        .label      LNMX             = $D5   // Current screen line logical length. This location determines when to start a new screen line or expand the current logical line with another physical line. Possible lengths are 21, 43, 65, or 87.        Decimal >       213
        .label      TBLX             = $D6   // Cursor: current physical screen line cursor is on. The possible positions for the cursor range from line 0 to line 22.        Decimal >       214
        .label      ASCII            = $D7   // ASCII value of last key pressed. Temporarily used by SCRNOUT* to hold the character going to the screen.        Decimal >       215
        .label      INSRT            = $D8   // Number of outstanding inserts remaining. As the INST/DEL key is pressed to indicate an insert, the Kernal screen editor shifts the line to the right, allocates an additional line if necessary and possible, updates the screen line length in location 213 ($D5), and adjusts the screen line link table in 217 ($D9).        Decimal >       216
        .label      LDTB1            = $D9   // Screen line link table. This table contains one byte per screen line used to indicate the page of memory in RAM that any particular screen line is in. It also contains a flag bit that is set on when the physical line is the first or only physical line in an up-to-four-line logical line. The byte for the first physical line of a four-physical-line logical line would have the high-order bit set, and the three following bytes would not be set, to indicate continued lines.       Decimal >       217 
        .label      USER             = $F3   // Pointer to the current physical screen lines color map area. This location is synchronized with location 209-210 ($D1-D2) by the COLORSYN* routine and serves as a base pointer to the appropriate color nybble for routines that store characters on the 1 screen. These routines use location 209-210 ($D1-D2) as a screenmap pointer. You can use        Decimal >       243 - 244
        .label      KEYTAB           = $F5   // Pointer to keyboard table being used. The keyboard tables are used to point to the proper character in ROM or RAM that a key corresponds to. Location 203 ($CB) is used as the input key number, and location 653 ($28D) is used for SHIFT patterns. The resulting ASCII character is placed in the keyboard buffer at 631 ($277) by the SCNKEY routine.        Decimal >       245 - 246
        .label      RIBUF            = $F7   // RS-232: pointer to start of receiving buffer. The 256-byte buffer this location points to is created when device 2 is OPENed, starting at the address in 643 ($283), minus 256. 643 ($283) is reset to that address, minus one, to protect the buffer. The address of the receiving buffer is also stored here.        Decimal >       247 - 248
        .label      ROBUF            = $F9   // RS-232: pointer to the start of the transmitting buffer. This address points to an additional 256-byte buffer for RS-232 data.        Decimal >       249 - 250
        .label      FREKZP           = $FB   // Four bytes of unused page 0 space.        Decimal >       251 - 254
        .label      BASZPT           = $FF   // BASIC temporary area for floating point to ASCII conversion. See location 256 ($100).        Decimal >       255

        }
BKSHARED: //Routines used by basic and Kernal
    {
        .label      BUF              = $200  // 89-byte BASIC input^ buffer.        Decimal >       512 - 600
        .label      LAT              = $259  // Open logical file number table. Ten one-byte entries.        Decimal >       601 - 610
        .label      FAT              = $263  // Open device number table. Ten one-byte entries.        Decimal >       611 - 620
        .label      SAT              = $26D  // Open secondary address table. Ten one-byte entries.        Decimal >       621 - 630
        .label      KEYD             = $277  // Ten-byte keyboard buffet.;        Decimal >       631 - 640
        .label      MEMSTR           = $281  // Pointer to the start of user RAM memory.        Decimal >       641 - 642
        .label      MEMHIGH          = $283  // Pointer to the end of user RAM memory plus one. At power-on/reset, the Kernal INITMEM* routine finds the last RAM location above 1024 ($400) and saves that address here. After BASIC has been started, by the COLDST* routine, this location is altered only by an OPEN or CLOSE of an RS-232 device. When that happens, this pointer is lowered 512 bytes to create two 256-byte buffers for Input/Output.        Decimal >       643 - 644
        .label      TIMOUT           = $285  // Serial: timeout enable/disable flag. Regardless of the description on page 205 of the V/C-20 Programmer's Reference Guide and the fact that SETTMO sets this location from the .A passed to it, no reference has been found to this location.        Decimal >       645
        .label      COLOR            = $286  // Current foreground color selected by color keys. This address is initialized to color 6 (blue) by INITSK* routine at power-on/reset or RUN/STOP-RESTORE. When the Kernal is about to put a character to the screen, this location's content is stored in the corresponding color map location.       Decimal >       646
        .label      GDCOL            = $287  // Cursor: original color at this screen location. Every time the cursor is blinked by the IRQ routine, location 206 ($CE) is updated and the color map code for the current screen location is stored at this address.        Decimal >       647
        .label      HIBASE           = $288  // Screen map RAM page number. This byte is set by the power-on/reset routines to the page number of the beginning of screen RAM. You can multiply the contents of this location by 256 to find the current location of the screenmap RAM. On an unexpanded VIC-20, the screen is at 7680, and 83 this location contains 30 ($1E) (30*256=7680).        Decimal >       648
        .label      XMAX             = $289  // Maximum number of characters in the keyboard buffer. The normal value in this location is ten, the length of the keyboard buffer at 631 ($277). This location is compared with location 198 ($C6), which holds the number of characters in the keyboard buffer, in order to ignore key presses after the buffer is filled.        Decimal >       649
        .label      RPTFLG           = $28A  // Keyboard repeater flags. This location is initialized to zero, which causes only the cursor, space bar, and INST/DEL keys to repeat. You can set this byte to: 128: ALL KEYS TO REPEAT, 64 NO KEYS TO REPEAT, 0 DEFAULT KEYS TO REPEAT See locations 651 ($28B) and 652 ($28C) for repeat timing values. See location 631 ($277) for a summation of the keyboard-related RAM locations.        Decimal >       650
        .label      KOUNT            = $28B  // Delay before other than first repeat of key. This is initialized to 6 once 652 ($28C), the first repeat delay counter, has been decremented to zero. Location 652 ($28C) is reduced to zero when the same key is held down.        Decimal >       651
        .label      DELAY            = $28C  // Delay before first repeat of key. This address's initial value of 16 is counted down every sixtieth of a second by each IRQ interrupt, as long as the same key is pressed. When zero is reached, the value in 651 ($28B) is decremented to zero on every jiffy that the key is still held down, then the key is duplicated in the keyboard buffer by the SCNKEY routine. The value 4 is then stored in location 651 ($28B), and this location is left with its value as zero so that following repeats occur rapidly.        Decimal >       652
        .label      SHFLAG           = $28D  // Current SHIFT keys pattern/ This location is used to determine which keyboard table is used for converting the key pressed into an ASCII character. Different SHIFT patterns cause the selection of the appropriate character table.        Decimal >       653
        .label      LSTSHF           = $28E  // Previous SHIFT key pattern. This location is used in combination with location 653 ($28D) to debounce the special SHIFT keys. This will keep the SHIFT/Commodore key combination from changing character sets back and forth during a single pressing of both keys. The values in this location are saved from location 653 ($28D).        Decimal >       654
        .label      KEYLOG           = $28F  // Pointer to the default keyboard table setup routine.This location is used as an indirect jump pointer by the SCNKEY routine to the routine that determines which keyboard decoding table is used, based on the SHIFT key pattern in 653 ($28D). By changing this pointer after power-on/reset, you can intercept the provided routine or replace it altogether.        Decimal >       655 - 656
        .label      MODE             = $291  // Flag to enable or disable combined SHIFT and Commodore keys Values in this location are 0 for enabled, 128 for disabled. Although this location's value is initially set to 0, a value of 128 ($80) here will disable the SHIFT and Commodore key combination from switching to the alternate character set. The SHIFT, Commodore, and CTRL keys will work normally when pressed for any other purpose.        Decimal >       657
        .label      AUTODN           = $292  // Screen scroll-down enabled flag. This byte's value is set to 0 to enable the scroll-down function when the computer is turned on. Any other value in this location disables the scroll down.        Decimal >       658
        .label      M51CTR           = $293  // RS-232: pseudo-6551 control register. This location specifies the RS-232 baud rate (the transmit/receive speed), the word length in bits, and the number of stop bits. The VIC-20 emulates a 6551 UART chip with software.        Decimal >       659
        .label      M51CDR           = $294  // RS-232: pseudo-6551 command register. This location specifies the RS-232 parity, for data checking, duplex mode, to determine if talking and listening occur simultaneously; and the handshaking protocol used, to insure that the same protocol is used on the other end of the transmission. (If it's not the same protocol, it's like one person extending his left hand and the other person extending his right to shake hands.) The VIC-20 emulates a 6551 UART chip with        Decimal >       660
        .label      M51AJB           = $295  // RS-232: nonstandard bit timing specification. This location is used to store the user-desired baud rate. See location 659 ($293), the RS-232 control register, for a description of how to set this location. Unfortunately, this is not implemented in the VIC-20, since RS-232 routines never reference this location.        Decimal >       661 - 662
        .label      RSSTAT           = $297  // RS-232: status register. storage) This status register is erroneously zeroed by ST if the current device in location 186 ($BA) is device 2.        Decimal >       663
        .label      BITNUM           = $298  // RS-232: number of bits to be sent/received. This location is used to indicate how many zeros must be added to the data character to pad its length to the word length specified in location 659 ($293), the RS-232 control register. Also see locations 180 ($B4) and 168 ($A8).        Decimal >       664
        .label      BAUDOF           = $299  // RS-232: system clock divided by baud rate. Result is expressed in microseconds. This location contains the amount of time needed to send one bit of information.        Decimal >       665 - 666
        .label      RIDBE            = $29B  // RS-232: dynamic index to the end of the receive buffer. This pointer references a 256-byte buffer and is used to place data in that buffer. The receive buffer is a wraparound buffer. At any time, the starting and ending locations can be anywhere within the 256-byte buffer.        Decimal >       667
        .label      RIDBS            = $29C  // RS-232: dynamic index to the start of the receive buffer. This pointer is used to remove data from the receive buffer. If location 667 ($29B) and this location contain the same value, the buffer is empty. This byte is added to        Decimal >       668
        .label      RODBS            = $29D  // RS-232: dynamic index to the start of the transmit buffer. This pointer is used to put data into the buffer and to detect an empty or overflow of the transmit buffer.        Decimal >       669
        .label      RODBE            = $29E  // RS-232: dynamic index to the end of the transmit buffer.This pointer is used to remove data from the buffer. If 669 ($29D) and this location contain the same number, the buffer is empty.        Decimal >       670
        .label      IRQTMP           = $29F  // Temporary SAVE area for the normal IRQ vector during tape 1/O. The normal vector, held in location 788-789 ($314-315) for the IRQ routine at 60095 ($EABF), is stored here during tape reads and writes by the TAPE routine. It's restored by the TNIF routine. The table at 65009 ($FDF1) contains the three IRQ vectors for tape. The vectors are at locations 63886 ($F98E), 64523 ($FC0B), and 64680 ($FCA8).        Decimal >       671 - 672
        .label      USRVCTRS         = $2A1  // User indirect vectors or other storage area. Ninety-four bytes of memory are available in this area to the user for 47 user-program indirect link addresses or for any other purpose. This is an excellent area to store a short ML routine without having to alter BASIC'S pointers.        Decimal >       673 - 767
        .label      IERROR           = $300  // Vector to the routine to print a BASIC error message from a table. This vector points to the routine ERROR at location 50234 ($C43A).        Decimal >       768 - 769
        .label      IMAIN            = $302  // Vector to the BASIC main routine. Execute or store statement. The routine MAIN at location 50307 ($C483) is pointed to by this vector.        Decimal >       770 - 771
        .label      ICRNCH           = $304  // Vector to the BASIC tokenization routine. This vector points to the routine CRNCH at location 50556 ($C57C).        Decimal >       772 - 773
        .label      IQPLOP           = $306  // Vector to the BASIC routine that expands and prints tokens. The vector points to the QPLOP routine at address 50970 ($C71A).        Decimal >       774 - 775
        .label      IGONE            = $308  // Vector to the BASIC routine that executes the next BASIC token. This vector points to the routine GONE at location 51172 ($C7E4).        Decimal >       776 - 777            
        .label      IEVAL            = $30A  // Vector to the BASIC routine that evaluates a variable Vector to the routine EVAL at 52870 ($CE86).        Decimal >       778 - 779
        .label      SAREG            = $30C  // Register Save Area The BASIC SYS command uses this area to save and load the 6502 registers between SYS statements. For example, SYS 60074 loads the values stored in this area into the appropriate registers and then performs a jump to the target location. When the ML instructions issue an RTS (return), the routine that processes the SYS statement stores the returned registers here, and BASIC continues with its next statement.        Decimal >       780
        .label      SAVREGS          = $30C  // 6502 .A register        Decimal >       780 - 783
        .label      SXREG            = $30D  // 6502 .X register        Decimal >       781
        .label      SYREG            = $30E  // 6502 .Y register        Decimal >       782
        .label      SPREG            = $30F  // 6502 .P processor status register        Decimal >       783
        .label      PG3FREE          = $310  // Four bytes of unused page 3 space. On the Commodore 64, locations 785-786 are used for the USR jump vector described at location 1-2 ($1-2). Location 784 contains the JMP opcode. You should remember this when you're writing programs for both machines.        Decimal >       784 - 787
        .label      CINV             = $314  // Vector to the IRQ interrupt routine at 60095 ($EABF). This location is where you would put the address of your own ML IRQ routine or front-end to be executed every jiffy.        Decimal >       788 - 789
        .label      KVECTOKS         = $314  // Table of 16 Kernal indirect vectors. This location range contains a 32-byte table of the vectors that direct the processing to the appropriate Kernal routine.        Decimal >       788 - 819
        .label      CBINV            = $316  // Vector to the BREAK interrupt routine at 65234 ($FED2). 1 When the RUN/STOP and RESTORE keys are pressed simultaneously, or an ML BRK instruction ($00) is executed, this vector        Decimal >       790 - 791
        .label      NMINV            = $318  // Vector to the NMI interrupt routine at 65197 ($FEAD). The NMI (Non-Maskable Interrupt) can be caused by the RUN/STOP-RESTORE keys and VIA timer interrupts. Multiple NMI interrupts and IRQ interrupts can occur while the first NMI is being processed. This entry point skips the preceding SEI instruction that disables IRQ interrupts.        Decimal >       792 - 793 
        .label      IOPEN            = $31A  // Vector to the open logical file routine OPEN at 62474 ($F40A).        Decimal >       794 - 795
        .label      ICLOSE           = $31C  // Vector to the close logical file routine CLOSE at 62282 ($F34A).        Decimal >       796 - 797
        .label      ICHKIN           = $31E  // Vector to the open input channel routine CHKIN at 62151 ($F2C7).       Decimal >       798 - 799
        .label      ICKOUT           = $320  // Vector to the open output channel routine CHKOUT at 62217 ($F309).        Decimal >       800 - 801
        .label      ICLRCH           = $322  // Vector to the reset all channels routine CLRCHN at 62451 ($F3F3).        Decimal >       802 - 803
        .label      IBASIN           = $324  // Vector to the input from device routine CHRIN at 61966 ($F20E).        Decimal >       804 - 805
        .label      IBSOUT           = $326  // Vector to the output to device routine CHROUT at 62074 ($F27A).        Decimal >       806 - 807
        .label      ISTOP            = $328  // Vector to the test STOP key routine STOP at 63344 ($F770). This vector points to the address of the routine that tests the STOP key. The STOP key can be disabled by a POKE 808,100. This does not disable the RUN/STOP-RESTORE combination,        Decimal >       808 - 809
        .label      IGETIN           = $32A  // Vector to the get from keyboard routine GETIN at 61941 ($F1F5).        Decimal >       810 - 811
        .label      ICLALL           = $32C  // Vector to the abort all files routine CLALL at 62447 ($F3EF).        Decimal >       812 - 813
        .label      USRCMD           = $32E  // This location seems to be a holdover from earlier PET computers, when the built-in machine language monitor would JMP through this vector when it encountered a command it did not understand. A user vector can be placed here instead. This vector is initialized to serve as a vector to the BREAK interrupt routine BREAK at location 65234 ($FED2).        Decimal >       814 - 815
        .label      ILOAD            = $330  // Vector to the load from device routine LOAD at 62793 ($F549).      Decimal >       816 - 817
        .label      ISAVE            = $332  // Vector to the Kernal save to device routine SAVE at 63109 ($F685)        Decimal >       818 - 819
        .label      USRCMDS          = $334  // Four user vectors or eight bytes of other data may be stored here.        Decimal >       820 - 827
        .label      TBUFFR           = $33C  //         Decimal >       828 - 1019
        .label      TPHDRID          = $33C  // Tape header identifier byte (1-5). This I.D. is the first byte of the tape header, except for I.D. 2, which is in the first byte of every record. This accounts for the tape buffer consisting of 192 bytes, even though there are only 191 bytes of user data.        Decimal >       828
        .label      TPBLOCK          = $33D  // Starting address for tape LOAD. One technique that can be used for loading data from tape to any desired address is to change the pointer at 43-44 ($2B-2C) before issuing the LOAD of a relocatable BASIC program. See the append example at location 43-44 ($2B-2C).        Decimal >       829 - 1019
        .label      TPHBGN           = $33D  // Starting address for tape LOAD. One technique that can be used for loading data from tape to any desired address is to change the pointer at 43-44 ($2B-2C) before issuing the LOAD of a relocatable BASIC program. See the append example at location 43-44 ($2B-2C).       Decimal >       829 - 830
        .label      TPHEND           = $33F  // Ending address, plus one, of tape LOAD. See the explanation at location 829-830 ($33D-33E) for details of how to read and modify the tape header before it is acted upon by the LOAD routine. See location 174-175 ($AE-AF).        Decimal >       831 - 833
        .label      TPHNAME          = $341  // Filename of tape data. Padded with blanks, these 187 bytes hold the filename that is specified with SAVE, OPEN, or SETNAM. See the discussions at locations 183 ($B7) and 187 ($BB).        Decimal >       833 - 1019
        .label      TPHFREE          = $3FC  //         Decimal >       1020 - 1023
        .label      RAMBLK0          = $400  //         Decimal >       1024 - 4095
        .label      SCREENX          = $1000 //         Decimal >       4096
        .label      USRPGMOK         = $1000 // 3583 bytes of RAM for the BASIC program on an unexpanded VIC-20. On an unexpanded VIC-20, the BASIC program area starts here. Location 43-44 ($2B-2C) points to the beginning of this area.        Decimal >       4096 - 7679
        .label      USRPGM3K         = $1000 // Screen map RAM on VIC-20 with 8K or more expansion. Also called the video matrix, the screen map is managed by the Kernal screen editor using the table at 217 ($D9)         Decimal >       4096 - 4607
        .label      USRPGM8K         = $1200 //         Decimal >       4608 
        .label      SCREEN           = $1E00 // First 3583 bytes of BASIC area on an 8K plus expanded VIC-20. An 8K expanded VIC-20 starts BASIC at 4608 ($1200) and extends it to the end of expansion RAM, which can be as high as 32767 ($7FFF). Location 55 ($37) points to the end of expansion RAM.        Decimal >       7680 -8191 
        .label      RAMBLK1          = $2000 // 8K RAM expansion block 1.        Decimal >       8192 -16383
        .label      RAMBLK2          = $4000 // 8K RAM expansion block 2.        Decimal >       16384 -24575
        .label      RAMBLK3          = $6000 // 8K RAM expansion block 3.        Decimal >       24576 - 32767
        .label      CASEU            = $8000 // Uppercase and graphics nonreversed screen character map. This area consists of 1024 bytes describing the 128 uppercase and graphics character set when RVSOFF is selected and no SHIFT/Commodore key combination is in effect.        Decimal >       32768 - 33791
        .label      CASEURV          = $8400 // Reversed uppercase and graphics screen character map. This area contains 1024 bytes describing the 128 reversed uppercase and graphic character set when RVSON is selected and no SHIFT/Commodore key combination is in effect. The pixel maps are in the same order as the character pixel maps at 32768 ($8000,) but each bit is reversed to display the character in a dark on light back ground pattern.        Decimal >       33792 - 34815
        .label      CASEL            = $8800 // Lowercase and uppercase nonreversed screen character map. This section of 1024 bytes describes the 128 lowercase and uppercase character set when both the RVSOFF and the SHIFT/Commodore key combination are in effect.        Decimal >       34816 - 35839
        .label      CASELRV          = $8C00 // Reversed lowercase and uppercase screen character map. These 1024 bytes describe the 128 reversed lowercase and uppercase character set when the RVSON and SHIFT/Commodore key combination are in effect. The pixel maps are in the same order as the character pixel maps at 34816 ($8800), but each bit is reversed. (Previously on bits are instead set to 0, or off.)        Decimal >       35840 - 36863
    }
VIC: // Screen related settings 
    {   
        .label      VICCR0           = $9000 // Left edge of TV picture and interlace switch. Bit 7: Interlace scan bit. Default value: 0. When set to 1, this bit causes every other full sweep of the TV to be skipped.         Decimal >       36864
        .label      VICCR1           = $9001 // Bits 7-0: Vertical TV picture origin.        Decimal >       36865
        .label      VICCR2           = $9002 // Number of columns displayed, part of screen map address.        Decimal >       36866
        .label      VICCR3           = $9003 // Number of character lines displayed, part of raster location.        Decimal >       36867
        .label      VICCR4           = $9004 // Raster beam location bits 8-1. Bits 7-0: When combined with the high order bit of location 36867 ($9003) as the low order bit, this value tracks the location of the electron beam as it refreshes the TV picture. If you were to use only this location to reference the raster location, you would only sense every other TV line. This raster location is used by the light pen sensing function of the VIC chip, and is latched into locations 36870 ($9006) and 36871 ($9007).        Decimal >       36868
        .label      VICCR5           = $9005 // Screen map and character map addresses.        Decimal >       36869
        .label      VICCR6           = $9006 // Light pen horizontal screen location.        Decimal >       36870
        .label      VICCR7           = $9007 // Light pen vertical screen location.        Decimal >       36871
        .label      VICCR8           = $9008 // Potentiometer X/Paddle X value.        Decimal >       36872
        .label      VICCR9           = $9009 // Potentiometer Y/Paddle Y value.        Decimal >       36873
        .label      VICCRA           = $900A // Relative frequency of sound oscillator 1 (bass).        Decimal >       36874
        .label      VICCRB           = $900B // Relative frequency of sound oscillator 2 (alto).        Decimal >       36875
        .label      VICCRC           = $900C // Relative frequency of sound oscillator 3 (soprano).        Decimal >       36876
        .label      VICCRD           = $900D // Relative frequency of sound oscillator 4 (noise).        Decimal >       36877
        .label      VICCRE           = $900E // Sound volume and auxiliary color.        Decimal >       36878
        .label      VICCRF           = $900F // Background color, border color, inverse color switch.        Decimal >       36879
    }
DISPLAY: // Screen/colour locations Names ending X are 8K+ Expanded Vic20
    {
        .label      SCREENX          = $1000 // Screen map RAM on VIC-20 with 8K or more expansion. Also called the video matrix, the screen map is managed by the Keral screen editor using the table at 217 ($D9).
        .label      SCREEN           = $1E00 // Screen map RAM on VIC-20 with only 3K expansion.
        .label      COLORMAPX        = $9400 // Screen color map (8K+ expanded VIC-20). Bits 4-7 = not there Bit 3 = multicolor if set to 1 or normal if set to 0 Bits 0-2 = foreground color value 0-7
        .label      COLORMAP         = $9600 // Screen color map (unexpanded or 3K expanded VIC-20). Please see location 37888-38399 ($9400-$95FF) for a complete description of the use of both VIC-20 color maps.

    }    
VIA:   // I/O (Vircitile Interface Adaptor) Settings and Registers 
    {   
        .label      VIA1PB           = $9110 // Port B I/O register.        Decimal >       37136
        .label      VIA1PA1          = $9111 // Port A I/O register.        Decimal >       37137
        .label      VIA1DDRB         = $9112 // Data direction register for port 6.        Decimal >       37138
        .label      VIA1DDRA         = $9113 // Data direction register for port A.        Decimal >       37139
        .label      VIA1T1CL         = $9114 // Timer 1 least significant byte (LSB) of count.        Decimal >       37140
        .label      VIA1T1CH         = $9115 // Timer 1 most significant byte (MSB) of count.        Decimal >       37141
        .label      VIA1T1LL         = $9116 // Timer 1 low order (LSB) latch byte.        Decimal >       37142
        .label      VIA1T1LH         = $9117 // Timer 1 high order (MSB) latch byte.        Decimal >       37143
        .label      VIA1T2CL         = $9118 // Timer 2 low order (LSB) counter and LSB latch.        Decimal >       37144
        .label      VIA1T2CH         = $9119 // Timer 2 high order (MSB) counter and MSB latch.        Decimal >       37145
        .label      VIA1SR           = $911A // Shift register for parallel/serial conversion.        Decimal >       37146
        .label      VIA1ACR          = $911B // Auxiliary control register.        Decimal >       37147
        .label      VIA1PCR          = $911C // Peripheral control register for handshaking.        Decimal >       37148
        .label      VIA1IFR          = $911D // Interrupt flag register (IFR).        Decimal >       37149
        .label      VIA1IER          = $911E // Interrupt enable register (IER).        Decimal >       37150
        .label      VIA1PA2          = $911F // This is a mirror of port A I/O register at location 37137 ($9111), except that the CAl and CA2 control lines are not affected when using this port A reflection. This is described at location 37148($911C).        Decimal >       37151
        .label      VIA2PB           = $9120 // Port B I/O register.        Decimal >       37152
        .label      VIA2PA1          = $9121 // Port A I/O register.        Decimal >       37153
        .label      VIA2DDRB         = $9122 // Data direction register for port B.        Decimal >       37154
        .label      VIA2DDRA         = $9123 // Data direction register for port A.        Decimal >       37155
        .label      VIA2T1CL         = $9124 // Timer 1 least significant byte (LSB) of count.        Decimal >       37156
        .label      VIA2T1CH         = $9125 // Timer 1 most significant byte (MSB) of count.        Decimal >       37157
        .label      VIA2T1LL         = $9126 // Timer 1 low order (LSB) latch byte.        Decimal >       37158
        .label      VIA2T1HL         = $9127 // Timer 1 high order (MSB) latch byte.        Decimal >       37159
        .label      VIA2T2CL         = $9128 // Timer 2 low order (LSB) counter and LSB latch.        Decimal >       37160
        .label      VIA2T2CH         = $9129 // Timer 2 high order (MSB) counter and MSB latch.        Decimal >       37161
        .label      VIA2SR           = $912A // Shift register for parallel/serial conversion.        Decimal >       37162
        .label      VIA2ACR          = $912B // Auxiliary control register.        Decimal >       37163
        .label      VIA2PCR          = $912C // Peripheral control register for handshaking.        Decimal >       37164
        .label      VIA2IFR          = $912D // Interrupt flag register.        Decimal >       37165
        .label      VIA2IER          = $912E // Interrupt enable register (IER).        Decimal >       37166
        .label      VIA2PA2          = $912F // This register is a mirror of port A I/O register at 37153 ($9121), except that the CAl and CA2 control lines are not affected when you use this reflection.        Decimal >       37167
    }       

BASIC: // Basic Pointers routines and vector tables     
    {       
        .label      COLDST           = $C000 // Vector to the routine for the cold start of BASIC, 58232 ($E378).        Decimal >       49152
        .label      WARMST           = $C002 // Vector to the routine to the warm start of BASIC, 58471 ($E467).       Decimal >       49154
        .label      CBMBASIC         = $C004 // CBMBASIC characters.        Decimal >       49156
        .label      STMDSP           = $C00C // Keyword dispatch vector table, in token order.        Decimal >       49164
/*        
        BASIC            Vector at          Routine  
        Keyword           Dec Hex           Dec Hex 

        END             49164 $C00C       51249 $C831  
        FOR             49166 $C00E       51010 $C742  
        NEXT            49168 $C010       52510 $CD1E  
        DATA            49170 $C012       51448 $C8F8  
        INPUT#          49172 $C014       52133 $CBA5  
        INPUT           49174 $C016       52159 $CBBF  
        DIM             49176 $C018       53377 $D081  
        READ            49178 $C01A       52230 $CC06  
        LET             49180 $C01C       51621 $C9A5  
        GOTO            49182 $C01E       51360 $C8A0  
        RUN             49184 $C020       51313 $C871  
        IF              49186 $C022       51496 $C928  
        RESTORE         49188 $C024       51229 $C81D  
        GOSUB           49190 $C026       51331 $C883  
        RETURN          49192 $C028       51410 $C8D2  
        REM             49194 $C02A       51515 $C93B  
        STOP            49196 $C02C       51247 $C82F  
        ON              49198 $C02E       51531 $C94B  
        WAIT            49200 $C030       55341 $D82D  
        LOAD            49202 $C032       57701 $E165  
        SAVE            49204 $C034       57683 $E153  
        VERIFY          49206 $C036       57698 $E162  
        DEF             49208 $C038       54195 $D3B3  
        POKE            49210 $C03A       55332 $D824  
        PRINT#          49212 $C03C       51840 $CA80            
        PRINT           49214 $C03E       51872 $CAA0        
        CONT            49216 $C040       51287 $C857        
        LIST            49218 $C042       50844 $C69C        
        CLR             49220 $C044       50782 $C65E        
        CMD             49222 $C046       51846 $CA86        
        SYS             49224 $C048       57639 $E127        
        OPEN            49226 $C04A       57787 $E1BB        
        CLOSE           49228 $C04C       57796 $E1C4        
        GET             49230 $C04E       52091 $CB7B        
        NEW             49232 $C050       50754 $C642        

The following keywords follow the dispatchable keywords in
the keyword table at 49310 ($C09E). They are not in the keyword
dispatch vector table since they never begin a BASIC statement.
FN
NOT
SPC
STEP
TAB
THEN
TO        
*/       
        .label      FUNDSP           = $C052 // Function dispatch vector table, in token order.        Decimal >       49234
/*
            BASIC        Vector at            Routine
            Function      Dec Hex             Dec Hex

            SGN         49234 $C052         56377 $DC39
            INT         49236 $C054         56524 $DCCC
            ABS         49238 $C056         56408 $DC58
            USR         49240 $C058         00000 $0000
            FRE         49242 $C05A         54141 $D37D
            POS         49244 $C05C         54174 $D39E
            SQR         49246 $C05E         57201 $DF71
            RND         49248 $C060         57492 $E094
            LOG         49250 $C062         55786 $D9EA
            EXP         49252 $C064         57325 $DFED
            COS         49254 $C066         57953 $E261
            SIN         49256 $C068         57960 $E268
            TAN         49258 $C06A         58033 $E2B1
            ATN         49260 $C06C         58123 $E30B
            PEEK        49262 $C06E         55309 $D80D
            LEN         49264 $C060         55164 $D77C
            STR         49266 $C072         54373 $D465
            VAL         49268 $C074         55213 $D7AD
            ASC         49270 $C076         55179 $D78B
            CHR         49272 $C078         55020 $D6EC
            LEFT        49274 $C07A         55040 $D700
            RIGHT       49276 $C07C         55084 $D72C
            MID         49278 $C07E         55095 $D737
*/
        .label      OPTAB            = $C080 // Math operation dispatch vector table, in token order.        Decimal >       49280
/*

BASIC           Precedence:         Vector at       Routine
Operation       largest first        Dec Hex        Dec Hex

+                 121 $79          49280 $C080    55402 $D86A
-                 121 $79          49283 $C083    55379 $D853
*                 123 $7B          49286 $C086    55851 $DA2B
/                 123 $7B          49289 $C089    56082 $DB12
uparrow           127 $7F          49292 $C08C    57211 $DF7B
AND               80 $50           49295 $C08F    53225 $CFE9
OR                70 $46           49298 $C092    53222 $CFE6
mondatic-         125 $7D          49301 $C095    57268 $DFB4
NOT               90$5A            49304 $C098    52948 $CED4
<=>               100 $64          49307 $C09B    53270 $D016

*/


        .label      RESLST           = $C09E // BASIC keyword table in token number order. The complete vocabulary of BASIC keywords, functions, and math operators, minus the PI symbol, are stored here in token number order. Each word ends with the high order bit on, a value of 128 ($80) added to the value for the ASCII character. The table is ended by a byte containing zero.        Decimal >       49310
        .label      ERRTAB           = $C19E // Table of BASIC error messages.        Decimal >       49566
        /*

Dec     Hex     Error Message

1       $01     TOO MANY FILES
2       $02     FILE OPEN
3       $03     FILE NOT OPEN
1       $04     FILE NOT FOUND
5       $05     DEVICE NOT PRESENT
6       $06     NOT INPUT FILE
7       $07     NOT OUTPUT FILE
8       $08     MISSING filename
9       $09     ILLEGAL DEVICE NUMBER
10      $0A     NEXT WITHOUT FOR
11      $0B     SYNTAX
12      $0C     RETURN WITHOUT GOSUB
13      $0D     OUT OF DATA
14      $0E     ILLEGAL QUANTITY
15      $0F     OVERFLOW
16      $10     OUT OF MEMORY
17      $11     UNDEF'D STATEMENT
18      $12     BAD SUBSCRIPT
19      $13     REDIM'D ARRAY
20      $14     DIVISION BY ZERO
21      $15     ILLEGAL DIRECT
22      $16     TYPE MISMATCH
23      $17     STRING TOO LONG
24      $18     FILE DATA
25      $19     FORMULA TOO COMPLEX
26      $1A     CAN'T CONTINUE
27      $1B     UNDEF'D FUNCTION
28      $1C     VERIFY
29      $1D     LOAD
30      $1E     BREAK (located in 50020 $C364 table)
        */
        .label      BMSGS            = $C328 // BASIC error message table vectors.         Decimal >       49960
        .label      MISCMSG          = $C364 // Miscellaneous messages.        Decimal >       50020
        .label      SCNSTK           = $C38A // Find FOR and GOSUB entries on the stack.        Decimal >       50058
        .label      MAKSPC           = $C3B8 // Open space in memory for a new BASIC line or variable.        Decimal >       50104
        .label      MOVEBL           = $C3BF // Move a block of memory.        Decimal >       50111
        .label      STKSPC           = $C3FB // Check stack requested space available.        Decimal >       50171
        .label      RAMSPC           = $C408 // Check that requested space in dynamic area is available.        Decimal >       50184
        .label      MEMERR           = $C435 // Set OUT OF MEMORY error message code.       Decimal >       50229
        .label      ERROR            = $C437 // BASIC error message routine.        Decimal >       50231
        .label      PRDY             = $C469 // Display ERROR, or another message pointed to.        Decimal >       50281
        .label      READY            = $C474 // Display READY, message.        Decimal >       50292
        .label      MAIN             = $C480 // Main BASIC loop, receive and execute or store BASIC line.        Decimal >       50304
        .label      NEWLIN           = $C49C // Store/replace a BASIC program line.        Decimal >       50332
        .label      LNKPRG           = $C533 // Rechain BASIC program lines.        Decimal >       50483
        .label      GETLIN           = $C560 // Receive input from device and fill the BASIC text buffer.        Decimal >       50528
        .label      CRNCH            = $C579 // Tokenize the BASIC line in BASIC text buffer.        Decimal >       50553
        .label      FINLIN           = $C613 // Find the BASIC line from its line number.        Decimal >       50707
        .label      NEW              = $C642 // BASIC NEW.        Decimal >       50754
        .label      CLR              = $C65E // BASIC CLR.       Decimal >       50782
        .label      STXTPT           = $C68E // Back up TXTPTR to the start of the program.        Decimal >       50830
        .label      LIST             = $C69C // BASIC LIST.        Decimal >       50844
        .label      QPLOP            = $C71A // List detokenized BASIC keywords.        Decimal >       50970
        .label      FOR              = $C742 // BASIC FOR.        Decimal >       51010
        .label      NEWSTT           = $C7AE // Finds (for execution) the next BASIC statement.        Decimal >       51118
        .label      GONE             = $C7E4 // Execute the current BASIC statement.        Decimal >       51172
        .label      RESTORE          = $C81D // BASIC RESTORE.        Decimal >       51229
        .label      TSTSTOP          = $C82C // Test for STOP key.        Decimal >       51244
        .label      BSTOP            = $C82F // BASIC STOP.        Decimal >       51247
        .label      END              = $C831 // BASIC END.        Decimal >       51249
        .label      CONT             = $C857 // BASIC CONT.        Decimal >       51287
        .label      RUN              = $C871 // BASIC RUN.        Decimal >       51313
        .label      GOSUB            = $C883 // BASIC GOSUB.        Decimal >       51331
        .label      GOTO             = $C8A0 // BASIC GOTO.        Decimal >       51360
        .label      RETURN           = $C8D2 // BASIC RETURN.        Decimal >       51410
        .label      SKIPST           = $C8F8 // BASIC DATA.        Decimal >       51448
        .label      BUMPTP           = $C8FB // Increment TXTPTR by amount in .Y.        Decimal >       51451
        .label      FIND2            = $C906 // Scan the BASIC text buffer at 512 ($200) for delimiters.        Decimal >       51462
        .label      IF               = $C928 // BASIC IF.        Decimal >       51496
        .label      REM              = $C93B // BASIC REM.        Decimal >       51515
        .label      ON               = $C94B // BASIC ON.        Decimal >       51531
        .label      DECBIN           = $C96B // Convert decimal line number to LSB/MSB format.        Decimal >       51563
        .label      LET              = $C9A5 // BASIC LET.        Decimal >       51621
        .label      LET2             = $C9C2 // LET: Assign integer variable.        Decimal >       51650
        .label      LET5             = $C9DA // LET: Assign TI$.        Decimal >       51674
        .label      LET9             = $CA2C // LET: Assign string variable.        Decimal >       51756
        .label      PRINTN           = $CA80 // BASIC PRINT*.        Decimal >       51840
        .label      CMD              = $CA86 // BASIC CMD.        Decimal >       51846
        .label      PRT1             = $CA9A // The instructions from here to location 51871 ($CA9F) are part of the PRINT routine.        Decimal >       51866
        .label      PRINT            = $CAA0 // BASIC PRINT.        Decimal >       51872
        .label      PRT6             = $CAE8 // Part of PRINT, this tabs to the correct column for comma delimiter.        Decimal >       51944
        .label      PRT7             = $CAF8 // BASIC TAB, BASIC SPC.        Decimal >       51960
        .label      PRTSTR           = $CB1E // Another part of the PRINT routine, this prints a string ended by a carriage return or when the length is decremented to 0.        Decimal >       51998
        .label      PRTOS            = $CB3B // This section of the PRINT routine prints format characters of space, cursor right, or question marks. The latter is for the INPUT routine.        Decimal >       52027
        .label      IGRERR           = $CB4D // Error message formatting routine for BASIC keywords GET, INPUT, and READ.        Decimal >       52045
        .label      GET              = $CB7B // BASIC GET.        Decimal >       52091
        .label      INPUTN           = $CBA5 // BASIC INPUT#.        Decimal >       52133
        .label      INPUT            = $CBBF // BASIC INPUT.        Decimal >       52159
        .label      READ             = $CC06 // This routine locates the next DATA item for READ, scans the BASIC text buffer with CHRGET and modifications to TXTPTR, and assigns incoming information to numeric or string variables, producing error messages as needed.        Decimal >       52230
        .label      EXTRA            = $CCFC //  INPUT error messages.       Decimal >       52476
        .label      NEXT             = $CD1E // BASIC NEXT.        Decimal >       52510
        .label      TYPCHK           = $CD8A // Variable type checking.        Decimal >       52600
        .label      FRMEVL           = $CD9E // Formula/expression evaluation.        Decimal >       52638
        .label      EVAL             = $CE83 // Evaluate a single term of an expression.        Decimal >       52867
        .label      PIVAL            = $CEA8 // The floating point number PI=$82 $49 $0F $DA $A1.        Decimal >       52904
        .label      PAREXP           = $CEF1 // Factoring is continued.        Decimal >       52977
        .label      RPACHK           = $CEF7 // BASIC NOT.        Decimal >       52983
        .label      LPACHK           = $CEFA // Evaluation within parentheses is performed.        Decimal >       52986
        .label      COMCHK           = $CEFD // Syntax check for ')'        Decimal >       52989
        .label      SYNCHR           = $CEFF // Syntax check for '('        Decimal >       52991
        .label      SYNERR           = $CF08 // Syntax check for  ',        Decimal >       53000
        .label      FACT10           = $CF0D // Syntax check for a specific character in .A from CHRGET.        Decimal >       53005
        .label      VARRANGE         = $CF14 // Cause SYNTAX ERROR message via jump to ERROR ($C437).        Decimal >       53012
        .label      FACT12           = $CF28 // Set up index for - (monadic minus).        Decimal >       53032
        .label      FACT17           = $CFA7 // Check range of variable ?        Decimal >       53159
        .label      ORR              = $CFE6 // Obtain variable name and type from EVLVAR ($D08B), check for null string, and handle TI$, TI, and ST references.        Decimal >       53222
        .label      ANDD             = $CFE9 // Invoke function.        Decimal >       53225
        .label      COMPAR           = $D016 // BASIC OR.        Decimal >       53270
        .label      CMPST            = $D02E // BASIC AND.        Decimal >       53294
        .label      DIM              = $D081 // Compare numerics or strings.        Decimal >       53377
        .label      EVLVAR           = $D08B // Compare strings.        Decimal >       53387
        .label      FNDVAR           = $D0E7 // BASIC DIM.        Decimal >       53479
        .label      CHRTST           = $D113 // Locate or create variable.        Decimal >       53523
        .label      MAKVAR           = $D11D // Locate the variable.        Decimal >       53533
        .label      RETVP            = $D185 // Check if ASCII character is alphabetic.        Decimal >       53637
        .label      ARYHED           = $D194 //  Create new variable.       Decimal >       53652
        .label      MAXINT           = $D1A5 // Return the address of the found or created variable.        Decimal >       53669
        .label      INTIDX           = $D1AA // Calculate the length of an array descriptor.        Decimal >       53674
        .label      GETSUB           = $D1B2 // Maximum integer value of 32768 in floating point.        Decimal >       53682
        .label      MAKINT           = $D1BF // Convert floating point to two-byte fixed point in .A and .Y.        Decimal >       53695
        .label      ARY              = $D1D1 // Convert an expression to integer number.        Decimal >       53713
        .label      BADSUB           = $D245 // Convert floating point to signed integer.        Decimal >       53829
        .label      ILQUAN           = $D248 // Display BAD SUBSCRIPT message.        Decimal >       53832
        .label      ARY2             = $D24D // Display ILLEGAL QUANTITY message.        Decimal >       53837
        .label      ARY6             = $D261 // Create an array.        Decimal >       53857
        .label      ARY14            = $D2EA // Locate a particular array element.        Decimal >       53994
        .label      M16              = $D34C // Compute multidimension array size.        Decimal >       54092
        .label      FRE              = $D37D // BASIC FRE.        Decimal >       54141
        .label      MAKFP            = $D391 // Convert .Y (LSB) and .A (MSB) integer to floating point.        Decimal >       54161
        .label      POS              = $D39E // BASIC POS.        Decimal >       54174
        .label      NODIRM           = $D3A6 // Check if a statement is entered in direct mode.        Decimal >       54182
        .label      UNDEF            = $D3AE // Issue an UNDEF'D FUNCTION message for EVALFN ($D3F4).        Decimal >       54190
        .label      DEF              = $D3B3 // BASIC DEF.        Decimal >       54195
        .label      FN               = $D3E1 // Check DEF FN and FN syntax.        Decimal >       54241
        .label      EVALFN           = $D3F4 // BASIC FN.        Decimal >       54260
        .label      EVFN3            = $D44F // Store DEF FN values into the function descriptor from stack.        Decimal >       54351
        .label      STR              = $D465 // BASIC STR$.        Decimal >       54373
        .label      ALC1             = $D475 // Calculate new string length and vector.        Decimal >       54389
        .label      MAKSTR           = $D487 // Scan and set up string.        Decimal >       54407
        .label      ALCSPC           = $D4F4 // Allocate memory space for a string.        Decimal >       54516
        .label      GRBCOL           = $D526 // Garbage collection.        Decimal >       54566
        .label      GCOL13           = $D5BD // Check if most eligible string to collect.        Decimal >       54717
        .label      COLECT           = $D606 // Garbage collect a string.        Decimal >       54790
        .label      ADDSTR           = $D63D // BASIC +, concatenate string.        Decimal >       54845
        .label      XFERSTR          = $D67A // Move string in memory.        Decimal >       54906
        .label      DELST            = $D6A3 // Discard a temporary string.        Decimal >       54947
        .label      DELTSD           = $D6DB // Clean up the temporary string descriptor stack.        Decimal >       55003
        .label      CHR              = $D6EC // BASIC CHR$.        Decimal >       55020
        .label      LEFT             = $D700 // BASIC LEFT$.        Decimal >       55040
        .label      RIGHT            = $D72C // BASIC RIGHT$.        Decimal >       55084
        .label      MID              = $D737 // BASIC MID$.        Decimal >       55095
        .label      FINLMR           = $D761 // Obtain string parameters for LEFT$, MID$, and RIGHT$.        Decimal >       55137
        .label      LEN              = $D77C // BASIC LEN$.        Decimal >       55164
        .label      GSINFO           = $D782 // Get string information.        Decimal >       55170
        .label      ASC              = $D78B // BASIC ASC.        Decimal >       55179
        .label      GETBYT           = $D79B // Obtain number 0-255.        Decimal >       55195
        .label      VAL              = $D7AD // BASIC VAL.        Decimal >       55213
        .label      GETAD            = $D7EB // Get two parameters for POKE and WAIT.        Decimal >       55275
        .label      MAKADR           = $D7F7 // Convert floating point FAC to two-byte positive integer.        Decimal >       55287
        .label      PEEK             = $D80D // BASIC PEEK.        Decimal >       55309
        .label      POKE             = $D824 // BASIC POKE.        Decimal >       55332
        .label      WAIT             = $D82D // BASIC WAIT.         Decimal >       55341
        .label      ADD05            + $D849 // Round FAC by .5.
        .label      LAMIN            = $D850 // Subtract memory contents from FAC.       Decimal >       55376
        .label      SUB              = $D853 // BASIC - (subtract).        Decimal >       55379
        .label      PLUS1            = $D862 // Perform exponent preshifting (?) and fall through.        Decimal >       55394
        .label      LAPLUS           = $D867 // Add memory contents to FAC.        Decimal >       55399
        .label      PLUS             = $D86A // BASIC + (add).        Decimal >       55402
        .label      PLUS6            = $D8A7 // Make the result negative if a borrow was done.        Decimal >       55463
        .label      ZERFAC           = $D8F7 // Zero out FAC and make sign positive since result was zero.        Decimal >       55543
        .label      NORMLZ           = $D8FE // Renormalize the FAC result.        Decimal >       55550
        .label      COMFAC           = $D947 // Complement FAC entirely.        Decimal >       55623
        .label      OVERFL           = $D97E // Issue OVERFLOW message and exit.        Decimal >       55678
        .label      ASRRES           = $D983 // Perform exponent preshifting (?) and fall through.        Decimal >       55683
        .label      FPC1             = $D9BC // Constant of one for a floating point accumulator.        Decimal >       55740
        .label      LOGCON           = $D9C1 // Constants for LOG function.      Decimal >       55745
        .label      LOG              = $D9EA // BASIC LOG.        Decimal >       55786
        .label      TIMES            = $DA28 // BASIC * multiplies FAC2 by FAC, leaving the result in FAC.        Decimal >       55848
        .label      TIMES3           = $DA59 // Multiply-a-byte subroutine.        Decimal >       55897
        .label      LODARG           = $DA8C //         Decimal >       55948
        .label      MULDIV           = $DAB7 //         Decimal >       55991
        .label      MULTEN           = $DAE2 //         Decimal >       56034
        .label      FPCTEN           = $DAF9 //         Decimal >       56057
        .label      DIVTEN           = $DAFE //         Decimal >       56062
        .label      LADIV            = $DB0F //         Decimal >       56079
        .label      DIVIDE           = $DB12 //         Decimal >       56082
        .label      LODFAC           = $DBA2 //         Decimal >       56226
        .label      FACTF2           = $DBC7 //         Decimal >       56263
        .label      FACTF1           = $DBCA //         Decimal >       56266
        .label      FACTFP           = $DBD0 //         Decimal >       56272
        .label      STORFAC          = $DBD4 //         Decimal >       56276
        .label      ATOF             = $DBFC //         Decimal >       56316
        .label      RFTOA            = $DC0C //         Decimal >       56332
        .label      FTOA             = $DC0F //         Decimal >       56335
        .label      ROUND            = $DC1B //         Decimal >       56347
        .label      SGNFAC           = $DC2B //         Decimal >       56363
        .label      SGN              = $DC39 //         Decimal >       56377
        .label      INTFP            = $DC3C //         Decimal >       56380
        .label      INTFP1           = $DC44 //         Decimal >       56388
        .label      ABS              = $DC58 //         Decimal >       56408
        .label      CMPFAC           = $DC5B //         Decimal >       56411
        .label      FPINT            = $DC9B //         Decimal >       56475
        .label      INT              = $DCCC //         Decimal >       56524
        .label      FILFAC           = $DCE9 //         Decimal >       56553
        .label      ASCFLT           = $DCF3 //         Decimal >       56563
        .label      ASC18            = $DD7E //         Decimal >       56702
        .label      FPC12            = $DDB3 //         Decimal >       56755
        .label      PRTIN            = $DDC2 //         Decimal >       56770
        .label      PRTFIX           = $DDCD //         Decimal >       56781
        .label      FLTASC           = $DDDD //         Decimal >       56797
        .label      FLP05            = $DF11 //         Decimal >       57105
        .label      FLTCON           = $DF16 //         Decimal >       57110
        .label      HMSCON           = $DF3A //         Decimal >       57146
        .label      SQR              = $DF71 //         Decimal >       57201
        .label      EXPONT           = $DF7B //         Decimal >       57211
        .label      NEGFAC           = $DFB4 //         Decimal >       57268
        .label      EXPCON           = $DFBF //         Decimal >       57279
        .label      EXP              = $DFED //         Decimal >       57325
        .label      SEREVL           = $E040 //         Decimal >       57408
        .label      SER2             = $E056 //         Decimal >       57430
        .label      RNDX             = $E08A //         Decimal >       57482
        .label      RND              = $E094 //         Decimal >       57492
        .label      PATCHBAS         = $E0F6 //         Decimal >       57590
        .label      SYSTEM           = $E127 //         Decimal >       57639
        .label      BSAVE            = $E153 //         Decimal >       57683
        .label      BVERIF           = $E162 //         Decimal >       57698
        .label      BLOAD            = $E165 //         Decimal >       57701
        .label      FOPEN            = $E1BB //         Decimal >       57787
        .label      FCLOSE           = $E1C4 //         Decimal >       57796
        .label      PARSL            = $E1D1 //         Decimal >       57809
        .label      IFCHRG           = $E203 //         Decimal >       57859
        .label      SKPCOM           = $E20B //         Decimal >       57867
        .label      CHRERR           = $E20E //         Decimal >       57870
        .label      PAROC            = $E216 //         Decimal >       57878
        .label      COS              = $E261 //         Decimal >       57953
        .label      SIN              = $E268 //         Decimal >       57960
        .label      TAN              = $E2B1 //         Decimal >       58033
        .label      FPC20            = $E2DD //         Decimal >       58077
        .label      ATN              = $E30B //         Decimal >       58123
        .label      ATNCON           = $E33B //         Decimal >       58171
        .label      COLDBA           = $E378 //         Decimal >       58232
        .label      CGIMAG           = $E387 //         Decimal >       58247
        .label      INITBA           = $E34A //         Decimal >       58276
        .label      FREMSG           = $E404 //         Decimal >       58372
        .label      CBMMSG           = $E429 //         Decimal >       58409
        .label      BASVCTRS         = $E44F //         Decimal >       58447
        .label      INITVCTRS        = $E45B //         Decimal >       58459
        .label      WARMBAS          = $E467 //         Decimal >       58471
        .label      PATCHER          = $E476 //         Decimal >       58486
    }       
KERNAL: //Kernal Pointers and routines    
    {       
        .label      SEROUT1          = $E4A0 //         Decimal >       58528
        .label      SEROUTO          = $E4A9 //         Decimal >       58537
        .label      SERGET           = $E4B2 //         Decimal >       58546
        .label      PATCHES          = $E4BC //         Decimal >       58556
        .label      IOBASE           = $E500 //         Decimal >       58624
        .label      SCRN             = $E505 //         Decimal >       58629
        .label      PLOT             = $E50A //         Decimal >       58634
        .label      INITSK           = $E518 //         Decimal >       58648
        .label      CLSR             = $E55F //         Decimal >       58719
        .label      HOME             = $E581 //         Decimal >       58753
        .label      SETSLINK         = $E587 //         Decimal >       58759
        .label      UNUSDNMI         = $E5B5 //         Decimal >       58805
        .label      SETIODEF         = $E5BB //         Decimal >       58811
        .label      MTVIC            = $E5C3 //         Decimal >       58819
        .label      LP2              = $E5CF //         Decimal >       58831
        .label      GETQUE           = $E5E5 //         Decimal >       58853
        .label      GET2RTN          = $E619 //         Decimal >       58905
        .label      GETSCRN          = $E64F //         Decimal >       58959
        .label      QUOTECK          = $E6B8 //         Decimal >       59064
        .label      SETCHAR          = $E6C5 //         Decimal >       59077
        .label      SCROLL           = $E6EA //         Decimal >       59114
        .label      RETREAT          = $E72D //         Decimal >       59181
        .label      SCRNOUT          = $E742 //         Decimal >       59202
        .label      NXTLINE          = $E8C3 //         Decimal >       59587
        .label      RTRN             = $E8D8 //         Decimal >       59608
        .label      BACKUP           = $E8E8 //         Decimal >       59624
        .label      FORWARD          = $E8FA //         Decimal >       59642
        .label      COLORSET         = $E912 //         Decimal >       59666
        .label      COLORTBL         = $E921 //         Decimal >       59681
        .label      CNVRTCD          = $E929 //         Decimal >       59689
        .label      SCRL             = $E975 //         Decimal >       59765
        .label      OPENLIN          = $E9EE //         Decimal >       59886
        .label      MOVLINE          = $EA56 //         Decimal >       59990
        .label      SETADDR          = $EA6E //         Decimal >       60014
        .label      LINPTR           = $EA7E //         Decimal >       60030
        .label      CLRALINE         = $EA8D //         Decimal >       60045
        .label      SYNPRT           = $EAA1 //         Decimal >       60065
        .label      PUTSCRN          = $EAAA //         Decimal >       60074
        .label      COLORSYN         = $EAB2 //         Decimal >       60082
        .label      IRQ              = $EABF //         Decimal >       60095
        .label      SCNKEY           = $EB1E //         Decimal >       60190
        .label      SETKEYS          = $EBDC //         Decimal >       60380
        .label      KEYVCTRS         = $EC46 //         Decimal >       60486
        .label      NORMKEYS         = $EC5E //         Decimal >       60510
        .label      SHFTKEYS         = $EC9F //         Decimal >       60575
        .label      LOGOKEYS         = $ECE0 //         Decimal >       60640
        .label      CHARSET          = $ED21 //         Decimal >       60705
        .label      GRAPHMODE        = $ED30 //         Decimal >       60720
        .label      WRAPLINE         = $ED5B //         Decimal >       60763
        .label      WHATKEYS         = $ED69 //         Decimal >       60777
        .label      CTRLKEYS         = $EDA3 //         Decimal >       60835
        .label      VICINIT          = $EDE4 //         Decimal >       60900
        .label      RUNTB            = $EDF4 //         Decimal >       60916
        .label      LDTB2            = $EDFD //         Decimal >       60925
        .label      TALK             = $EE14 //         Decimal >       60948
        .label      LISTEN           = $EE17 //         Decimal >       60951
        .label      LIST1            = $EE1C //         Decimal >       60956
        .label      SRSEND           = $EE49 //         Decimal >       61001
        .label      SRBAD            = $EEB4 //         Decimal >       61108
        .label      SECOND           = $EEC0 //         Decimal >       61120
        .label      SCATN            = $EEC5 //         Decimal >       61125
        .label      TKSA             = $EECE //         Decimal >       61134
        .label      CIOUT            = $EEE4 //         Decimal >       61156
        .label      UNTLK            = $EEF6 //         Decimal >       61174
        .label      UNLSN            = $EF04 //         Decimal >       61188
        .label      ACPTR            = $EF19 //         Decimal >       61209
        .label      SRCLKHI          = $EF84 //         Decimal >       61316
        .label      SRCLKLO          = $EF8D //         Decimal >       61325
        .label      WAITABIT         = $EF96 //         Decimal >       61334
        .label      RSNXTBIT         = $EFA3 //         Decimal >       61347
        .label      RSPRTY           = $EFBF //         Decimal >       61375
        .label      RSSTOPS          = $EFE8 //         Decimal >       61416
        .label      RSNXTBYT         = $EFEE //         Decimal >       61422
        .label      RSMISSNG         = $F016 //         Decimal >       61462
        .label      RSCPTBIT         = $F027 //         Decimal >       61479
        .label      RSINBIT          = $F036 //         Decimal >       61494
        .label      RSSTPBIT         = $F04B //         Decimal >       61515
        .label      RSPREPIN         = $F05B //         Decimal >       61531
        .label      RSSTRBIT         = $F068 //         Decimal >       61544
        .label      RSINBYTE         = $F06F //         Decimal >       61551
        .label      RSINPRTY         = $F08B //         Decimal >       61579
        .label      RSPRTYER         = $F09D //         Decimal >       61597
        .label      RSOVERUN         = $F0A2 //         Decimal >       61602
        .label      RSBREAK          = $F0A5 //         Decimal >       61605
        .label      RSFRAMER         = $F0A8 //         Decimal >       61608
        .label      RSINERR          = $F0AA //         Decimal >       61610
        .label      RSDVCERR         = $F0B9 //         Decimal >       61625
        .label      RSOPNOUT         = $F0BC //         Decimal >       61628
        .label      RSOUTSAV         = $F0ED //         Decimal >       61677
        .label      RSPREPOT         = $F102 //         Decimal >       61698
        .label      RSOPNIN          = $F116 //         Decimal >       61718
        .label      RSNXTIN          = $F14F //         Decimal >       61775
        .label      RSPAUSE          = $F160 //         Decimal >       61792
        .label      KMSGTBL          = $F174 //         Decimal >       61812
        .label      SPMSG            = $F1E2 //         Decimal >       61922
        .label      KMSGSHOW         = $F1E6 //         Decimal >       61926
        .label      GETIN            = $F1F5 //         Decimal >       61941
        .label      CHRIN            = $F20E //         Decimal >       61966
        .label      CHRINTP          = $F230 //         Decimal >       62000
        .label      CHRINTP2         = $F250 //         Decimal >       62032
        .label      CHRINSR          = $F264 //         Decimal >       62052
        .label      CHRINRS          = $F26F //         Decimal >       62063
        .label      CHROUT           = $F27A //         Decimal >       62074
        .label      CHROUTTP         = $F290 //         Decimal >       62096
        .label      CHKIN            = $F2C7 //         Decimal >       62151
        .label      CHKOUT           = $F309 //         Decimal >       62217
        .label      CLOSE            = $F34A //         Decimal >       62282
        .label      FNDFLNO          = $F3CF //         Decimal >       62415
        .label      SETFLCH          = $F3DF //         Decimal >       62431
        .label      CLALL            = $F3EF //         Decimal >       62447
        .label      CLRCHN           = $F3F3 //         Decimal >       62451
        .label      OPEN             = $F40A //         Decimal >       62474
        .label      SERNAME          = $F495 //         Decimal >       62613
        .label      OPENRS           = $F4C7 //         Decimal >       62663
        .label      RDTPBLKS         = $F8C0 //         Decimal >       62680
        .label      LOAD             = $F542 //         Decimal >       62786
        .label      LOADSER          = $F55C //         Decimal >       62812
        .label      SRCHING          = $F647 //         Decimal >       63047
        .label      FILENAME         = $F659 //         Decimal >       63065
        .label      LDVRMSG          = $F66A //         Decimal >       63082
        .label      SAVE             = $F675 //         Decimal >       63093
        .label      SAVESER          = $F692 //         Decimal >       63122
        .label      SAVETP           = $F6F1 //         Decimal >       63217
        .label      SAVING           = $F728 //         Decimal >       63272
        .label      UDTIM            = $F734 //         Decimal >       63284
        .label      RDTIM            = $F760 //         Decimal >       63328
        .label      SETTIM           = $F767 //         Decimal >       63335
        .label      STOP             = $F770 //         Decimal >       63344
        .label      FILEMSG          = $F77E //         Decimal >       63358
        .label      FAH              = $F7AF //         Decimal >       63407
        .label      TAPEH            = $F7E7 //         Decimal >       63463
        .label      TPBUFA           = $F84D //         Decimal >       63565
        .label      LDAD1            = $F854 //         Decimal >       63572
        .label      FNDHDR           = $F867 //         Decimal >       63591
        .label      JTP20            = $F88A //         Decimal >       63626
        .label      CSTEL            = $F894 //         Decimal >       63636
        .label      CS10             = $F8AB //         Decimal >       63659
        .label      CSTE2            = $F8B7 //         Decimal >       63671
        .label      RBLK             = $F8C9 //         Decimal >       63689
        .label      WBLK             = $F8E3 //         Decimal >       63715
        .label      TAPE             = $F8F4 //         Decimal >       63732
        .label      TSTOP            = $F94B //         Decimal >       63819
        .label      STT1             = $F95D //         Decimal >       63837
        .label      READT            = $F98E //         Decimal >       63886
        .label      TPSTORE          = $FAAD //         Decimal >       64173
        .label      RD300            = $FBD2 //         Decimal >       64466
        .label      NEWCH            = $FBDB //         Decimal >       64475
        .label      TPTOGLE          = $FBEA //         Decimal >       64490
        .label      BLKEND           = $FC06 //         Decimal >       64518
        .label      WRITE            = $FC0B //         Decimal >       64523
        .label      WRTN1            = $FC95 //         Decimal >       64661
        .label      WRTZ             = $FCA8 //         Decimal >       64680
        .label      TNIF             = $FCCF //         Decimal >       64719
        .label      BSIV             = $FCF6 //         Decimal >       64758
        .label      TNOFF            = $FD08 //         Decimal >       64776
        .label      VPRTY            = $FD11 //         Decimal >       64785
        .label      WRT62            = $FD1B //         Decimal >       64795
        .label      START            = $FD22 //         Decimal >       64802
        .label      CHKAUTO          = $FD3F //         Decimal >       64831
        .label      AOCBM            = $FD4D //         Decimal >       64845
        .label      RESTOR           = $FD52 //         Decimal >       64850
        .label      VECTOR           = $FD57 //         Decimal >       64855
        .label      VECTORS          = $FD6D //         Decimal >       64877
        .label      INITMEM          = $FD8D //         Decimal >       64909
        .label      IRQVCTRS         = $FDF1 //         Decimal >       65009
        .label      INITVIA          = $FDF9 //         Decimal >       65017
        .label      SETNAM           = $FE49 //         Decimal >       65097
        .label      SETLFS           = $FE50 //         Decimal >       65104
        .label      READST           = $FE57 //         Decimal >       65111
        .label      SETMSG           = $FE66 //         Decimal >       65126
        .label      READIOST         = $FE68 //         Decimal >       65128
        .label      ORIOST           = $FE6A //         Decimal >       65130
        .label      SETTMO           = $FE6F //         Decimal >       65135
        .label      MEMTOP           = $FE73 //         Decimal >       65139
        .label      MEMBOT           = $FE82 //         Decimal >       65154
        .label      TSTMEM           = $FE91 //         Decimal >       65169
        .label      NMI              = $FEA9 //         Decimal >       65193
        .label      BREAK            = $FED2 //         Decimal >       65234
        .label      RSNMI            = $FEDE //         Decimal >       65246
        .label      RTI              = $FF56 //         Decimal >       65366
        .label      BAUDTBL          = $FF5C //         Decimal >       65372
        .label      IRQROUT          = $FF72 //         Decimal >       65394
        .label      C5FFS            = $FF85 //         Decimal >       65413
        .label      CRESTOR          = $FF8A //         Decimal >       65418
        .label      CVECTOR          = $FF8D //         Decimal >       65421
        .label      CSETMSG          = $FF90 //         Decimal >       65424
        .label      CSECOND          = $FF93 //         Decimal >       65427
        .label      CTKSA            = $FF96 //         Decimal >       65430
        .label      CMEMTOP          = $FF99 //         Decimal >       65433
        .label      CMEMBOT          = $FF9C //         Decimal >       65436
        .label      CSCNKEY          = $FF9F //         Decimal >       65439
        .label      CSETTMO          = $FFA2 //         Decimal >       65442
        .label      CACPTR           = $FFA5 //         Decimal >       65445
        .label      CCIOUT           = $FFA8 //         Decimal >       65448
        .label      CUNTLK           = $FFAB //         Decimal >       65451
        .label      CUNLSN           = $FFAE //         Decimal >       65454
        .label      CLISTEN          = $FFB1 //         Decimal >       65457
        .label      CTALK            = $FFB4 //         Decimal >       65460
        .label      CRDST            = $FFB7 //         Decimal >       65463
        .label      CSETLFS          = $FFBA //         Decimal >       65466
        .label      CSETNAM          = $FFBD //         Decimal >       65469
        .label      COPEN            = $FFC0 //         Decimal >       65472
        .label      CCLOS            = $FFC3 //         Decimal >       65475
        .label      INPCHN           = $FFC6 //         Decimal >       65478
        .label      OUTCHN           = $FFC9 //         Decimal >       65481
        .label      CCLRCHN          = $FFCC //         Decimal >       65484
        .label      CINCH            = $FFCF //         Decimal >       65487
        .label      CCHROUT          = $FFD2 //         Decimal >       65490
        .label      CLOAD            = $FFD5 //         Decimal >       65493
        .label      CSAVE            = $FFD8 //         Decimal >       65496
        .label      CSETTIM          = $FFDB //         Decimal >       65499
        .label      CRDTIM           = $FFDE //         Decimal >       65502
        .label      ISCNTC           = $FFE1 //         Decimal >       65505
        .label      CGETL            = $FFE4 //         Decimal >       65508
        .label      CCALL            = $FFE7 //         Decimal >       65511
        .label      CUDTIM           = $FFEA //         Decimal >       65514
        .label      CSCREEN          = $FFED //         Decimal >       65517
        .label      CPLOT            = $FFF0 //         Decimal >       65520
        .label      CIOBASE          = $FFF3 //         Decimal >       65523
        .label      VCTRNMI          = $FFFA //         Decimal >       65530
        .label      VCTRRST          = $FFFC //         Decimal >       65532
        .label      VCTRIRQ          = $FFFE //         Decimal >       65534
    }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                