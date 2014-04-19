/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_balun_half"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 150.0)
	(W	"float" 4.0)
	(W_INC	"float" 1.5)
	(S	"float"	2.0) 
	(B_TK	"float"	0.0) 
	(A_TK	"float"	0.0) 
	(LOP "float"	10.0) 
	(ROP "float"	10.0) 
	(en_dmy "boolean"	t) 
	(en_NTN "boolean"	t) 
	(align_left "boolean"	t) 
)

let((pi P WW C CI A B BA BB PA PB CA CB DIV),
	pi=3.141592
	P = S+W
	WW = W + W_INC
	C = ceiltogrid(W*tan(pi/8)+0.005)
	CA = roundtogrid(C/2)
	CB = C - CA
	CI = roundtogrid(WW*tan(pi/8))-C
	DIV = 2+sqrt(2)
	A = roundtogrid(OD/DIV)-A_TK
	B = OD-2*A-B_TK
	BA = floortogrid(B/2-0.005)
	BB = B-BA
	PA = roundtogrid(P/2)
	PB = P-PA

 dbCreateParamInst(pcCellView
        dbOpenCellViewByType(pcCellView~>lib "base_xfm_half" "layout" )
        nil 0:0 "R0" 1
        list(
            list("OD"     "float" OD)
            list("W"      "float" W)
            list("S"      "float" S)
            list("B_TK"   "float" B_TK)
            list("A_TK"   "float" A_TK)
            list("TOP_ME" "int"    9)
            list("BTM_ME" "int"    8)
            list("en_dmy" "boolean"   en_dmy)
            list("via_to_next" "boolean"  t)
            list("via_diag" "boolean"   t)
            list("ROP" "float" ROP)
            list("LOP" "float" LOP))
        )

	if(!en_NTN
	then
		dbCreateLabel(pcCellView, list("text","drawing"), OD/2:(-3), "Add en_NTN Manually!", "centerCenter", "R0", "roman", 2)
	else
		dbCreatePolygon(pcCellView list("NT_N","drawing") list(OD:0  0:0 0:BA+CA     A-CA:BA+A OD-A+CA:BA+A    OD:BA+CA))
	)

	if(en_dmy
	then
		dbCreatePolygon(pcCellView, list("RFVLSI","drawing"), list(OD:0  0:0 0:BA+CA     A-CA:BA+A OD-A+CA:BA+A    OD:BA+CA))
		dbCreatePolygon(pcCellView list("DMEXCL", "dummy9") list(OD:0  0:0 0:BA+CA     A-CA:BA+A OD-A+CA:BA+A    OD:BA+CA)) 
		dbCreatePolygon(pcCellView list("DMEXCL", "dummy8") list(OD:0  0:0 0:BA+CA     A-CA:BA+A OD-A+CA:BA+A    OD:BA+CA))
		dbCreatePolygon(pcCellView list("VIAEXCL", "dummy8") list(OD:0  0:0 0:BA+CA     A-CA:BA+A OD-A+CA:BA+A    OD:BA+CA))
	)


	if(align_left
	then
        dbCreateParamInst(pcCellView
			dbOpenCellViewByType(pcCellView~>lib "base_xfm_body" "layout")
			nil 0:0 "R0" 1
	        list(
                list("OD"  "float" OD)
                list("W"    "float" WW)
                list("LOP"    "float" LOP)
                list("ROP"    "float" ROP)
                list("A_TK"    "float" A_TK)
                list("B_TK"    "float" B_TK)
                list("MET"   "int"   8))
		)
	else		
		dbCreateParamInst(pcCellView
            dbOpenCellViewByType(pcCellView~>lib "base_xfm_body" "layout")
            nil (-W_INC:0) "R0" 1
            list(
                list("OD"  "float" OD+2*W_INC)
                list("W"    "float" WW)
                list("LOP"    "float" LOP)
                list("ROP"    "float" ROP)
                list("A_TK"    "float" A_TK)
                list("B_TK"    "float" B_TK)
                list("MET"   "int"   8))
        )
	)


        dbCreateParamInst(
	        pcCellView
        	dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
			nil (OD-W:ROP) "R0" 1
    	    list(
                list("Length"  "float" BA-ROP)
                list("Width"    "float" W)
                list("TOP_ME"   "int"   9)
                list("BTM_ME"   "int"   8))) ; close dbCreateParamInst

		dbCreateParamInst(
	        pcCellView
        	dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
			nil 0:LOP "R0" 1
	        list(
                list("Length"  "float" BA-LOP)
                list("Width"    "float" W)
                list("TOP_ME"   "int"   9)
                list("BTM_ME"   "int"   8))) ; close dbCreateParamInst


)/*end of let*/
)/*end of pcDefinePCell*/
