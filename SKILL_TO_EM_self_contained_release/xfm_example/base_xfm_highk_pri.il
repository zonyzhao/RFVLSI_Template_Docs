/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */

strCellName="base_xfm_highk_pri"

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 150.0)  ; Inductor total width
	(WI	"float" 4.0)	
	(WO	"float" 2.0)	
	(M8_S	"float" 3.0)	
	(S	"float"	2.0) 
	(B_TK	"float"	0.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(A_TK	"float"	0.0) 
	(ROP "float"	10.0) 
	(LOP "float"	15.0) 
	(en_dmy "boolean"	t) 
	(en_NTN "boolean"	nil) 
	(text "string"	"xfm") 
)
let((PI PO master param masterc),
	PI = WI + S
	PO = WO + S	
	master = dbOpenCellViewByType(pcCellView~>lib "base_balun_halfud" "layout" );
    dbCreateParamInst(pcCellView master nil 0:0 "R0" 1
    list(
					list("OD" "float" OD)  
	    			list("W"  "float" WO)
				    list("S"  "float" S)
			    	list("B_TK"   "float" A_TK)
				    list("A_TK"   "float" B_TK)
				    list("LOP" "float" LOP+M8_S+WI)
				    list("ROP" "float" ROP)
				    list("LEADDYI"    "float" LEADDYI)
				    list("LEADDYO"    "float" LEADDYO)
				    list("en_dmy" "boolean"   en_dmy)
				    list("TOP_ME" "string"    "9")
				    list("BTM_ME" "string"    "9")
				    list("via_to_next" "boolean"  nil)
				    list("via_diag" "boolean" nil)
					list("align_left" "boolean"	t) 
        ))

    dbCreateParamInst(pcCellView master nil WO+WI+2*S:0 "R0" 1
    	list(
					list("OD" "float" OD-2*(PI+PO))  
	    			list("W"  "float" WO)
				    list("S"  "float" S)
			    	list("B_TK"   "float" A_TK)
				    list("A_TK"   "float" B_TK)
				    list("LOP" "float" LOP+M8_S+WI)
				    list("ROP" "float" WI+M8_S)
				    list("LEADDYI"    "float" LEADDYI)
				    list("LEADDYO"    "float" LEADDYO)
				    list("en_dmy" "boolean"   nil)
				    list("TOP_ME" "string"    "9")
				    list("BTM_ME" "string"    "9")
				    list("via_to_next" "boolean"  nil)
				    list("via_diag" "boolean" nil)
					list("align_left" "boolean"	nil) 
        ))

	masterc = dbOpenCellViewByType(pcCellView~>lib "base_xfm_cross" "layout" );

	dbCreateRect(pcCellView, MetalVec(8), list(0:-LOP-WI-M8_S WO:-WI/2-WO-S))
	dbCreateRect(pcCellView, MetalVec(8), list(0:WI/2+WO+S WO:LOP+WI+M8_S))
	dbCreateRect(pcCellView, MetalVec(8), list(PO+PI:WI/2+WO+S PO+PI+WO:LOP+WI+M8_S))
	dbCreateRect(pcCellView, MetalVec(8), list(PO+PI:-LOP-WI-M8_S PO+PI+WO:-WI/2-WO-S))
	dbCreateRect(pcCellView, MetalVec(8), list(OD-PI-PO-WO:-ROP OD-PI-PO:ROP))

	dbCreateParamInst(pcCellView masterc nil 0:0 "R0" 1 list(
		list("WO"  "float" WO)
		list("WI"  "float" WI)
	    list("S"  "float" S) 
	    list("TOP_ME" "int"   9) 
	    list("BTM_ME" "int"   9) 
	    list("en_dmy"   "boolean"  en_dmy) 
    	list("top"    "boolean"   t)
	))

	dbCreateParamInst(pcCellView masterc nil 2*WO+2*S+WI:0 "MY" 1 list(
		list("WO"  "float" WO)
		list("WI"  "float" WI)
        list("S"  "float" S)
        list("TOP_ME" "int"   9)
        list("BTM_ME" "int"   8)
        list("en_dmy"   "boolean"  en_dmy)
        list("top"    "boolean"   nil)
    ))
))
