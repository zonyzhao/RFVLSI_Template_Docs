/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */

strCellName="X"

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Height	"float" 30.0)	
	(LineWidth	"float" 5.0)	
	(TOP_ME	"int" 9)	
	(BTM_ME	"int" 8)	
)
let((masterc),
	pi=3.141592
    C = ceiltogrid(LineWidth*tan(pi/8)+0.01)
    C2 = ceiltogrid(C/sqrt(2))
	;fprintf(stderr "C = (%L)\n" C)
	;fprintf(stderr "C2 = (%L)\n" C2)
	masterc = dbOpenCellViewByType(pcCellView~>lib "base_xfm_cross" "layout" );
	dbCreateParamInst(pcCellView masterc nil (-Height/2+LineWidth-C2):0 "R0" 1 list(
		list("WO"  "float" LineWidth)
		list("WI"  "float" Height-3*LineWidth-C)
	    list("S"  "float" 0.0) 
	    list("TOP_ME" "int"   TOP_ME) 
	    list("BTM_ME" "int"   BTM_ME) 
	    list("dummy"   "boolean"  t) 
    	list("viad"    "boolean"   t)
    	list("viat"    "boolean"   t)
        list("top"    "boolean"   t)
	))

	dbCreateParamInst(pcCellView masterc nil (Height/2-LineWidth+C2):0 "MY" 1 list(
		list("WO"  "float" LineWidth)
		list("WI"  "float" Height-3*LineWidth-C)
        list("S"  "float" 0.0)
	    list("TOP_ME" "int"   TOP_ME) 
	    list("BTM_ME" "int"   BTM_ME) 
        list("dummy"   "boolean"  t)
    	list("viad"    "boolean"   t)
    	list("viat"    "boolean"   t)
        list("top"    "boolean"   nil)
    ))
	)
)
