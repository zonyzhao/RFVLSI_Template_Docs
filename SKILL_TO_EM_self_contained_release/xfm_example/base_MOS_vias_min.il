; load("./yj_rod/vias.il")
strCellName="base_MOS_vias_min";	  /*Assign your cell name to variable strCellName*/
strViewName="layout";     /*Assign your view name to variable strViewName*/

/*Open our layout cell, and pass our layout cell identifier to variable idCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 5.0)
	(Width "float" 1.0)
	(MetalExtention	"float" 0.1)  ;metal width extension from minimum width
	(TOP_ME	  "int" 2)
	(BTM_ME   "int" 1)
	(bUseWidth "boolean" nil)  ; Added by Ywang at 2012/05/29 to improve vias density in PowerMOS
)
let((idCellView netx Pitch num_Horz_Vias num_Vert_Vias len_Horz_Edge len_Vert_Edge m),
idCellView=pcCellView; 
	if((!bUseWidth) then
	Width= MetalExtention*2+ViaWidthVec(BTM_ME-1) ; Added by Ywang on 2012/05/28
	)		
	
	for(m	(BTM_ME-1)	(TOP_ME-1)
		if(!bUseWidth then
			if((m==(TOP_ME-1)) then
				rectOutline=rodCreateRect(
				?layer MetalVec(m)
				?length	Length
				?width	(ViaMinEncWidthVec(m,t)+2*MetalExtention)
				?origin (-ViaMinEncWidthVec(m,t)/2-MetalExtention):0
				?cvId	idCellView
				);
			else
				rectOutline=rodCreateRect(
				?layer MetalVec(m)
				?length	Length
				?width	(ViaMinEncWidthVec(m,nil)+2*MetalExtention)
				?origin (-ViaMinEncWidthVec(m,nil)/2-MetalExtention):0
				?cvId	idCellView
				);
			)
		else
			rectOutline=rodCreateRect(
			?layer MetalVec(m)
			?length	Length
			?width	Width
			?origin (-Width/2):0
			?cvId	idCellView
			);
		)
	)
	
	for(m	(BTM_ME-1)	(TOP_ME-2)
		Pitch=ViaWidthVec(m)+ViaOneRowSpacingVec(m); via pitch
		
		num_Vert_Vias= floor((Length-2*ViaEncVec(m)+ViaOneRowSpacingVec(m))/Pitch)
		len_Vert_Edge= roundtogrid((Length-num_Vert_Vias*ViaWidthVec(m) - (num_Vert_Vias-1)*ViaOneRowSpacingVec(m))/2) ; Added by Ywang on 2012/05/28 (roundtogrid)
		
		num_Horz_Vias= min(floor((Width+ViaOneRowSpacingVec(m))/Pitch) 2)
		len_Horz_Edge= roundtogrid((Width-num_Horz_Vias*ViaWidthVec(m) - (num_Horz_Vias-1)*ViaOneRowSpacingVec(m))/2) ; Added by Ywang on 2012/05/28
		
		if( (num_Vert_Vias <= 0) num_Vert_Vias=1)	; deliberately putting an erroreous layout which will be catched at DRC
		if( (num_Horz_Vias <= 0) num_Horz_Vias=1)	; deliberately putting an erroreous layout which will be catched at DRC
		
		;fprintf(stderr "ViaVec(m) = %L \n" ViaVec(m))
		;printf(stderr "len_Horz_Edge = %L \n" len_Horz_Edge)
		;fprintf(stderr "len_Vert_Edge = %L \n" len_Vert_Edge)
		;fprintf(stderr "pitch = %L \n" Pitch)
		;fprintf(stderr "ViaWidthVec(m) = %L \n" ViaWidthVec(m)
		;printf(stderr "Width = %L \n" Width)		
		;printf(stderr "num_Vert_Vias = %L \n" num_Vert_Vias)
		;printf(stderr "num_Horz_Vias = %L \n" num_Horz_Vias)
		;if((m < 8) then
		;dbCreateViaShapeArray(idCellView ViaVec(m) netx (-ViaWidthVec(m)/2) len_Vert_Edge Pitch Pitch ViaWidthVec(m) ViaWidthVec(m) num_Vert_Vias 1) 
		; using dbCreateViaShapeArray generates wierd pcell evaluation error for RV.
		;else
			if((rfvlsi_em_export == 0) then
			rectHorz=rodCreateRect(
			?layer ViaVec(m)
			?elementsX num_Horz_Vias
			?elementsY num_Vert_Vias
			?spaceX ViaOneRowSpacingVec(m)
			?spaceY ViaOneRowSpacingVec(m)
			?width	ViaWidthVec(m)
			?length ViaWidthVec(m)
			?origin -roundtogrid(Width/2)+len_Horz_Edge:len_Vert_Edge
			?cvId	idCellView
			)
			else
			rectHorz=rodCreateRect(
			?layer ViaVec(m)
			?elementsX 1
			?elementsY 1
			?spaceX ViaOneRowSpacingVec(m)
			?spaceY ViaOneRowSpacingVec(m)
			?width	ViaWidthVec(m)
			?length ViaWidthVec(m)*num_Vert_Vias+(num_Vert_Vias-1)*ViaOneRowSpacingVec(m)
			?origin (-ViaWidthVec(m)/2):len_Vert_Edge
			?cvId	idCellView
			)

			)
		;)
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
	?userData ()
	?userFunction "std_CB"
	) ; end rodAssignHandleToParameter	
)/*end of let*/
)/*end of pcDefinePCell*/

                                                              
