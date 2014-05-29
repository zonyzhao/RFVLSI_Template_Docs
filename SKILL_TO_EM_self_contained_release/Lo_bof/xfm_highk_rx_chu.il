/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */

strCellName="xfm_highk_rx_chu"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 150.0)
	(WI 	"float" 4.0)	
	(WO 	"float" 2.0)	
	(ROP 	"float" 7.5)	
	(LEAD 	"float" 10.0)	
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(S 	"float" 2.05) 
	(en_NTN "boolean" t)
	(balun_str "string" "xfm_highk")
	(en_HighK "boolean"	t)
	(en_1to1 "boolean"	nil)
	(en_dmy "boolean" t)
)
let((PI PO masterp masters masterL masterUD LOP M8_S pi C C2 m_lead_pair LOP_P via_w),
	PI=WI+S	; Line pitch: width + space
	PO=WO+S	; Line pitch: width + space
	M8_S = 3.0
	pi=3.141592
	C=roundtogrid(WO*tan(pi/8))
	C2=roundtogrid(C/sqrt(2))
	LOP = WO+WI/2+S+C2+M8_S
	LOP_P = 9
	via_w = 5.0
	masterp = dbOpenCellViewByType(pcCellView~>lib "base_pri_chu" "layout" );
	masters = dbOpenCellViewByType(pcCellView~>lib "base_oct" "layout" );
	masterL = dbOpenCellViewByType(pcCellView~>lib "base_lead" "layout" );
	masterUD= dbOpenCellViewByType(pcCellView~>lib "base_under" "layout")
	m_lead_pair = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )		
	
	dbCreateLabel(pcCellView, list("RFVLSI","drawing"), OD/2:0, balun_str, "centerCenter", "R0", "roman", 2*PI)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy6"), OD/2:3, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 2)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy7"), OD/2:7, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 2)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy8"), OD/2:11, sprintf(nil "%L" WI), "centerCenter", "R0", "roman", 2)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy9"), OD/2:15, sprintf(nil "%L" WO), "centerCenter", "R0", "roman", 2)

	m_base_oct_half_fill = dbOpenCellViewByType(pcCellView~>lib "base_oct_fill" "layout" )
	if(en_dmy
	then
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil OD/2:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "RFVLSI")
            list("purp" "string"  "drawing")))
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil OD/2:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "RFVLSI_LVS")
            list("purp" "string"  "dummy8")))
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil OD/2:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "RFVLSI_LVS")
            list("purp" "string"  "dummy9")))
		/*
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil OD/2:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "DMEXCL")
            list("purp" "string"  "dummy8")))
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil OD/2:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "DMEXCL")
            list("purp" "string"  "dummy9")))
		*/
		dbCreateRect(pcCellView, list("RFVLSI","drawing"),list(-S:LOP_P 0:LOP_P+WI))
		dbCreateRect(pcCellView, list("RFVLSI","drawing"),list(-S:-LOP_P 0:-(LOP_P+WI)))
		dbCreateRect(pcCellView, list("RFVLSI_LVS","dummy8"),list(-S:LOP_P 0:LOP_P+WI))
		dbCreateRect(pcCellView, list("RFVLSI_LVS","dummy8"),list(-S:-LOP_P 0:-(LOP_P+WI)))
		dbCreateRect(pcCellView, list("RFVLSI","dummy9"),list(-S:LOP_P 0:LOP_P+WI))
		dbCreateRect(pcCellView, list("RFVLSI","dummy9"),list(-S:-LOP_P 0:-(LOP_P+WI)))
		dbCreateRect(pcCellView, list("DMEXCL","dummy8"),list(-S:LOP_P 0:LOP_P+WI))
		dbCreateRect(pcCellView, list("DMEXCL","dummy8"),list(-S:-LOP_P 0:-(LOP_P+WI)))
		dbCreateRect(pcCellView, list("DMEXCL","dummy9"),list(-S:LOP_P 0:LOP_P+WI))
		dbCreateRect(pcCellView, list("DMEXCL","dummy9"),list(-S:-LOP_P 0:-(LOP_P+WI)))
		)		
	
	dbCreateParamInst(pcCellView masterp nil 0:0 "R0" 1  
		list(
		list("OD" 	"float" 	OD) ; Inductor total width
		list("WI"	"float" 	WI)	
		list("WO"	"float" 	WO)	
		list("S"	"float"		S) 
		list("LOP"	"float" LOP) 
		list("LEADDYI"   "float" LEADDYI) 
		list("LEADDYO"   "float" LEADDYO) 
		list("TOP_ME" "string" "9")
		list("text" "string" balun_str)
		list("ROP" 	"float"	ROP)
		list("en_NTN" "boolean" en_NTN)
		list("en_HighK" "boolean"   en_HighK)
		list("en_1to1" "boolean"   en_1to1)
	))

	dbCreateParamInst(pcCellView masters nil PO+(OD-2*PO)/2:0 "R0" 1
		list(
		list("OD"   "float"     OD-2*PO) 
		list("W"    "float"     WI)
		list("TOP_ME" "string" "9")
		list("LOP"  "float" LOP_P)
	))


	;dbCreateParamInst(pcCellView masterUD nil PO:LOP "R90" 1

	dbCreateParamInst(pcCellView masterUD nil (-S-WI):LOP_P "R0" 1
		list(	; under pass 1
		list("W"   "float" WI)  
		list("L"   "float" 2*S+WO+2*WI)  
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 8)
	))
	;dbCreateParamInst(pcCellView masterUD nil PO:-LOP-WI "R90" 1 
	dbCreateParamInst(pcCellView masterUD nil (-S-WI):-LOP_P "MX" 1 
		list(	; under pass 2
		list("W"   "float" WI)  
		list("L"   "float" 2*S+WO+2*WI)  
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 8)
	))
	
	;dbCreateRect(pcCellView, MetalVec(7), list(PO:WI/2+WO+S+2 OD+LEAD:WI/2))
	
	/**** PORT 1 / PORT 2 ****/ 
	dbCreateParamInst(pcCellView m_lead_pair nil (-S:0) "MY" 1
		list(
		list("W" 	"float" WI)	 
		list("OPENING" 	"float" LOP_P)
		list("LEAD" 	"float" LEAD)
		list("TOP_ME" "string" "9")
		list("LEAD_ME" "string" "9")	
		list("P1TXT" "string" "P1")
		list("N1TXT" "string" "N1")
	))
	
	/**** PORT 3 / PORT 4 ****/ 
	dbCreateParamInst(pcCellView m_lead_pair nil OD:0 "R0" 1
		list(
		list("W" 	"float" WO)	 
		list("OPENING" 	"float" ROP)	 
		list("LEAD" 	"float" LEAD)
		list("TOP_ME" "string" "9")
		list("LEAD_ME" "string" "9")	
		list("P1TXT" "string" "P2")
		list("N1TXT" "string" "N2")
	))
	
	masterVias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout");

	rfvlsiEMDummyCreateParamInst(pcCellView masterVias nil (-LEAD-S):(-OD) "R0" 1
		list(
		list("Width" 	"float" 10.0)	 
		list("Length" 	"float" 2*OD)
		list("TOP_ME" 	"int" 1) 	
		list("BTM_ME" 	"int" 1)	 
	) 1)
	rfvlsiEMDummyCreateParamInst(pcCellView masterVias nil (OD+LEAD):(-OD) "MY" 1
		list(
		list("Width" 	"float" 10.0)	 
		list("Length" 	"float" 2*OD)
		list("TOP_ME" 	"int" 1) 	
		list("BTM_ME" 	"int" 1)	 
	) 1)
	rfvlsiEMDummyCreateParamInst(pcCellView masterVias nil (-LEAD-S):(OD-10.0) "R0" 1
		list(
		list("Width" 	"float" (OD+2*LEAD+S))	 
		list("Length" 	"float" 10.0)
		list("TOP_ME" 	"int" 1) 	
		list("BTM_ME" 	"int" 1)	 
	) 1)
	rfvlsiEMDummyCreateParamInst(pcCellView masterVias nil (-LEAD-S):(-OD+10.0) "MX" 1
		list(
		list("Width" 	"float" (OD+2*LEAD+S))	 
		list("Length" 	"float" 10.0)
		list("TOP_ME" 	"int" 1) 	
		list("BTM_ME" 	"int" 1)	 
	) ,1)	

	;rfvlsiEMVport("port1",-LEAD-S,LOP,-LEAD-S,LOP+WI,0,8,1);
	;rfvlsiEMVport("port2",-LEAD-S,-LOP,-LEAD-S,-LOP-WI,0,8,1);
	rfvlsiEMVport("port1",-LEAD-S,LOP_P,-LEAD-S,LOP_P+WI,0,8,1);
	rfvlsiEMVport("port2",-LEAD-S,-LOP_P,-LEAD-S,-LOP_P-WI,0,8,1);
	rfvlsiEMVport("port3",OD+LEAD,ROP,OD+LEAD,ROP+WO,0,8,1);
	rfvlsiEMVport("port4",OD+LEAD,-ROP,OD+LEAD,-ROP-WO,0,8,1);

	rfvlsiEMBoundary(-0.5*OD-10.0,-OD-10.0,-300.0,2*OD+20.0,2*OD+20.0,600.0,1)
	rfvlsiEMDie(-0.5*OD-5.0,-OD-5.0,2*OD+10.0,2*OD+10.0,1)	
	;rfvlsiEMBoundary(-0.5*OD-10.0-750,-OD-10.0-750,-300.0-750,2*OD+20.0+1500,2*OD+20.0+1500,600.0+1500,1)
	;rfvlsiEMDie(-0.5*OD-5.0-50,-OD-5.0-50,2*OD+10.0+100,2*OD+10.0+100,1)
	if(en_1to1 != t
	then
	rfvlsiEMVport("port5",OD+LEAD,-WI/2,OD+LEAD,WI/2,0,8,1);
	)
	
)/*end of let*/
)/*end of pcDefinePCell*/
