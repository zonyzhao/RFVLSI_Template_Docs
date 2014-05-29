/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWOAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Frank */
	
strCellName="base_xfm_cross";	  /*Assign your cell name to variable strCellName*/
strLibName="N65_FK_XFM"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(WI 	"float" 2.0)	; Line width
	(WO 	"float" 3.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(TOP_ME	"int"	9) ; Line spacing
	(BTM_ME	"int"	8) ; Line spacing
	(dummy   "boolean"	t) ; Line spacing
	(viat    "boolean"	t) ; Line spacing
	(viad    "boolean"	t) ; Line spacing
	(top    "boolean"	nil) ; Line spacing
	(layer "string" "RFVLSI")
	(purpose "string" "drawing")
)
let((pi C C2 OOCH masterxdiag OOCHD),
	pi=3.141592
	C = ceiltogrid(WO*tan(pi/8) +0.005)
	C2 = ceiltogrid(C/sqrt(2))
	;OOCH = WO+WI/2+S-C2-C
	OOCH = WO+S+WI/2-C2
	if(2*S+WI <= 2.0*sqrt(2.0)
	then
		OOCHD = ceiltogrid(2.01*sqrt(2.0)- WI)
	else
		OOCHD = 0.0
	)
	masterxdiag = dbOpenCellViewByType("N65_FK_XFM" "base_ind_diag" "layout")
	;m_dmy_rect = dbOpenCellViewByType("N65_FK_XFM" "xfm_dmy_rect" "layout")
	if(top
	then
		dbCreateParamInst(pcCellView masterxdiag nil 0:0 "R0" 1
                	list(
                        list("W" "float"  WO)
                        list("S" "float"  2*S+WI)
                        list("MET" "int" TOP_ME)
                        list("b_dmy" "boolean" dummy)
						list("layer" "string" layer)
						list("purpose" "string" purpose)
						))
	else
		dbCreateParamInst(pcCellView masterxdiag nil 0:0 "R0" 1
                	list(
                        list("W" "float"  WO)
                        list("S" "float"  2*S+WI)
                        list("MET" "int" BTM_ME)
                        list("b_dmy" "boolean" dummy)
						list("layer" "string" layer)
						list("purpose" "string" purpose)
						))
	)

		dbCreateParamInst(pcCellView 
			dbOpenCellViewByType("RFVLSI_N65v1p1" "vias" "layout") nil 0:-OOCH-OOCHD "MX" 1
          	list(
                        list("Length" "float"  WO)
                        list("Width" "float"   WO)
                        list("TOP_ME" "int" TOP_ME)
                        list("BTM_ME" "int" BTM_ME)
	        ) ; close list
        	) ; close dbCreateParamInst
			    
		dbCreateParamInst(pcCellView 
			dbOpenCellViewByType("RFVLSI_N65v1p1" "vias" "layout") nil WI+WO+2*S:OOCH+OOCHD "R0" 1
            list(
            	list("Length" "float"  WO)
                list("Width" "float"   WO)
                list("TOP_ME" "int" TOP_ME)
                list("BTM_ME" "int" BTM_ME)
		))
				
)/*end of let*/
)/*end of pcDefinePCell*/
