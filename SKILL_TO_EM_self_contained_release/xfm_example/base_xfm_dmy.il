/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_xfm_dmy";	

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 200.0)  ; Inductor total width
	(layer "string"	"RFVLSI")
	(purpose "string"	"drawing") 
)
let(( A B BA BB pi DIV),
	pi = 3.141592
	DIV = 2 + sqrt(2)
	A = roundtogrid(OD/DIV)
	B = OD-2*A
	BA = roundtogrid(B/2)
	BB = B-BA
	dbCreatePolygon(pcCellView, list(layer, purpose), list(OD:0 	0:0  			0:BA		A:BA+A 			OD-A:BA+A	OD:BA))	
)
)/*end of let*/

