
strCellName="vias_diagonal";	  /*Assign your cell name to variable strCellName*/
strViewName="layout";     /*Assign your view name to variable strViewName*/

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 5.0)
	(Width "float"   5.0)
	(TOP_ME	  "int" 2)
	(BTM_ME   "int" 1)
)
let((netx Pitch num_Horz_Vias num_Vert_Vias len_Horz_delta len_Horz_Edge len_Vert_Edge m n),

	for(m	BTM_ME	TOP_ME
		rectOutline=rodCreatePolygon(
			?layer MetalVec(m-1)
			?pts list(0:0 Width:0 (Width+Length):Length Length:Length)
			?cvId	pcCellView
		);
	)
	for(m	(BTM_ME-1)	(TOP_ME-2)
	
		Pitch=ViaWidthVec(m)+ViaSpacingVec(m); via pitch
	
		num_Vert_Vias= floor((Length-2*ViaEncVec(m)+ViaSpacingVec(m))/Pitch)
		len_Vert_Edge= roundtogrid((Length-num_Vert_Vias*ViaWidthVec(m) - (num_Vert_Vias-1)*ViaSpacingVec(m))/2)
		num_Horz_Vias= floor((Width-2*ViaDiagonalEncVec(m)+ViaSpacingVec(m)-ViaWidthVec(m))/Pitch)
		len_Horz_delta= roundtogrid((Width-num_Horz_Vias*ViaWidthVec(m) - (num_Horz_Vias-1)*ViaSpacingVec(m)-2*ViaDiagonalEncVec(m)-ViaWidthVec(m))/2)
		len_Horz_Edge= len_Horz_delta + len_Vert_Edge + ViaWidthVec(m)+ ViaDiagonalEncVec(m) 

		if( (num_Horz_Vias <= 0) num_Horz_Vias=1)	; deliberately putting an erroreous layout which will be catched at DRC
		if( (num_Vert_Vias <= 0) num_Vert_Vias=1)	; deliberately putting an erroreous layout which will be catched at DRC
		;fprintf(stderr "ViaVec(m) = %L \n" ViaVec(m))

		if((rfvlsi_em_export==0) then
			for(n 0 (num_Vert_Vias-1)
				rectVert=rodCreateRect(
				?layer ViaVec(m)
				?length	ViaWidthVec(m)
				?width	ViaWidthVec(m)				
				?elementsX num_Horz_Vias
				?elementsY 1
				?spaceX ViaSpacingVec(m)
				?spaceY ViaSpacingVec(m)
				?origin (len_Horz_Edge+n*Pitch):(len_Vert_Edge+n*Pitch)
				?cvId	pcCellView
				))  
		else
			dbCreatePolygon(pcCellView, ViaVec(m), 
			list(len_Horz_Edge:len_Vert_Edge
			(len_Horz_Edge+(num_Horz_Vias-1)*Pitch):len_Vert_Edge
			(len_Horz_Edge+(num_Horz_Vias-1)*Pitch+Length-2*len_Vert_Edge):(Length-len_Vert_Edge)
			(len_Horz_Edge+Length-2*len_Vert_Edge):(Length-len_Vert_Edge)
			))  ;  simplified metal polygon	
		);end of IF	  
	)
	
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
	?displayName "length"
	?displayExpression "Length"
	?handleName list("upperLeft","upperCenter","upperRight","lowerLeft","lowerCenter","lowerRight")
	?stretchType "relative"
	?moveOrigin t
	?stretchDir "y"
	?userFunction "std_CB"
	) ; end rodAssignHandleToParameter	
)/*end of let*/
)/*end of pcDefinePCell*/

                                                              
