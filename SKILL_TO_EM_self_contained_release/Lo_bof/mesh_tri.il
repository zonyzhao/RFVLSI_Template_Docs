
strCellName = "mesh_tri"
pcDefinePCell(list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 30.0)
	(TOP_ME   "int" 1)
	(BTM_ME   "int" 1)
	(len_Void   "float" 0.5)
	(len_Fill   "float" 0.5)
	(bPP   "boolean" 	t)
	(bDoubleSided   "boolean" nil) ; added by ywang on 2012-04-26	
	(bEMExportSimplification "boolean" t)
)
let((Pitch num_Holes len_Edge delta m n rectHorz1 xm xm_Void xm_Fill rectVert1 ym total_pitch),
	PP_ext=0.03;  ;vias OD PP extensions
	NP_ext=0.2;  ;vias OD NP extensions
	NW_ENC=0.24;	
	
master=dbOpenCellViewByType(pcCellView~>lib "vias" "layout")	;get the master view of "vias"

Pitch=len_Void+len_Fill	; repetitive pitch dimensino
num_Holes= floor((Length-len_Fill-len_Void-1.4142*len_Fill)/Pitch) ; for bDoubleSide=nil case
num_Horz_Holes= floor((Length-2*1.4142*len_Fill-2*len_Void+len_Fill)/Pitch); for bDoubleSide=nil case
len_Edge= (Length-num_Horz_Holes*len_Void - (num_Horz_Holes-1)*len_Fill)/2-len_Fill ; for bDoubleSide=nil case
;delta=len_Edge-len_Fill
	if((BTM_ME<1)&&(bDoubleSided==t)
		then
			if(bPP
			then
				dbCreatePolygon(pcCellView list("PP","drawing") list(-PP_ext*1.5:0  Length+PP_ext*1.5:0 Length/2:Length/2+PP_ext*1.5))
				dbCreatePolygon(pcCellView list("PDK","drawing") list(0:0  Length:0 Length/2:Length/2))		
			else
				dbCreatePolygon(pcCellView list("NP","drawing") list(-NP_ext*1.5:0  Length+NP_ext*1.5:0 Length/2:Length/2+NP_ext*1.5))
				dbCreatePolygon(pcCellView list("NW","drawing") list(-NW_ENC*1.5:0  Length+NW_ENC*1.5:0 Length/2:Length/2+NW_ENC*1.5))
	))	
	if((BTM_ME<1)&&(bDoubleSided==nil)
		then
			if(bPP
			then
				dbCreatePolygon(pcCellView list("PP","drawing") list(-PP_ext:-PP_ext  Length+PP_ext:-PP_ext -PP_ext:Length+PP_ext))
				dbCreatePolygon(pcCellView list("PDK","drawing") list(0:0  Length:0 Length/2:Length/2))		
			else
				dbCreatePolygon(pcCellView list("NP","drawing") list(0:0  Length+1.5*NP_ext:0 0:Length+1.5*NP_ext))
				dbCreatePolygon(pcCellView list("NW","drawing") list(0:0  Length+1.5*NW_ENC:0 0:Length+1.5*NW_ENC))
	))		
for(n (BTM_ME-1) (TOP_ME-1)
	if(((bEMExportSimplification==nil)||(rfvlsi_em_export==0)) then

		
		total_pitch=num_Holes*Pitch
		if(bDoubleSided then
			for(m 0 floor(num_Horz_Holes/2)
			xm=m*Pitch
			xm_Void=xm-len_Void
			xm_Fill=xm+len_Fill
			dbCreateRect(pcCellView, MetalVec(n),list((xm+len_Edge):0 (xm+len_Fill+len_Edge):(xm+len_Edge)))  ; step-2, rectangulr shapes
			dbCreateRect(pcCellView, MetalVec(n),list((Length-xm-len_Edge-len_Fill):0 (Length-xm-len_Edge):(xm+len_Edge)))  ; step-2, rectangulr shapes
			if((m!=floor(num_Horz_Holes/2)) then
			dbCreatePolygon(pcCellView, MetalVec(n),list(xm:xm (xm+Pitch+len_Edge):xm (xm+Pitch+len_Edge):(xm+Pitch+len_Edge)))  ; step3- triangular shapes
			dbCreatePolygon(pcCellView, MetalVec(n),list((Length-xm):xm (Length-xm-Pitch-len_Edge):xm (Length-xm-Pitch-len_Edge):(xm+Pitch+len_Edge)))  ; step3- triangular shapes			
				); end of IF
			)
			dbCreatePolygon(pcCellView, MetalVec(n),list((Length-len_Fill):0 Length:0 (Length-len_Fill):len_Fill))  ; step3- triangular shapes
		else
			for(m 0 num_Holes
			xm=m*Pitch
			xm_Void=xm-len_Void
			xm_Fill=xm+len_Fill
			dbCreateRect(pcCellView, MetalVec(n),list(xm:0 (xm+len_Fill):(Length-xm-len_Fill)))  ; step-2, rectangulr shapes
			dbCreatePolygon(pcCellView, MetalVec(n),list(xm:(total_pitch+len_Fill-xm) (Length-total_pitch-len_Fill+xm):(total_pitch+len_Fill-xm) xm:(Length-xm)))  ; step3- triangular shapes
			)
			dbCreatePolygon(pcCellView, MetalVec(n),list((Length-len_Fill):0 Length:0 (Length-len_Fill):len_Fill))  ; step3- triangular shapes
		)
		;dbCreatePolygon(pcCellView, MetalVec(n),list(xm_Void:(Length-xm) xm_Fill:(Length-xm) xm_Void:(Length-xm+Pitch)))  ; step-4, the last triangular shapes
		;if( (delta > 0.001) dbCreatePolygon(pcCellView, MetalVec(n),list(len_Edge:Length len_Edge:(Length-delta) (Length-delta):len_Edge Length:len_Edge))
		;) ;step-5, special shape
		if(bDoubleSided then
			rectVert1=rodCreateRect(
			?layer MetalVec(n)
			?length	len_Fill
			?width	(Length-2*len_Fill)
			?origin len_Fill:0
			?cvId	pcCellView
			);  'step-6, bottom rectangle
		else
			rectHorz1=rodCreateRect(
			?layer MetalVec(n)
			?length	(Length-len_Fill)
			?width	len_Fill
			?origin 0:0
			?cvId	pcCellView
			); ; step-1: Left Rectangular Handle
			
			rectVert1=rodCreateRect(
			?layer MetalVec(n)
			?length	len_Fill
			?width	(Length-len_Fill)
			?origin 0:0
			?cvId	pcCellView
			);  'step-6, bottom rectangle
		)
		
		if(bDoubleSided then ()
		else
			for(m 1 num_Holes
			ym=m*Pitch
			dbCreateRect(pcCellView, MetalVec(n),list(0:ym (Length-ym-len_Fill):(ym+len_Fill)))  ;step 7: serial rectangular shapes
			) /* Staring assinging handles */

		)
		if(bDoubleSided then ()
		else
			rodAssignHandleToParameter(
			?parameter "Length"
			?rodObj rectHorz1
			?displayName "length"
			?displayExpression "Length"
			?handleName list("upperLeft","lowerLeft")
			?stretchType "relative"
			?moveOrigin t
			?stretchDir "x"
			?userFunction "std_CB"
			) 
			
			rodAssignHandleToParameter(
			?parameter "Length"
			?rodObj rectHorz1
			?displayName "length"
			?displayExpression "Length"
			?handleName "upperLeft"
			?stretchType "relative"
			?moveOrigin t
			?stretchDir "y"
			?userFunction "std_CB"
			)
		)
		rodAssignHandleToParameter(
		?parameter "Length"
		?rodObj rectVert1
		?displayName "length"
		?displayExpression "Length"
		?handleName list("lowerLeft","lowerRight")
		?stretchType "relative"
		?moveOrigin t
		?stretchDir "y"
		?userFunction "std_CB"
		) 
		
		rodAssignHandleToParameter(
		?parameter "Length"
		?rodObj rectVert1
		?displayName "length"
		?displayExpression "Length"
		?handleName "lowerRight"
		?stretchType "relative"
		?moveOrigin t
		?stretchDir "x"
		?userFunction "std_CB"
		) 
		
	else ;EM simplification, added by ywang on 20120422
		if(bDoubleSided then
			dbCreatePolygon(pcCellView, MetalVec(n), 
			list(0:0
			Length:0
			Length/2:Length/2
			))  ;  simplified metal polygon
		else
			dbCreatePolygon(pcCellView, MetalVec(n), 
			list(0:0
			Length:0
			0:Length
		))  ;  simplified metal polygon
		)
	); end if
);end of FOR

/*  ----------------------  Start drawing vias  -------------------------------- */
if(((bEMExportSimplification==nil)||(rfvlsi_em_export==0)) then ; Normal Operations
	if(bDoubleSided then
		for(m 1 floor((num_Holes-1)/2)
				xm=m*Pitch
				xm_Void=xm-len_Void
				xm_Fill=xm+len_Fill			
				dbCreateParamInst(pcCellView master  nil (xm+len_Fill):xm "R0" 1 
				list(list("Length"  "float" len_Fill)
				list("Width" 	"float" (Length-2*xm-2*len_Fill))
				list("TOP_ME"	"int" 	TOP_ME)
				list("BTM_ME"   "int" 	BTM_ME)
				list("bPP"   "boolean" 	bPP)
				)); /*end of dbCreateParamInst/
			if((m==floor((num_Holes-1)/2)) then
				for(n (BTM_ME-1) (TOP_ME-1)
				dbCreatePolygon(pcCellView, MetalVec(n),list((xm+len_Fill):(xm+len_Fill) (Length-xm-len_Fill):(xm+len_Fill) (Length/2):(Length/2)))  ; step3- triangular shapes
				);END FOR
			)
		); end For	
	else
		for(m 1 floor((num_Holes-1)/2)
				xm=m*Pitch
				xm_Void=xm-len_Void
				xm_Fill=xm+len_Fill		
				dbCreateParamInst(pcCellView master  nil xm:(xm+len_Fill) "R0" 1 
				list(list("Length"  "float" (Length-2*xm-2*len_Fill))
				list("Width" 	"float" len_Fill)
				list("TOP_ME"	"int" 	TOP_ME)
				list("BTM_ME"   "int" 	BTM_ME)
				list("bPP"   "boolean" 	bPP)				
				)); /*end of dbCreateParamInst/			
				dbCreateParamInst(pcCellView master  nil (xm+len_Fill):xm "R0" 1 
				list(list("Length"  "float" len_Fill)
				list("Width" 	"float" (Length-2*xm-2*len_Fill))
				list("TOP_ME"	"int" 	TOP_ME)
				list("BTM_ME"   "int" 	BTM_ME)
				list("bPP"   "boolean" 	bPP)
				)); /*end of dbCreateParamInst/		
		); end For
	); end If
else	;EM simplification, added by ywang on 20120422
	for(n (BTM_ME-1) (TOP_ME-2) 
		if(bDoubleSided then
			dbCreatePolygon(pcCellView, ViaVec(n), 
			list((Pitch+len_Fill):Pitch
			(Length-Pitch-len_Fill):Pitch
			(Length/2):(Length/2-len_Fill)
			))  ;  simplified metal polygon		
		else
			dbCreatePolygon(pcCellView, ViaVec(n), 
			list(Pitch:Pitch
			(Length-Pitch):Pitch
			Pitch:(Length-Pitch)
			))  ;  simplified metal polygon
		);end IF
	) ;End of for
) ; end if 


)/*end of let*/
)/*end of pcDefinePCell*/

                                                              
