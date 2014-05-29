/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_lead";	Cell Name


; Define my parameterized cell with the information above
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(L 	"float" 10.0)	; Inductor total width
	(W  	"float" 8.0)	; Line width
	(WD  	"float" 1.0)	; controlling the location to place pins.
	(PINTXT "string" "p1")	; Line width
	;(PINP "string" 	 "dummy1")	; Line width
	(TOP_ME "string" "9")
	(BTM_ME "string" "9")
	;(DUMMYL "string" "RFVLSI")
	;(DUMMYP "string" "drawing")
	(dummy "boolean" t)
)
let((m),
	/*	lead drawn by vias	*/ 
	dbCreateParamInst(pcCellView
    	dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
		nil 0:0 "R0" 1
        list(
                 list("Length"  "float" W)
                 list("Width"    "float" L)
                 list("TOP_ME"   "int"   atoi(TOP_ME))
                 list("BTM_ME"   "int"   atoi(BTM_ME)))) ; close dbCreateParamInst
	/*	(end) lead drawn by vias	*/ 
	/*	drawn dummy layers	*/ 
	if(dummy
	then
		dbCreateRect(pcCellView, list("RFVLSI",strcat("dummy" TOP_ME)),list(0:0 L-0.1:W))
		for(m (atoi(BTM_ME)-1) (atoi(TOP_ME)-1)
			dbCreateRect(pcCellView, RFVLSI_LVS_Vec(m),list(0:0 L-0.1:W))
		)
		dbCreateRect(pcCellView, list("RFVLSI_PIN", strcat("dummy" TOP_ME)),	list(L-WD-0.1:0 L-0.1:W))
		dbCreateLabel(pcCellView, list("RFVLSI_PIN",strcat("dummy" TOP_ME)), L-WD/2-0.1:W/2, PINTXT, "centerCenter", "R90", "roman", 0.5)
	)
	/*	end of drawn dummy layers	*/ 

)/*end of let*/
)/*end of pcDefinePCell*/
