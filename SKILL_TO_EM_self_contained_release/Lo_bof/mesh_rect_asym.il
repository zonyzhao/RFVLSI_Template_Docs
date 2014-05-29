
strCellName = "mesh_rect_asym"

pcDefinePCell(list(ddGetObj(strLibName),strCellName, "layout"),
(
		(Length  "float" 30.0)
		(Width "float"   7.0)
		(TOP_ME   "int" 3)
		(BTM_ME   "int" 1)
		(len_VoidL   "float" 0.5)
		(len_VoidW	"float" 0.5)
		(len_FillL   "float" 0.5)
		(len_FillW   "float" 0.5)
		(bPP	"boolean" t);modified by ywang on 2014/03/23		
		(bEMExportSimplification "boolean" t)
)
let((PitchY PitchX num_Horz_Holes num_Vert_Holes len_Horz_Edge len_Vert_Edge delta_Horz delta_Vert master rectHorz1 n rectHorzN
rectVert1 m rectVertN),
	if(BTM_ME<1
	then
		if(bPP
		then
			dbCreateRect(pcCellView list("PP","drawing") list((-PP_ext):(-PP_ext) (Width+PP_ext):(Length+PP_ext)))
			dbCreateRect(pcCellView list("PDK","drawing") list(0:0 Width:Length))		
		else
			dbCreateRect(pcCellView list("NP","drawing") list((-PP_ext):(-PP_ext) (Width+PP_ext):(Length+PP_ext)))
			dbCreateRect(pcCellView list("NW","drawing") list((-NW_ENC):(-NW_ENC) (Width+NW_ENC):(Length+NW_ENC)))
	))
	
	master=dbOpenCellViewByType(pcCellView~>lib "vias" "layout")	;get the master view of "vias"

/*Dafault values of pcell parameters if no CDF parameters are retrieved. */
/*Technology default unit are um*/

	PitchY=len_VoidL+len_FillL	; repetitive pitch dimension
	PitchX=len_VoidW+len_FillW	; repetitive pitch dimension

num_Vert_Holes= floor((Length-len_FillL)/PitchY)
num_Horz_Holes= floor((Width-len_FillW)/PitchX)

if(((bEMExportSimplification==t)&&(rfvlsi_em_export!=0)) then
	num_Horz_Holes=0;
	num_Vert_Holes=0;
) ; added by ywang on 20120422

len_Vert_Edge= (Length-num_Vert_Holes*len_VoidL - (num_Vert_Holes-1)*len_FillL)/2
len_Horz_Edge= (Width-num_Horz_Holes*len_VoidW - (num_Horz_Holes-1)*len_FillW)/2

delta_Vert=len_Vert_Edge-len_FillL
delta_Horz=len_Horz_Edge-len_FillW

if((num_Vert_Holes<1) len_Vert_Edge=Length)
if((num_Horz_Holes<1) len_Horz_Edge=Width)


/* --------------------------------  Left Horizontal Metals & Vias -------------------------------  */
	;Placing a left ROD object for handle
	rectHorz1=rodCreateRect(
	?layer MetalVec((TOP_ME-1))
	?length	Length
	?width	len_Horz_Edge
	?origin 0:0
	?cvId	pcCellView
	);
	
	if((num_Vert_Holes>0) ;Note, special case -> No holes in vertical direction. 
		dbCreateParamInst(pcCellView master  nil 0:len_Vert_Edge "R0" 1 
		list(list("Length"  "float" (Length-2*len_Vert_Edge))
			list("Width" 	"float" len_Horz_Edge)
			list("TOP_ME"	"int" 	TOP_ME)
			list("BTM_ME"   "int" 	BTM_ME)
			list("bPP"   "boolean" 	bPP)
			)); /*end of dbCreateParamInst/	
	); end of IF
		
	if((num_Horz_Holes > 0) ;Note, special case -> No holes in vertical direction. 
			if((num_Horz_Holes>1)&&(num_Vert_Holes>0) ;if we have more than 2 holes, place vias in "Center", 
				
					dbCreateParamSimpleMosaic(pcCellView master nil (delta_Horz+PitchX):len_Vert_Edge "R0" 1
					(num_Horz_Holes-1) PitchY PitchX
					list(list("Length"  "float" (Length-2*len_Vert_Edge))
					list("Width" 	"float" len_FillW)
					list("TOP_ME"	"int" 	TOP_ME)
					list("BTM_ME"   "int" 	BTM_ME)
					list("bPP"   "boolean" 	bPP))
					);dbCreateParamSimpleMosaic	
					
			) ;end of IF

			rectHorzN=rodCreateRect(
			?layer MetalVec((TOP_ME-1))
			?length	Length
			?width	len_Horz_Edge
			?origin (Width-len_Horz_Edge):0
			?cvId	pcCellView
			);  Right metal handle
	);end of IF	

/* --------------------------------  Bottom Handle Metals & Vias -------------------------------  */	
	rectVert1=rodCreateRect(
	?layer MetalVec((TOP_ME-1))
	?length	len_Vert_Edge
	?width	Width
	?origin 0:0
	?cvId	pcCellView
	);
	dbCreateParamInst(pcCellView master  nil 0:0 "R0" 1 
	list(list("Length"  "float" len_Vert_Edge)
		list("Width" 	"float" Width)
		list("TOP_ME"	"int" 	TOP_ME)
		list("BTM_ME"   "int" 	BTM_ME)
		list("bPP"   "boolean" 	bPP)
		)); /*end of dbCreateParamInst/


	for(m (BTM_ME-1) (TOP_ME-1)
		if((num_Vert_Holes > 0)&&((num_Vert_Holes-1)>0)
		then
			dbCreateParamSimpleMosaic(pcCellView master nil (delta_Horz+len_FillW):(len_Vert_Edge+len_FillL) "R0" (num_Vert_Holes-1)
				num_Horz_Holes PitchY PitchX
				list(list("Length"  "float" len_FillL)
				list("Width" 	"float" len_VoidW)
				list("TOP_ME"	"int" 	TOP_ME)
				list("BTM_ME"   "int" 	BTM_ME)
				list("bPP"   "boolean" 	bPP))
			);dbCreateParamSimpleMosaic			
		); end of IF
		
		rectVertN=rodCreateRect(
			?layer MetalVec(m)
			?length	len_Vert_Edge
			?width	Width
			?origin 0:(Length-len_Vert_Edge)
			?cvId	pcCellView
			);		
	); end of FOR

/* 	---------------   This section starts placing vias  -------------    */

	if((num_Vert_Holes>0)
	dbCreateParamInst(pcCellView master  nil (Width-len_Horz_Edge):len_Vert_Edge "R0" 1 
	list(list("Length"  "float" (Length-2*len_Vert_Edge))
		list("Width" 	"float" len_Horz_Edge)
		list("TOP_ME"	"int" 	TOP_ME)
		list("BTM_ME"   "int" 	BTM_ME)
		list("bPP"   "boolean" 	bPP)
		)); /*end of dbCreateParamInst/	
	);end of IF


	dbCreateParamInst(pcCellView master  nil 0:(Length-len_Vert_Edge) "R0" 1 
	list(list("Length"  "float" len_Vert_Edge)
		list("Width" 	"float" Width)
		list("TOP_ME"	"int" 	TOP_ME)
		list("BTM_ME"   "int" 	BTM_ME)
		list("bPP"   "boolean" 	bPP)
		)); /*end of dbCreateParamInst/		

/*      ---------- Staring assinging handles    --------------   */

	rodAssignHandleToParameter(
	?parameter "Width"
	?rodObj rectHorz1
	?displayName "width"
	?displayExpression "Width"
	?handleName list("upperLeft","centerLeft","lowerLeft")
	?stretchType "relative"
	?moveOrigin t
	?stretchDir "x"
	?userFunction "std_CB"
	) 
	
	rodAssignHandleToParameter(
	?parameter "Length"
	?rodObj rectVert1
	?displayName "length"
	?displayExpression "Length"
	?handleName list("lowerLeft","lowerCenter","lowerRight")
	?stretchType "relative"
	?moveOrigin t
	?stretchDir "y"
	?userFunction "std_CB"
	) 
	
)/*end of let*/
)/*end of pcDefinePCell*/
