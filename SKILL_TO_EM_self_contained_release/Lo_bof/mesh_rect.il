
strCellName  =  "mesh_rect"

pcDefinePCell(list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 30.0)
	(Width "float"   7.0)
	(TOP_ME   "int" 3)
	(BTM_ME   "int" 1)
	(len_Void   "float" 0.5)
	(len_Fill   "float" 0.5)
	(bPP	"boolean" t)
	(bEMExportSimplification "boolean" t)
)
let((Pitch num_Horz_Holes num_Vert_Holes len_Horz_Edge len_Vert_Edge delta_Horz delta_Vert master rectHorz1 n rectHorzN
rectVert1 m rectVertN inst2 inst3 rodinst rodinst3),

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
	Pitch = len_Void+len_Fill	; repetitive pitch dimension
	num_Horz_Holes =  floor((Width-len_Fill)/Pitch)
	num_Vert_Holes =  floor((Length-len_Fill)/Pitch)
	if(bEMExportSimplification && (rfvlsi_em_export != 0) 
	then
		num_Horz_Holes = 0;
		num_Vert_Holes = 0;
	) ; added by ywang on 20120422

	len_Horz_Edge =  roundtogrid((Width-num_Horz_Holes*len_Void - (num_Horz_Holes-1)*len_Fill)/2)
	len_Vert_Edge =  roundtogrid((Length-num_Vert_Holes*len_Void - (num_Vert_Holes-1)*len_Fill)/2)
	delta_Horz = len_Horz_Edge-len_Fill
	delta_Vert = len_Vert_Edge-len_Fill

	if((num_Horz_Holes<1) len_Horz_Edge = Width)
	if((num_Vert_Holes<1) len_Vert_Edge = Length)
	
	master = dbOpenCellViewByType(pcCellView~>lib "vias" "layout")	;get the master view of "vias"

/* --------------------------------  Left Horizontal Metals & Vias -------------------------------  */
	;Placing a left ROD object for handle
	rectHorz1 = rodCreateRect(
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
		let(()
			if((num_Horz_Holes>1)&&(num_Vert_Holes>0) ;if we have more than 2 holes, place vias in "Center", 
					dbCreateParamSimpleMosaic(pcCellView master nil (delta_Horz+Pitch):len_Vert_Edge "R0" 1
					(num_Horz_Holes-1) Pitch Pitch
					list(list("Length"  "float" (Length-2*len_Vert_Edge))
					list("Width" 	"float" len_Fill)
					list("TOP_ME"	"int" 	TOP_ME)
					list("BTM_ME"   "int" 	BTM_ME)
					list("bPP"   "boolean" 	bPP))
					);dbCreateParamSimpleMosaic
			) ;end of IF

			rectHorzN = rodCreateRect(
			?layer MetalVec((TOP_ME-1))
			?length	Length
			?width	len_Horz_Edge
			?origin (Width-len_Horz_Edge):0
			?cvId	pcCellView
			);  Right metal handle
		);end of LET
	);end of IF	

/* --------------------------------  Bottom Handle Metals & Vias -------------------------------  */	
;	rectVert1 = rodCreateRect(
;	?layer MetalVec((TOP_ME-1))
;	?length	len_Vert_Edge
;	?width	Width
;	?origin 0:0
;	?cvId	pcCellView
;	);

	inst  = dbCreateParamInst(pcCellView master  nil 0:0 "R0" 1 
	list(list("Length"  "float" len_Vert_Edge)
		list("Width" 	"float" Width)
		list("TOP_ME"	"int" 	TOP_ME)
		list("BTM_ME"   "int" 	BTM_ME)
		list("bPP"   "boolean" 	bPP)
		)); /*end of dbCreateParamInst/
	rectVert1 = rodGetObj(inst)
	
	if(((num_Vert_Holes-1)>=1)&&(num_Horz_Holes>=1) then
		dbCreateParamSimpleMosaic(pcCellView master nil (delta_Horz+len_Fill):(len_Vert_Edge+len_Void) "R0" (num_Vert_Holes-1)
			num_Horz_Holes Pitch Pitch
			list(list("Length"  "float" len_Fill)
			list("Width" 	"float" len_Void)
			list("TOP_ME"	"int" 	TOP_ME)
			list("BTM_ME"   "int" 	BTM_ME)
			list("bPP"   "boolean" 	bPP))
		);dbCreateParamSimpleMosaic	
	)
	rectVertN = rodCreateRect(
	?layer MetalVec(TOP_ME-1)
	?length	len_Vert_Edge
	?width	Width
	?origin 0:(Length-len_Vert_Edge)
	?cvId	pcCellView
	);	

/* 	---------------   This section starts placing vias  -------------    */

	if(num_Vert_Holes>0
	then

	inst2 = dbCreateParamInst(pcCellView master  nil (Width-len_Horz_Edge):len_Vert_Edge "R0" 1 
		list(list("Length"  "float" (Length-2*len_Vert_Edge))
		list("Width" 	"float" len_Horz_Edge)
		list("TOP_ME"	"int" 	TOP_ME)
		list("BTM_ME"   "int" 	BTM_ME)
		list("bPP"   "boolean" 	bPP)		
		)); /*end of dbCreateParamInst/	

	rodinst2 = rodGetObj(inst2)

    rodAssignHandleToParameter(
    ?parameter "Width"
    ?rodObj rodinst2
    ?displayName "Width"
    ?displayExpression "Width"
    ?handleName list("centerRight")
    ?stretchType "relative"
    ?moveOrigin t
    ?stretchDir "x"
    ?userFunction "std_CB"
    )

	);end of IF


	inst3 = dbCreateParamInst(pcCellView master  nil 0:(Length-len_Vert_Edge) "R0" 1 
	list(list("Length"  "float" len_Vert_Edge)
		list("Width" 	"float" Width)
		list("TOP_ME"	"int" 	TOP_ME)
		list("BTM_ME"   "int" 	BTM_ME)
		list("bPP"   "boolean" 	bPP)		
		)); /*end of dbCreateParamInst/		
	rodinst3 = rodGetObj(inst3)

	rodAssignHandleToParameter(
    ?parameter "Length"
    ?rodObj rodinst3
    ?displayName "Length"
    ?displayExpression "Length"
    ?handleName list("upperLeft","upperCenter","upperRight")
    ?stretchType "relative"
    ?moveOrigin t
    ?stretchDir "y"
    ?userFunction "std_CB"
    )


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
