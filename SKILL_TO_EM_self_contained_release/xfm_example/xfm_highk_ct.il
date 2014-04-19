/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="xfm_highk_ct"
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
    (balun_str "string" "xfm_highk_ct")

)
let((),
	dbCreateParamInst(pcCellView 
		dbOpenCellViewByType(pcCellView~>lib "xfm_highk" "layout" );
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
		))
    dbCreateLabel(pcCellView, list("RFVLSI", "dummy1"), OD-WI/2-WO-S:0, "CT", "centerCenter", "R0", "roman", WO)
    dbCreateRect(pcCellView, list("RFVLSI", "dummy1"), list(OD-WI-WO-S:-WI/2 OD-WO-S:WI/2))
))

