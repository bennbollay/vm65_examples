; test program #12
; address: $0c00
; Search lookup table in $0f00 to $0fff with amplitude amplification
; store result in $0cff
;
GINIT:	clq
		ldx #$00
		ldy #$0c
		clc
		clv
		seq
		hax
		lda $0f00,X
GITER:	seq
		sez
		clc
		cmp #$64
		ehx
		qzz
		clz
		ehx
		clq
		dey
		bne GITER
		cmp #$64
		bne GINIT
		stx $0cff
		brk

; > $1f $a2 $00 $a0 $0c $18 $b8 $3f $03 $bd $00 $0f $3f $2b $c9 $64
; < $0b $f7 $47 $0b $1f $88 $d0 $f4 $c9 $64 $d0 $e4 $8e $ff $0c $00 


; The above algorithm should return the byte offset from $0F00 where $64 is stored.
.ORG $0F00

.BYTE $ff,$fe,$fd,$fc,$fb,$fa,$f9,$f8,$f7,$f6,$f5,$f4,$f3,$f2,$f1,$f0,$ef,$ee,$ed,$ec,$eb,$ea,$e9,$e8,$e7,$e6,$e5,$e4,$e3,$e2,$e1,$e0,$df,$de,$dd,$dc,$db,$da,$d9,$d8,$d7,$d6,$d5,$d4,$d3,$d2,$d1,$d0,$cf,$ce,$cd,$cc,$cb,$ca,$c9,$c8,$c7,$c6,$c5,$c4,$c3,$c2,$c1,$c0,$bf,$be,$bd,$bc,$bb,$ba,$b9,$b8,$b7,$b6,$b5,$b4,$b3,$b2,$b1,$b0,$af,$ae,$ad,$ac,$ab,$aa,$a9,$a8,$a7,$a6,$a5,$a4,$a3,$a2,$a1,$a0,$9f,$9e,$9d,$9c,$9b,$9a,$99,$98,$97,$96,$95,$94,$93,$92,$91,$90,$8f,$8e,$8d,$8c,$8b,$8a,$89,$88,$87,$86,$85,$84,$83,$82,$81,$80,$7f,$7e,$7d,$7c,$7b,$7a,$79,$78,$77,$76,$75,$74,$73,$72,$71,$70,$6f,$6e,$6d,$6c,$6b,$6a,$69,$68,$67,$66,$65,$64,$63,$62,$61,$60,$5f,$5e,$5d,$5c,$5b,$5a,$59,$58,$57,$56,$55,$54,$53,$52,$51,$50,$4f,$4e,$4d,$4c,$4b,$4a,$49,$48,$47,$46,$45,$44,$43,$42,$41,$40,$3f,$3e,$3d,$3c,$3b,$3a,$39,$38,$37,$36,$35,$34,$33,$32,$31,$30,$2f,$2e,$2d,$2c,$2b,$2a,$29,$28,$27,$26,$25,$24,$23,$22,$21,$20,$1f,$1e,$1d,$1c,$1b,$1a,$19,$18,$17,$16,$15,$14,$13,$12,$11,$10,$0f,$0e,$0d,$0c,$0b,$0a,$09,$08,$07,$06,$05,$04,$03,$02,$01,$64
; $64 is stored in the last position.
