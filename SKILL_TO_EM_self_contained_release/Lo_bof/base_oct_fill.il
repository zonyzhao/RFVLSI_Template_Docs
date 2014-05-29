/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_oct_fill";	

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 200.0)  ; Inductor total width
	(W	"float" 5.0)	; Line width
	(LOP "float"	0.0) 
	(ROP "float"	0.0) 
	(MET "int"	9) 
	(layer "string"	"RFVLSI") 
	(purp "string"	"drawing") 
)
let((m_base_oct_fill),
	m_base_oct_fill = dbOpenCellViewByType(pcCellView~>lib "base_oct_half_fill" "layout" )
		dbCreateParamInst(pcCellView m_base_oct_fill nil 0:0 "R0" 1
        list(
			list("layer" "string" layer) 
			list("purp" "string" purp) 
	        list("OD" "float" OD)
    	    list("W" "float" W)
	        list("OP" "float" ROP)
    	    list("MET" "int" MET)
	    ))

		dbCreateParamInst(pcCellView m_base_oct_fill nil 0:0 "MX" 1
        list(
			list("layer" "string" layer) 
			list("purp" "string" purp) 
            list("OD" "float" OD)
            list("W" "float" W)
            list("OP" "float" LOP)
            list("MET" "int" MET)
        ))
)/*end of let*/
)/*end of pcDefinePCell*/

