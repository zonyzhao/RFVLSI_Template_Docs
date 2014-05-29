
strCellName = "mesh_diagonal"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 30.0)
	(Width "float"   8.0)
	(TOP_ME   "int" 3)
	(BTM_ME   "int" 1)
	(len_VoidL   "float" 2.0)
	(len_FillL   "float" 0.5)
	(len_VoidW   "float" 1.0)
	(len_FillW   "float" 1.0)
	(bPP	"boolean" t)
	(bEMExportSimplification "boolean" t)
)
let((Pitch num_Horz_Holes num_Vert_Holes len_Horz_Edge len_Vert_Edge delta_Horz delta_Vert master rectHorz1 n rectHorzN
rectVert1 m n k rectVertN),

	if(BTM_ME<1
		then
			if(bPP
			then
				dbCreatePolygon(pcCellView list("PP","drawing") list(-PP_ext*1.5:0 Width+PP_ext*1.5:0 (Width+Length+PP_ext*1.5):Length Length-PP_ext*1.5:Length))
				dbCreatePolygon(pcCellView list("PDK","drawing") list(0:0 Width:0 (Width+Length):Length Length:Length))		
			else
				dbCreatePolygon(pcCellView list("NP","drawing") list(-NP_ext*1.5:0 Width+NP_ext*1.5:0 (Width+Length+NP_ext*1.5):Length Length-NP_ext*1.5:Length))
				dbCreatePolygon(pcCellView list("NW","drawing") list(-NW_ENC*1.5:0 Width+NW_ENC*1.5:0 (Width+Length+NW_ENC*1.5):Length Length-NW_ENC*1.5:Length))
	))	
	

PitchL=len_VoidL+len_FillL	; repetitive pitch dimension
PitchW=len_VoidW+len_FillW	; repetitive pitch dimension
num_Horz_Holes= floor((Width-len_FillW)/PitchW)
num_Vert_Holes= floor((Length-len_FillL)/PitchL)
len_Horz_Edge= (Width-num_Horz_Holes*len_VoidW - (num_Horz_Holes-1)*len_FillW)/2
len_Vert_Edge= (Length-num_Vert_Holes*len_VoidL - (num_Vert_Holes-1)*len_FillL)/2
delta_Horz=len_Horz_Edge-len_FillW
delta_Vert=len_Vert_Edge-len_FillL

if(((bEMExportSimplification==t)&&(rfvlsi_em_export!=0)) then
	num_Horz_Holes=0;
	num_Vert_Holes=0;
) ; added by ywang on 20120422

if((num_Horz_Holes<1) len_Horz_Edge=Width)
if((num_Vert_Holes<1) len_Vert_Edge=Length)
master=dbOpenCellViewByType(pcCellView~>lib "vias_diagonal" "layout")	;get the master view of "vias"

	
	if((num_Vert_Holes>0) ;Note, special case -> No holes in vertical direction. 
		dbCreateParamInst(pcCellView master  nil len_Vert_Edge:len_Vert_Edge "R0" 1 
		list(list("Length"  "float" (Length-2*len_Vert_Edge))
			list("Width" 	"float" len_Horz_Edge)
			list("TOP_ME"	"int" 	TOP_ME)
			list("BTM_ME"   "int" 	BTM_ME)
			list("bPP"	"boolean" bPP)
			)); /*end of dbCreateParamInst/	
	); end of IF
		
	if((num_Horz_Holes > 0) ;Note, special case -> No holes in vertical direction. 
		let(()
			if((num_Horz_Holes>1)&&(num_Vert_Holes>0) ;if we have more than 2 holes, place vias in "Center", 
				for(n 1 (num_Horz_Holes-1) 
					dbCreateParamInst(pcCellView master  nil (len_Vert_Edge+delta_Horz+PitchW*n):len_Vert_Edge "R0" 1 
					list(list("Length"  "float" (Length-2*len_Vert_Edge))
					list("Width" 	"float" len_FillW)
					list("TOP_ME"	"int" 	TOP_ME)
					list("BTM_ME"   "int" 	BTM_ME)
					list("bPP"	"boolean" bPP)
					)); /*end of dbCreateParamInst/					
				)
			) ;end of IF
		);end of LET
	);end of IF	

/* --------------------------------  Bottom Handle Metals & Vias -------------------------------  */	
		
	dbCreateParamInst(pcCellView master  nil 0:0 "R0" 1 
	list(list("Length"  "float" len_Vert_Edge)
		list("Width" 	"float" Width)
		list("TOP_ME"	"int" 	TOP_ME)
		list("BTM_ME"   "int" 	BTM_ME)
		list("bPP"	"boolean" bPP)		
		)); /*end of dbCreateParamInst/

	for(m (BTM_ME-1) (TOP_ME-1)
		if((num_Vert_Holes > 0)
			let(()
				if((num_Vert_Holes>1) ; draw flat metals rectangles in vertical direction
					let(()
						for(n 1 (num_Vert_Holes-1) 
							rectVert=rodCreatePolygon(
							?layer MetalVec(m)
							?pts list((len_Vert_Edge-len_FillL+n*PitchL):(len_Vert_Edge-len_FillL+n*PitchL) 
							(len_Vert_Edge-len_FillL+Width+n*PitchL):(len_Vert_Edge-len_FillL+n*PitchL) 
							(len_Vert_Edge+Width+n*PitchL):(len_Vert_Edge+n*PitchL)
							(len_Vert_Edge+n*PitchL):(len_Vert_Edge+n*PitchL)
							)
							?cvId	pcCellView
							)
						);end of FOR
						
						for(n 0 (num_Vert_Holes-1)
							for(k 0 (num_Horz_Holes-1)
								let(()
									dbCreatePolygon(pcCellView MetalVec(m) 
									list((len_Vert_Edge+len_Horz_Edge+PitchL*n+PitchW*k):(len_Vert_Edge+PitchL*n) 
									(len_Vert_Edge+len_Horz_Edge+MetalSingularEdgeFillVec(m)+PitchL*n+PitchW*k):(len_Vert_Edge+PitchL*n)  
									(len_Vert_Edge+len_Horz_Edge+MetalSingularEdgeFillVec(m)+PitchL*n+PitchW*k):(len_Vert_Edge+MetalSingularEdgeFillVec(m)+PitchL*n) 
									)
									)
									dbCreatePolygon(pcCellView MetalVec(m) 
									list((len_Vert_Edge+len_Horz_Edge+PitchL*n+PitchW*k+len_VoidL+len_VoidW):(len_Vert_Edge+PitchL*n+len_VoidL) 
									(len_Vert_Edge+len_Horz_Edge+PitchL*n+PitchW*k+len_VoidL+len_VoidW-MetalSingularEdgeFillVec(m)):(len_Vert_Edge+PitchL*n+len_VoidL)  
									(len_Vert_Edge+len_Horz_Edge+PitchL*n+PitchW*k+len_VoidL+len_VoidW-MetalSingularEdgeFillVec(m)):(len_Vert_Edge+PitchL*n+len_VoidL-MetalSingularEdgeFillVec(m)) 
									)
									)
								)
							)
						);end of FOR
					)
				)
			);end of LET
		); end of IF
	); end of FOR

/* 	---------------   This section starts placing vias  -------------    */

	if((num_Vert_Holes>0)
	dbCreateParamInst(pcCellView master  nil (len_Vert_Edge+Width-len_Horz_Edge):len_Vert_Edge "R0" 1 
	list(list("Length"  "float" (Length-2*len_Vert_Edge))
		list("Width" 	"float" len_Horz_Edge)
		list("TOP_ME"	"int" 	TOP_ME)
		list("BTM_ME"   "int" 	BTM_ME)
		list("bPP"	"boolean" bPP)		
		)); /*end of dbCreateParamInst/	
	);end of IF


	dbCreateParamInst(pcCellView master  nil (Length-len_Vert_Edge):(Length-len_Vert_Edge) "R0" 1 
	list(list("Length"  "float" len_Vert_Edge)
		list("Width" 	"float" Width)
		list("TOP_ME"	"int" 	TOP_ME)
		list("BTM_ME"   "int" 	BTM_ME)
		list("bPP"	"boolean" bPP)		
		)); /*end of dbCreateParamInst/		

/*      ---------- Staring assinging handles    --------------   */
	
	;Placing a left ROD object for handle
	rodP1=rodCreatePolygon(
	?layer MetalVec((TOP_ME-1))
	?pts list(0:0 Width:0 (Width+len_Vert_Edge):len_Vert_Edge len_Vert_Edge:len_Vert_Edge) 
	?cvId	pcCellView
	);
	
	rodP2=rodCreatePolygon(
		?layer MetalVec((TOP_ME-1))
		?pts list((Length-len_Vert_Edge):(Length-len_Vert_Edge) 
		(Length-len_Vert_Edge+Width):(Length-len_Vert_Edge) 
		(Length+Width):Length 
		Length:Length) 
		?cvId	pcCellView
	);
	
	rodAssignHandleToParameter(
	?parameter "Length"
	?rodObj rodP1
	?displayName "length"
	?displayExpression "Length"
	?handleName list("lowerLeft","lowerCenter","lowerRight")
	?stretchType "relative"
	?moveOrigin t
	?stretchDir "y"
	?userFunction "std_CB"
	) 	
	
	rodAssignHandleToParameter(
	?parameter "Length"
	?rodObj rodP2
	?displayName "length"
	?displayExpression "Length"
	?handleName list("upperLeft","upperCenter","upperRight")
	?stretchType "relative"
	?moveOrigin t
	?stretchDir "y"
	?userFunction "std_CB"
	) 	
)/*end of let*/
)/*end of pcDefinePCell*/
