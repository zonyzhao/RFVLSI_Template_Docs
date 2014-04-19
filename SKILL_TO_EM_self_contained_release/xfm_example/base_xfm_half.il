/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_xfm_half";	
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 200.0)  ; Inductor total width
	(W	"float" 5.0)	; Line width
	(S	"float"	2.0) 
	(B_TK	"float"	0.0) 
	(A_TK	"float"	0.0) 
	(LOP "float"	15.0) 
	(ROP "float"	15.0) 
	(TOP_ME "int"	9) 
	(BTM_ME "int"	9) 
	(en_dmy "boolean"	nil) 
	(via_to_next "boolean"	nil) 
	(via_diag "boolean"	nil) 
)
let((P C A B BA BB PA PB pi masterx i masterv ),
	pi = 3.141592
	P = S+W
	C = ceiltogrid(W*tan(pi/8)+0.005)
	DIV = 2 + sqrt(2)
	A = roundtogrid(OD/DIV)-A_TK
	B = OD-2*A-B_TK
	BA = floortogrid(B/2 - 0.005)
	BB = B-BA
	PA = roundtogrid(P/2)
	PB = P-PA
	masterx = dbOpenCellViewByType(pcCellView~>lib "base_xfm_body" "layout")
	masterv = dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	mastervd = dbOpenCellViewByType(pcCellView~>lib "vias_diagonal" "layout")
	for(i BTM_ME TOP_ME
		dbCreateParamInst(pcCellView masterx nil 0:0 "R0" 1
		list(
			list("OD"  "float" OD)
			list("W"    "float" W)
			list("LOP"    "float" LOP)
			list("ROP"    "float" ROP)
			list("A_TK"    "float" A_TK)
			list("B_TK"    "float" B_TK)
			list("MET"   "int"   i)
		))
	)
	
	if(via_to_next
	then
		dbCreateParamInst(pcCellView masterv nil OD-W:ROP "R0" 1
			list(
			list("Length"  "float" BA-ROP)
			list("Width"    "float" W)
			list("TOP_ME"   "int"   TOP_ME)
			list("BTM_ME"   "int"   BTM_ME))
		) 
		dbCreateParamInst(pcCellView masterv nil A:BA+A-W "R0" 1
			list(
			list("Length"  "float" W)
			list("Width"    "float" B)
			list("TOP_ME"   "int"   TOP_ME)
			list("BTM_ME"   "int"   BTM_ME)
		)) 
	)
	if(en_dmy
	then
		dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "base_xfm_dmy" "layout")
			nil 0:0 "R0" 1
			list(
				list("OD"  "float" OD)
				list("layer"    "string" "RFVLSI")
				list("purpose"    "string" "drawing")
		))
	)
	if(via_diag
	then
		dbCreateParamInst(pcCellView mastervd nil 0:BA "R0" 1
		list(
			list("Length"  "float" A-C-W)
			list("Width"    "float" W+C)
			list("TOP_ME"   "int"   TOP_ME)
			list("BTM_ME"   "int"   BTM_ME)
		)) ; close dbCreateParamInst

		dbCreateParamInst(pcCellView mastervd nil OD:BA "MY" 1
		list(
				list("Length"  "float" A-C-W)
				list("Width"    "float" W+C)
				list("TOP_ME"   "int"   TOP_ME)
				list("BTM_ME"   "int"   BTM_ME)
		)) ; close dbCreateParamInst
	)
))
