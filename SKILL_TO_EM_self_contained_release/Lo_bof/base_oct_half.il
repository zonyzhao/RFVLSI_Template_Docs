/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_oct_half";	

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 200.0)  ; Inductor total width
	(W	"float" 5.0)	; Line width
	(LOP "float"	0.0) 
	(ROP "float"	0.0) 
	(MET "int"	9) 
	(dummy "boolean" nil)
)
let((m_base_oct_quad),
	m_base_oct_quad = dbOpenCellViewByType(pcCellView~>lib "base_oct_quad" "layout" )
		dbCreateParamInst(pcCellView m_base_oct_quad nil (-OD/2):0 "R0" 1
        list(
	        list("OD" "float" OD)
    	    list("W" "float" W)
	        list("OP" "float" LOP)
    	    list("MET" "int" MET)
			list("dummy" "boolean" dummy)
	    ))

		dbCreateParamInst(pcCellView m_base_oct_quad nil (OD/2):0 "MY" 1
        list(
            list("OD" "float" OD)
            list("W" "float" W)
            list("OP" "float" ROP)
            list("MET" "int" MET)
			list("dummy" "boolean" dummy)			
        ))
)/*end of let*/
)/*end of pcDefinePCell*/

