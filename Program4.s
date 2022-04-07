;David Hoffman
;5/2/20
;Project 4

		AREA Program4, CODE, READONLY
		ENTRY
		
base	EQU 0x40000000				  ;initializes program to location in memory
	
itmAdr	RN 0
itm	    RN 1
stall	RN 2
stalAdr	RN 3
offset	RN 4
numAss 	RN 5
offset2	RN 6
itmSz	RN 7
count	RN 8
		
		LDR itmSz, ItmSz
addIt	CMP count, #60
		BGE stop
		ADR itmAdr, MktItm
		MUL offset, count, itmSz		
		ADD itmAdr, itmAdr, offset 
		BL gtStal						;calls getter for stall
		BL stStal						;calls setter for stall
		ADD itmAdr, itmAdr, ItmSz	
		ADD count, count, #1
		B addIt
		
stop	B stop							;ends program
gtStal	LDR itm, [itmAdr]				;get key
		AND stall, itm, #7				;mod key by 8
		BX LR

stStal	MOV offset, #0x80
		LSL offset,offset, stall		;calculate offset
		LDR stalAdr, =base
		LDR numAss, [stalAdr, offset]
 		MUL offset2, numAss, itmSz		
		ADD numAss, numAss, #1			;increment workers
		STR numAss, [stalAdr, offset]	;stores new worker num
		ADD offset,offset,offset2		;worker offset + stall offset
		ADD offset,offset, #4
		STR itm, [stalAdr, offset]		;stores key 
		ADD itmAdr,itmAdr, #4
		ADD offset,offset, #4
		LDR itm, [itmAdr]
		STR itm, [stalAdr, offset]		;stores 1 byte
		ADD itmAdr,itmAdr, #4
		ADD offset,offset, #4
		LDR itm, [itmAdr]
		STR itm, [stalAdr, offset]		;stores 2nd byte
		ADD itmAdr,itmAdr, #4
		ADD offset,offset, #4
		LDR itm, [itmAdr]
		STR itm, [stalAdr, offset]		;stores 3rd byte
		BX LR
		
;	Table represents market	items	
;	Each entry has 16 bytes 
;	Key is a 32-bit integer
;	Each food item is a 12-byte ASCII string

ItmSz	DCD 16
MkItm	DCD 4514	
		DCB	"apricots"
		DCD 4131	
		DCB	"apple"
		DCD 4216	
		DCB	"apricots"
		DCD 4525	
		DCB	"asparagus"
		DCD 4280	
		DCB	"avocado"
		DCD 4011	
		DCB	"banana"
		DCD 4885	
		DCB	"basil"
		DCD 4536
		DCB	"beans"
		DCD 4542	
		DCB	"beets"
		DCD 4060	
		DCB	"broccoli"
		DCD 4069	
		DCB	"cabbage"
		DCD 4562	
		DCB	"carrots"
		DCD 4077	
		DCB	"cauliflower"
		DCD 4583	
		DCB	"celery"
		DCD 4040	
		DCB	"cherries"
		DCD 3184	
		DCB	"chile"
		DCD 4260	
		DCB	"coconut"
		DCD 4073	
		DCB	"corn"
		DCD 4062	
		DCB	"cucumber"
		DCD 4874	
		DCB	"duritos"
		DCD 4081	
		DCB	"eggplant"
		DCD 4608	
		DCB	"garlic"
		DCD 4612	
		DCB	"ginger	root"
		DCD 4282	
		DCB	"grapefruit"
		DCD 4273	
		DCB	"grapes"
		DCD 4889	
		DCB	"cilantro"
		DCD 4907	
		DCB	"epazote"
		DCD 4896	
		DCB	"mint"
		DCD 4897	
		DCB	"oregano"
		DCD 4899	
		DCB	"parsley"
		DCD 4870	
		DCB	"jamaica"
		DCD 4631	
		DCB	"jicama"
		DCD 4629	
		DCB	"leeks"
		DCD 4053	
		DCB	"lemon"
		DCD 4061	
		DCB	"lettuce"
		DCD 4307	
		DCB	"lime"
		DCD 4051	
		DCB	"mango"
		DCD 4050	
		DCB	"melon"
		DCD 4646	
		DCB	"mushroom"
		DCD 4036	
		DCB	"nectarines"
		DCD 4939	
		DCB	"nuts"
		DCD 4658	
		DCB	"onions"
		DCD 4012	
		DCB	"orange"
		DCD 4395	
		DCB	"papaya"
		DCD 4038	
		DCB	"peaches"
		DCD 4409	
		DCB	"pear"
		DCD 4430	
		DCB	"pineapple"
		DCD 4039	
		DCB	"plums"
		DCD 4073	
		DCB	"potato"
		DCD 4089	
		DCB	"radish"
		DCD 4090	
		DCB	"spinach"
		DCD 4759	
		DCB	"squash"
		DCD 4028	
		DCB	"strawberry"
		DCD 4450	
		DCB	"tangerine"
		DCD 4800	
		DCB	"tomatillo"
		DCD 3151	
		DCB	"tomatoes"
		DCD 4813	
		DCB	"turnips"
		DCD 4031	
		DCB	"watermelon"
		DCD 4471	
		DCB	"tuna"
		DCD 4818	
		DCB	"yams"
		
;	Copies stalls to memory
				
Stalls 	DCD 0x40000080
		DCD 0x40000100
		DCD 0x40000200
		DCD 0x40000400
		DCD 0x40000800
		DCD 0x40001000
		DCD 0x40002000
		DCD 0x40004000
	
		END