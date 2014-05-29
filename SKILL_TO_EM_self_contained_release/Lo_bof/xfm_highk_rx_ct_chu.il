/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */

strCellName="xfm_highk_rx_ct_chu"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD     "float" 150.0)
    (WI     "float" 4.0)
    (WO     "float" 2.0)
    (LOP    "float" 15.0)
    (ROP    "float" 7.0)
    (LEAD   "float" 10.0)
    (LEADDYI    "float" 0.0)
    (LEADDYO    "float" 0.0)
    (S  "float" 2.05)
    (en_dmy "boolean" t)
    (en_NTN "boolean" t)
    (balun_str "string" "xfm_highk_rx")
	(en_HighK "boolean"	nil)
	(en_ct2 "boolean" t)

)
let((),
	dbCreateParamInst(pcCellView 
		dbOpenCellViewByType(pcCellView~>lib "xfm_highk_rx_chu" "layout" );
		nil 0:0 "R0" 1  
		list(
			list("OD" 	"float" 	OD) 
			list("WI"	"float" 	WI)	
			list("WO"	"float" 	WO)	
			list("S"	"float"		S) 
			list("LOP"	"float" LOP) 
			list("ROP"	"float" ROP) 
      		list("LEAD"   "float" LEAD) 
      		list("LEADDYI"   "float" LEADDYI) 
        	list("LEADDYO"   "float" LEADDYO) 
        	list("en_dmy"   "boolean" en_dmy)
			list("balun_str" "string" balun_str)
			list("en_NTN" 	"boolean"	en_NTN)
			list("en_HighK" "boolean"   en_HighK)
		))
	m_lead = dbOpenCellViewByType(pcCellView~>lib "base_lead" "layout" )
    dbCreateLabel(pcCellView, list("RFVLSI", "dummy1"), OD:0, "CT", "centerCenter", "R0", "roman", WO)
	if(en_ct2 
	then
	masterVias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout");
	dbCreateParamInst(pcCellView masterVias nil OD-(WI+WO+2*S)-WO:-WO/2 "R0" 1
		list(
		list("Width" 	"float" WO)	 
		list("Length" 	"float" WO)
		list("TOP_ME" 	"int" 9) 	
		list("BTM_ME" 	"int" 8)	 
	))
	dbCreateParamInst(pcCellView masterVias nil OD-WO:-WO/2 "R0" 1
		list(
		list("Width" 	"float" WO)	 
		list("Length" 	"float" WO)
		list("TOP_ME" 	"int" 9) 	
		list("BTM_ME" 	"int" 8)	 
	))
	;dbCreateRect(pcCellView, MetalVec(8), list(OD-WO:-WO/2 OD+LEAD:WO/2))
	dbCreateParamInst(pcCellView m_lead nil OD-WO:-WI/2 "R0" 1
		list(
		list("L" 	"float" LEAD+WO)	 
		list("W" 	"float" WI)	 
		list("TOP_ME" "string" "9")
		list("LEAD_ME" "string" "9")	
		list("PINTXT" "string" "ct")
	))
	dbCreateRect(pcCellView, MetalVec(7), list(OD-(WI+WO+2*S):-WO/2 OD:WO/2))
	else
	dbCreateParamInst(pcCellView m_lead nil OD-WO-S:-WI/2 "R0" 1
		list(
		list("L" 	"float" LEAD+WO+S)	 
		list("W" 	"float" WI)	 
		list("TOP_ME" "string" "9")
		list("LEAD_ME" "string" "9")	
		list("PINTXT" "string" "ct")
	))
	)
	dbCreateRect(pcCellView, list("RFVLSI", "drawing"),	list(OD:-WI/2 OD+LEAD-0.1:WI/2))

))
