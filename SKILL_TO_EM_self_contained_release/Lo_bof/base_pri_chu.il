/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */

strCellName="base_pri_chu"

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
	(LOP "float"	4.0) 
	(en_NTN "boolean"	nil)
	(en_HighK "boolean"	t)
	(en_1to1 "boolean"	nil)	
	(text "string"	"xfm") 
)
let((PI PO master param masterc LOPP ROPP),
	PI = WI + S
	PO = WO + S	
	master = dbOpenCellViewByType(pcCellView~>lib "base_oct" "layout" );
	masterc = dbOpenCellViewByType(pcCellView~>lib "X" "layout" );
	if(en_1to1
	then 
		LOPP=0
		ROPP=ROP
		dbCreateRect(pcCellView, MetalVec(8), list(WO:-WO/2 PI+PO:WO/2))
		dbCreateRect(pcCellView, MetalVec(7), list(OD-(PI+PO):ROP OD-WO:ROP+WO))
		dbCreateRect(pcCellView, MetalVec(7), list(OD-(PI+PO):-ROP OD-WO:-(ROP+WO)))
	else
		LOPP = 0.6
		ROPP = 0
		dbCreateParamInst(pcCellView masterc nil WI/2+WO+S:0 "R90" 1 
			list(
			list("LineWidth"  "float" WO)
		    list("Height"  "float" WI+2*WO+2*S) 
		))

		dbCreateParamInst(pcCellView master nil OD/2:0 "R0" 1
	    list(
					list("OD" "float" OD)  
	    			list("W"  "float" WO)
					list("LOP" "float" WI/2+S)
				    list("ROP" "float" ROP)
				    list("MET" "int"    9)
        ))

		dbCreateParamInst(pcCellView master nil WO+WI+S+S+(OD-2*(PI+PO))/2:0 "R0" 1
	    	list(
					list("OD" "float" OD-2*(PI+PO))  
	    			list("W"  "float" WO)
				    list("S"  "float" S)
					list("LOP" "float" WI/2+S)
					list("ROP" "float" ROPP)
				    list("MET" "int"    9)
        ))
	)
	)
)
