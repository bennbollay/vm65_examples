; test program #12
; address: $0c00
; Search lookup table in $0f00 to $0fff with amplitude amplification
; store result in $0cff
;
GINIT:	clq
		ldy #$0c
		ldx #$00
		seq
		clv
		clc
		hax
		lda $0f00,X
;		sec ; Set carry here instead of Z and N to search >=
GITER:	seq
		sez ; Set Z here instead of N and C to search =
;		sen ; Set N here instead of Z and C to search <
		cmp #$64
		ehx
		qzz
		clq
		ehx
		dey
		bne GITER
		cmp #$64
		bne GINIT
		stx $0cff
		brk

; > $1f $a0 $0c $a2 $00 $3f $b8 $18 $03 $bd $00 $0f $3f $2b $c9 $64
; < $0b $f7 $1f $0b $88 $d0 $f5 $c9 $64 $d0 $e3 $8e $ff $0c $00 


; The above algorithm should return the byte offset from $0F00 where $64 is stored.
.ORG $0F00

.BYTE $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$64
; $64 is stored in the last position.
