
strCellName="vias"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 5.0)
	(Width "float"   5.0)
	(TOP_ME	  "int" 2)
	(BTM_ME   "int" 1)
	(bPP	"boolean" t)
	(conservative	"boolean" t)
	(x_cut	"boolean" nil)
	(y_cut	"boolean" nil)
	;(force_drc	"boolean" t) % removed by YWANG on 2013/02/24, it is not a good idea not to place vias!!!, because it might cause chip failure.
)
let((netx Pitch num_Horz_Vias num_Vert_Vias len_Horz_Edge len_Vert_Edge m PP_ext NP_ext enc_prime),

	PP_ext=0.02;  ;vias OD PP extensions
	NP_ext=0.13;  ;vias OD NP extensions
	NW_ENC=0.16	
	rectOutline=rodCreateRect(
                ?layer MetalVec(TOP_ME-1)
                ?length Length
                ?width  Width
                ?origin 0:0 
                ?cvId   pcCellView
                );  

	rodAssignHandleToParameter(
		?parameter "Width"
		?rodObj rectOutline
		?displayName "width"
		?displayExpression "Width"
		?handleName list("upperLeft","centerLeft","lowerLeft","upperRight","centerRight","lowerRight")
		?stretchType "relative"
		?moveOrigin t
		?stretchDir "x"
		?userFunction "std_CB"
	) 
	rodAssignHandleToParameter(
		?parameter "Length"
		?rodObj rectOutline
		?displayName "Length"
		?displayExpression "Length"
		?handleName list("upperLeft","upperCenter","upperRight","lowerLeft","lowerCenter","lowerRight")
		?stretchType "relative"
		?moveOrigin t
		?stretchDir "y"
		?userFunction "std_CB"
	) ; end rodAssignHandleToParameter	

	if(BTM_ME<1
	then
		if(bPP
		then
			dbCreateRect(pcCellView list("PP","drawing") list((-PP_ext):(-PP_ext) (Width+PP_ext):(Length+PP_ext)))
		else
			dbCreateRect(pcCellView list("NP","drawing") list((-PP_ext):(-PP_ext) (Width+PP_ext):(Length+PP_ext)))
			dbCreateRect(pcCellView list("NW","drawing") list((-NW_ENC):(-NW_ENC) (Width+NW_ENC):(Length+NW_ENC)))
	))

	/* Top Metal has been plotted */
	for(m	(BTM_ME-1)	(TOP_ME-2)

		dbCreateRect(pcCellView MetalVec(m) list(0:0 Width:Length))
		enc_prime = ViaEncVec(m)

		if(conservative
		then	/* conservative mode */
			/* edge enclosures are round to grid (TYLEE 4/16) */
			enc_prime = max(ViaEncVec(m) ViaSpacingVec(m)/2) ; take spacing rules into consideration (TYLEE 4/16)
		)
		
		Pitch = ViaWidthVec(m)+ViaSpacingVec(m); via pitch
		num_Horz_Vias = floor((Width-2*enc_prime + ViaSpacingVec(m))/Pitch) 
		
		if(x_cut
		then
			num_Horz_Vias = floor((Width + ViaSpacingVec(m))/Pitch) 
		)
		num_Horz_Vias= max(num_Horz_Vias 1)
	
		; Calculating number of vertical vias. added back by ywang on 2012/05/20
	
		num_Vert_Vias = floor((Length-2*enc_prime + ViaSpacingVec(m))/Pitch)		
		if(y_cut
		then
			num_Vert_Vias = floor((Length + ViaSpacingVec(m))/Pitch)
		)
		num_Vert_Vias = max(num_Vert_Vias 1) ; added back ty ywang on 2012/05/20
		
		/* edge enclosures are round to grid (TYLEE 4/16) */
		len_Horz_Edge = roundtogrid((Width-num_Horz_Vias*ViaWidthVec(m) - (num_Horz_Vias-1)*ViaSpacingVec(m))/2)
		len_Vert_Edge = roundtogrid((Length-num_Vert_Vias*ViaWidthVec(m) - (num_Vert_Vias-1)*ViaSpacingVec(m))/2)

		if((rfvlsi_em_export == 0) /* added by ywang on 20120422 */
		then
			if(num_Vert_Vias>0 && num_Horz_Vias >0
			then
			rectHorz=rodCreateRect(
				?layer ViaVec(m)
				?elementsX num_Horz_Vias
				?elementsY num_Vert_Vias
				?spaceX ViaSpacingVec(m)
				?spaceY ViaSpacingVec(m)
				?width	ViaWidthVec(m)
				?length ViaWidthVec(m)
				?origin len_Horz_Edge:len_Vert_Edge
				?cvId	pcCellView
			)
			)
		else
			rectHorz=rodCreateRect(
				?layer ViaVec(m)
				?elementsX 1
				?elementsY 1
				?spaceX ViaSpacingVec(m)
				?spaceY ViaSpacingVec(m)
				?width	Width
				?length Length
				?origin 0:0
				?cvId	pcCellView
				)
		)
	)

)/*end of let*/
)/*end of pcDefinePCell*/
