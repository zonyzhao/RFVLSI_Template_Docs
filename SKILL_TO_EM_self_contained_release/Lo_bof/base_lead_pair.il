	/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
		Intended for Internal Use Only, All Rights Reserved, 2012 
		*DO NOT DISCLOSE*
		Author : Tao-Yi Lee */
	
strCellName="base_lead_pair"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W 	"float" 2.0)	 
	(OPENING 	"float" 20.0)	 
	(LEAD 	"float" 20.0)	 	
	(TOP_ME "string" "9")
	(LEAD_ME "string" "9")	
	(dummy "boolean" t)
	(P1TXT "string" "P1")
	(N1TXT "string" "N1")
)
let((m_lead m_vias TM LM),
	
	m_lead = dbOpenCellViewByType(pcCellView~>lib "base_lead" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )
	TM = atoi(TOP_ME) 
	LM = atoi(LEAD_ME)
	/**** LEAD UNDER PASS ****/ 
	dbCreateParamInst(pcCellView m_lead nil 0:OPENING "R0" 1
		list(
		list("L" "float" LEAD) 
		list("W" "float" W) 
		list("WD" "float" 1.0) 
		list("PINTXT" "string" P1TXT) 
		list("PINP" "string" "dummy1")
		list("TOP_ME" "string" LEAD_ME)
		list("BTM_ME" "string" LEAD_ME)
		list("DUMMYL" "string" "RFVLSI")
		list("dummy" "boolean" dummy)
	))
	
	dbCreateParamInst(pcCellView m_lead nil 0:-OPENING-W "R0" 1
		list(
		list("L" "float" LEAD) 
		list("W" "float" W) 
		list("WD" "float" 1.0) 
		list("PINTXT" "string" N1TXT)
		list("PINP" "string" "dummy1") 
		list("TOP_ME" "string" LEAD_ME)
		list("BTM_ME" "string" LEAD_ME)
		list("DUMMYL" "string" "RFVLSI")
		list("dummy" "boolean" dummy)
	))
	
	if(TM != LM /* via */
	then
		dbCreateParamInst(pcCellView m_vias nil 0:OPENING "R0" 1 
			list(
			list("Width" "float" W) 
			list("Length" "float" W) 
			list("TOP_ME" "int" TM) 
			list("BTM_ME" "int" LM)
		))
		dbCreateParamInst(pcCellView m_vias	nil 0:-OPENING-W "R0" 1
			list(
			list("Width" "float" W)
			list("Length" "float" W)
			list("TOP_ME" "int" TM)
			list("BTM_ME" "int" LM)
		))
	)
)/*end of let*/
)/*end of pcDefinePCell*/