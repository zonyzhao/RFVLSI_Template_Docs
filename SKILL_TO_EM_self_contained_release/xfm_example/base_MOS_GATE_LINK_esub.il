/* Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Yu-Jiu Wang
*/
strCellName="base_MOS_GATE_LINK_esub";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
    (MOS_l 		"string"	"60n")
	(Finger		"int"	4)
    (DEVICE 	"string"	"nch_lvt")
	(GATE_BTM_ME_Length	"float"	0.38); default value is the minimum dual-contact size 
	(GATE_BTM_ME_Width	"float"	0.14); default value is the mininum dual-contact size
	(GATE_MID_ME_Length	"float"	0.38); default value is the minimum dual-contact size 
	(GATE_MID_ME_Width	"float"	0.14); default value is the mininum dual-contact size		
	(GATE_MID_METAL	"int"	3)	
	(GATE_TOP_METAL	"int"	5)		
	(GATE_Link_Width	"float"	0.38); default value is the mininum dual-contact size	
	(SDM_Length	"float"		0.3) ;new parameter added by taoyi
	(SDM_Stack_Length	"float"		0.38) ; default value is the minimum dual-contact size
	(SDM_Stack_Width	"float"		0.14) ; default value is the minimum dual-contact size 	
	(SDM_Link_Width	"float"		0.38) ; default value is the minimum dual-contact size 		
	(SD_TOP_METAL	"int"	3)
	(SP_INC	"string"	"0.04u")	
	(bSD_Stack	"boolean"	t)	
	(bSD_Link	"boolean"	t)
	(bGATE_Stack	"boolean"	t)	
	(bGATE_DualMetal	"boolean"	t)		
	(bDouble_CO	"boolean"	nil)	
)
let((techfile_lib techFileID ln PO_CO_UpDwn_Enc M1_CO_UpDwn_Enc SD_Spacing Pitch PolyToDevice M1_PO_ENC_DIFF master_vias_min master_vias
GATE_VIA_ENC VIAS_MIN),

	techfile_lib = techGetTechLibName(pcCellView~>lib) 
	techFileID = techGetTechFile(ddGetObj(techfile_lib))
	ln = 1M*cdfParseFloatString(MOS_l)
	ln=0.06
	PO_CO_UpDwn_Enc=0.04
	M1_CO_UpDwn_Enc=0.04
	SD_Spacing=DiffWidth(DEVICE)+0.04	
	Pitch=ln+SD_Spacing
	PolyToDevice=0.10
	;M1_PO_ENC_DIFF=(2*ln+SD_Spacing-2*ViaWidthVec(-1)-ViaOneRowSpacingVec(-1))/2
	
	master_vias_min = dbOpenCellViewByType(pcCellView~>lib "base_MOS_vias_min" "layout")	
	master_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout")		
;	dbCreateRect(pcCellView list("PO","drawing")  list((DiffWidth(device)/2):(-ViaWidthVec(-1)/2-PO_CO_UpDwn_Enc) (DiffWidth(device)/2+ln):(CoDiff(device)+ViaWidthVec(-1)/2)))
;	dbCreateRect(pcCellView list("PO","drawing")  list((-DiffWidth(device)/2-ln):(-ViaWidthVec(-1)/2-PO_CO_UpDwn_Enc) (-DiffWidth(device)/2):(CoDiff(device)+ViaWidthVec(-1)/2)))

if(!bGATE_Stack	; This effectively remove the effect of GATE_MID_ME_Length when we don't need it. 
	SDM_Length=SDM_Length-GATE_MID_ME_Length
)

; Creating Poly gate connectino for each two fnigers.
	rodCreateRect(
		?layer list("PO","drawing")
		?elementsX Finger
		?elementsY 1
		?spaceX SD_Spacing
		?spaceY Pitch
		?width	ln
		?length PolyToDevice
		?origin (-SD_Spacing/2-ln):(PO_CO_UpDwn_Enc+ViaWidthVec(-1)/2)
		?cvId	pcCellView
		)
			
		
; Creating Poly-to-Metal Via

if(!bDouble_CO then	 ; decide to place two CO or not. 	
	rodCreateRect(
		?layer ViaVec(-1)
		?elementsX floor(Finger/2)
		?elementsY 1
		?spaceX (2*Pitch-ViaWidthVec(-1))
		?spaceY 2*Pitch
		?width	ViaWidthVec(-1)
		?length ViaWidthVec(-1)
		?origin (-ViaWidthVec(-1)-ViaOneRowSpacingVec(-1)/2):(-ViaWidthVec(-1)/2)
		?cvId	pcCellView
		)
	rodCreateRect(
		?layer ViaVec(-1)
		?elementsX floor(Finger/2)
		?elementsY 1
		?spaceX (2*Pitch-ViaWidthVec(-1))
		?spaceY 2*Pitch
		?width	ViaWidthVec(-1)
		?length ViaWidthVec(-1)
		?origin (ViaOneRowSpacingVec(-1)/2):(-ViaWidthVec(-1)/2)
		?cvId	pcCellView
		)	
	rodCreateRect(
		?layer list("PO","drawing")
		?elementsX floor(Finger/2)
		?elementsY 1
		?spaceX (2*Pitch-SD_Spacing-2*ln)
		?spaceY 2*Pitch
		?width	(2*ln+SD_Spacing)
		?length ViaWidthVec(-1)+2*PO_CO_UpDwn_Enc
		?origin (-SD_Spacing/2-ln):(-ViaWidthVec(-1)/2-PO_CO_UpDwn_Enc)
		?cvId	pcCellView
		)	
	rodCreateRect(
		?layer MetalVec(0)
		?elementsX floor(Finger/2)
		?elementsY 1
		?spaceX (2*Pitch-SD_Spacing-2*ln+2*M1_PO_ENC_DIFF)
		?spaceY 2*Pitch
		?width	(2*ln+SD_Spacing-2*M1_PO_ENC_DIFF)
		?length ViaWidthVec(-1)+2*PO_CO_UpDwn_Enc
		?origin (-SD_Spacing/2-ln+M1_PO_ENC_DIFF):(-ViaWidthVec(-1)/2-PO_CO_UpDwn_Enc)
		?cvId	pcCellView
		)			
else
	rodCreateRect(
		?layer ViaVec(-1)
		?elementsX floor(Finger/2)
		?elementsY 2
		?spaceX (2*Pitch-ViaWidthVec(-1))
		?spaceY ViaOneRowSpacingVec(-1)
		?width	ViaWidthVec(-1)
		?length ViaWidthVec(-1)
		?origin (-ViaWidthVec(-1)-ViaOneRowSpacingVec(-1)/2):(-ViaWidthVec(-1)/2-ViaWidthVec(-1)-ViaOneRowSpacingVec(-1))
		?cvId	pcCellView
		)
		
	rodCreateRect(
		?layer ViaVec(-1)
		?elementsX floor(Finger/2)
		?elementsY 2
		?spaceX (2*Pitch-ViaWidthVec(-1))
		?spaceY ViaOneRowSpacingVec(-1)
		?width	ViaWidthVec(-1)
		?length ViaWidthVec(-1)
		?origin (ViaOneRowSpacingVec(-1)/2):(-ViaWidthVec(-1)/2-ViaWidthVec(-1)-ViaOneRowSpacingVec(-1))
		?cvId	pcCellView
		)		
		
	rodCreateRect(
		?layer list("PO","drawing")
		?elementsX floor(Finger/2)
		?elementsY 1
		?spaceX (2*Pitch-SD_Spacing-2*ln)
		?spaceY 2*Pitch
		?width	(2*ln+SD_Spacing)
		?length 2*ViaWidthVec(-1)+2*PO_CO_UpDwn_Enc+ViaOneRowSpacingVec(-1)
		?origin (-SD_Spacing/2-ln):(-ViaWidthVec(-1)/2-PO_CO_UpDwn_Enc-ViaWidthVec(-1)-ViaOneRowSpacingVec(-1))
		?cvId	pcCellView
		)
	rodCreateRect(
		?layer MetalVec(0)
		?elementsX floor(Finger/2)
		?elementsY 1
		?spaceX (2*Pitch-SD_Spacing-2*ln+2*M1_PO_ENC_DIFF)
		?spaceY 2*Pitch
		?width	(2*ln+SD_Spacing-2*M1_PO_ENC_DIFF)
		?length 2*ViaWidthVec(-1)+2*PO_CO_UpDwn_Enc+ViaOneRowSpacingVec(-1)
		?origin (-SD_Spacing/2-ln+M1_PO_ENC_DIFF):(-ViaWidthVec(-1)/2-PO_CO_UpDwn_Enc-ViaWidthVec(-1)-ViaOneRowSpacingVec(-1))
		?cvId	pcCellView
		)			
)		

	VIAS_MIN = master_vias_min

	GATE_VIA_ENC=(GATE_BTM_ME_Width-ViaMinEncWidthVec(GATE_MID_METAL-1,nil))/2
	
	dbCreateParamSimpleMosaic(pcCellView VIAS_MIN nil 0:M1_CO_UpDwn_Enc+ViaWidthVec(-1)/2 "MX" 1 floor(Finger/2) 2*Pitch 2*Pitch
	list(
		list("BTM_ME"	"int"	1)
		list("TOP_ME"	"int"	GATE_MID_METAL)
    	list("MetalExtention"	"float"	GATE_VIA_ENC)
    	list("Length"		"float"	GATE_BTM_ME_Length)
	);close list
	);close dbCreateParamInst

if(bGATE_Stack then	

	if(bGATE_DualMetal then
		dbCreateParamSimpleMosaic(pcCellView VIAS_MIN nil 0:M1_CO_UpDwn_Enc+ViaWidthVec(-1)/2-GATE_BTM_ME_Length "MX" 1 floor(Finger/2) 2*Pitch 2*Pitch
		list(
			list("BTM_ME"	"int"	GATE_MID_METAL)
			list("TOP_ME"	"int"	GATE_TOP_METAL-1)
			list("MetalExtention"	"float"	GATE_VIA_ENC)
			list("Length"		"float"	GATE_MID_ME_Length)
		);close list
		);close dbCreateParamInst	
		dbCreateParamInst(pcCellView master_vias nil (-GATE_BTM_ME_Width/2):M1_CO_UpDwn_Enc+ViaWidthVec(-1)/2-GATE_BTM_ME_Length "MX" 1
		list(
			list("Length" "float" GATE_MID_ME_Length)
			list("Width" "float" Pitch*(Finger-2)+GATE_BTM_ME_Width)
			list("TOP_ME" "float" GATE_TOP_METAL)	
			list("BTM_ME" "float" GATE_TOP_METAL-1)		
		);close list
		);close dbCreateParamInst 	
	else
		dbCreateParamSimpleMosaic(pcCellView VIAS_MIN nil 0:M1_CO_UpDwn_Enc+ViaWidthVec(-1)/2-GATE_BTM_ME_Length "MX" 1 floor(Finger/2) 2*Pitch 2*Pitch
		list(
			list("BTM_ME"	"int"	GATE_MID_METAL)
			list("TOP_ME"	"int"	GATE_TOP_METAL)
			list("MetalExtention"	"float"	GATE_VIA_ENC)
			list("Length"		"float"	GATE_MID_ME_Length)
		);close list
		);close dbCreateParamInst	
		dbCreateParamInst(pcCellView master_vias nil (-GATE_BTM_ME_Width/2):M1_CO_UpDwn_Enc+ViaWidthVec(-1)/2-GATE_BTM_ME_Length "MX" 1
		list(
			list("Length" "float" GATE_MID_ME_Length)
			list("Width" "float" Pitch*(Finger-2)+GATE_BTM_ME_Width)
			list("TOP_ME" "float" GATE_TOP_METAL)	
			list("BTM_ME" "float" GATE_TOP_METAL)		
		);close list
		);close dbCreateParamInst 	
	)

else
;	if(Finger>=2 then 
;	dbCreateRect(pcCellView MetalVec(GATE_MID_METAL-1)  list(0:M1_CO_UpDwn_Enc+ViaWidthVec(-1)/2 Pitch*(Finger-2):M1_CO_UpDwn_Enc+ViaWidthVec(-1)/2-GATE_Link_Width));
;	) ; Link all gates using GATE_MID_METAL
	
	dbCreateParamInst(pcCellView master_vias nil (-GATE_BTM_ME_Width/2):M1_CO_UpDwn_Enc+ViaWidthVec(-1)/2-GATE_Link_Width "R0" 1
	list(
		list("Length" "float" GATE_Link_Width)
		list("Width" "float" Pitch*(Finger-2)+GATE_BTM_ME_Width)
		list("TOP_ME" "float" GATE_TOP_METAL)	
		list("BTM_ME" "float" GATE_MID_METAL)		
	);close list
	);close dbCreateParamInst 	
)
if(bSD_Link then	
	dbCreateParamSimpleMosaic(pcCellView VIAS_MIN nil (-Pitch):PolyToDevice+M1_CO_UpDwn_Enc+ViaWidthVec(-1)/2 "MX" 1 (floor(Finger/2)+1) 2*Pitch 2*Pitch
	list(
		list("BTM_ME"	"int"	1)
		list("TOP_ME"	"int"	1)
    	list("MetalExtention"	"float" 0.0)
    	list("Length"		"float"	PolyToDevice+GATE_BTM_ME_Length+GATE_MID_ME_Length+SDM_Length)
	);close list
	);close dbCreateParamInst
)
	
;Create SD-Metal Stack
	if(bSD_Stack then	
	dbCreateParamSimpleMosaic(pcCellView VIAS_MIN nil (-Pitch):(M1_CO_UpDwn_Enc+ViaWidthVec(-1)/2-GATE_BTM_ME_Length-SDM_Length-GATE_MID_ME_Length) "MX" 1 (floor(Finger/2)+1) 2*Pitch 2*Pitch
	list(
		list("BTM_ME"	"int"	1)
		list("TOP_ME"	"int"	SD_TOP_METAL-1)
    	list("MetalExtention"	"float"	(SDM_Stack_Width-ViaWidthVec(0))/2)
    	list("Length"		"float"	SDM_Stack_Length)
	);close list
	);close dbCreateParamInst

	)
)/*end of let*/
)/*end of pcDefinePCell*/

