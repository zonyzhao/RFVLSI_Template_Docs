/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_oct_quad";	

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 200.0)  ; Inductor total width
	(W	"float" 5.0)	; Line width
	(OP "float"	0.0) 
	(MET "int"	9) 
)
let((pi C A B BA BB DIV),
	pi = 3.141592
	C = ceiltogrid(W*tan(pi/8)+0.005)
	DIV = 2+sqrt(2)
	A = roundtogrid(OD/DIV)
	B = OD-2*A
	BA = floortogrid(B/2-0.005)
	BB = B-BA
	if(OP > BA
	then
		dbCreatePolygon(pcCellView, MetalVec(MET-1), 
			list(W:W+BA W/2:W/2+BA W/2:BA-C W:BA-C A+C:BA+A-W OD/2:BA+A-W OD/2:BA+A A:BA+A))
	else
		dbCreatePolygon(pcCellView, MetalVec(MET-1), 
			list(0:BA 0:OP	W:OP W:BA-C A+C:BA+A-W OD/2:BA+A-W OD/2:BA+A A:BA+A))
	)
)/*end of let*/
)/*end of pcDefinePCell*/

