/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="xfm_highk"
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
	(en_dmy "boolean" t)
	(en_NTN "boolean" t)
	(balun_str "string" "xfm_highk")
)
let((PI PO masterp masters masterL masterUD LOP M8_S pi C C2 m_lead_pair),
	PI=WI+S	; Line pitch: width + space
	PO=WO+S	; Line pitch: width + space
	M8_S = 3.0
	pi=3.141592
	C=roundtogrid(WO*tan(pi/8))
	C2=roundtogrid(C/sqrt(2))
	LOP = WO+WI/2+S+C2+M8_S
	masterp = dbOpenCellViewByType(pcCellView~>lib "base_xfm_highk_pri" "layout" );
	masters = dbOpenCellViewByType(pcCellView~>lib "base_balun_sec" "layout" );
	masterL = dbOpenCellViewByType(pcCellView~>lib "base_xfm_lead" "layout" );
	masterUD= dbOpenCellViewByType(pcCellView~>lib "base_ind_under" "layout")
	m_lead_pair = dbOpenCellViewByType(pcCellView~>lib "base_xfm_lead_pair" "layout" )	
	
	if(en_dmy
	then
		dbCreateLabel(pcCellView, list("RFVLSI","drawing"), OD/2:0, balun_str, "centerCenter", "R0", "roman", 2*PI)
	)

	dbCreateLabel(pcCellView, list("RFVLSI", "dummy6"), OD/2:3, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 2)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy7"), OD/2:7, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 2)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy8"), OD/2:11, sprintf(nil "%L" WI), "centerCenter", "R0", "roman", 2)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy9"), OD/2:15, sprintf(nil "%L" WO), "centerCenter", "R0", "roman", 2)


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
	))

	dbCreateParamInst(pcCellView masters nil PO:0 "R0" 1
		list(
		list("OD"   "float"     OD-2*PO) 
		list("WI"    "float"     WI)
		list("WO"    "float"     WO)
		list("S"    "float"     S)
		list("LEADDYI"   "float" LEADDYI)
		list("LEADDYO"   "float" LEADDYO)
		list("TOP_ME" "string" "9")
		list("text" "string" balun_str)
		list("LOP"  "float" LOP)
	))


	dbCreateParamInst(pcCellView masterUD nil PO:LOP "R90" 1
		list(	; under pass 1
		list("W"   "float" WI)  
		list("WX"   "float" WI)  
		list("S"   "float" 2*S+WO)  
		list("NT"   "int" 1)  
		list("TOP_ME" "string" "9")
		list("BTM_ME" "string" "8")
		list("en_dmy" "boolean" t)
		list("vias" "boolean" t)
		list("top" "boolean" t))
	)
	dbCreateParamInst(pcCellView masterUD nil PO:-LOP-WI "R90" 1 
		list(	; under pass 2
		list("W"   "float" WI)  
		list("WX"   "float" WI)  
		list("S"   "float" 2*S+WO)  
		list("NT"   "int" 1)  
		list("TOP_ME" "string" "9")
		list("BTM_ME" "string" "8")
		list("en_dmy" "boolean" t)
		list("vias" "boolean" t)
		list("top" "boolean" t))
	)
	
	/**** PORT 1 / PORT 2 ****/ 
	dbCreateParamInst(pcCellView m_lead_pair nil (-S:0) "MY" 1
		list(
		list("W" 	"float" WI)	 
		list("OPENING" 	"float" LOP)	 
		list("LEAD" 	"float" LEAD)
		list("TOP_ME" "string" "9")
		list("LEAD_ME" "string" "9")	
		list("dummy" "boolean" en_dmy)
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
		list("dummy" "boolean" en_dmy)
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
	rfvlsiEMHportXY("port1",-LEAD-S,-LOP,-LEAD-S+10.0,LOP,8,"+Y",1); rfvlsiEMHport("port1",X0,Y0,X1,Y1, iMetal, bFlip, Priority)

	;rfvlsiEMVport("port3",OD+LEAD,ROP,OD+LEAD,ROP+WO,0,8,1);
	;rfvlsiEMVport("port4",OD+LEAD,-ROP,OD+LEAD,-ROP-WO,0,8,1);
	rfvlsiEMHport("port2",OD,-LOP,OD+LEAD,-LOP,8,t,1);rfvlsiEMHport("port1",X0,Y0,X1,Y1, iMetal, bFlip, Priority)
	;rfvlsiEMHport("port2",OD+LEAD,-LOP,OD+LEAD,LOP,8,t,1);rfvlsiEMHport("port1",X0,Y0,X1,Y1, iMetal, bFlip, Priority)
	rfvlsiEMBoundary(-0.5*OD-10.0,-OD-10.0,-300.0,2*OD+20.0,2*OD+20.0,600.0,1)
	rfvlsiEMDie(-0.5*OD-5.0,-OD-5.0,2*OD+10.0,2*OD+10.0,1)
	
)/*end of let*/
)/*end of pcDefinePCell*/
