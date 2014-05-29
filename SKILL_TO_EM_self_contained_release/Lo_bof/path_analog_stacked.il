pcDefinePCell(
list(ddGetObj(rfvlsiDebugLibName),"path_analog_stacked", "layout"),
(
	(pts "string" "((0 0) (100 0) (200 100) (200 200))")
	(BTM_ME	  "int" 2)
	(TOP_ME   "int" 4)
	(Width "float"   0.46)
	(NumPaths   "int" 1)
	(PathSep   "float" 0.2)	
)
let(()
	rfvlsiCreateStackedPath(pcCellView evalstring(buildString(list("'" pts) "")) BTM_ME TOP_ME Width NumPaths PathSep)
	
	;path strench function is included by ywang on 2014/03/08
	ptsFloat=evalstring(buildString(list("'" pts)))
	vecOrient=rfvlsiGetOrientationVec(ptsFloat)
	
	objRodPath=rodCreatePath(
	?name "bus"
	?layer list("text" "drawing1")
	?pts evalstring(buildString(list("'" pts)))
	?width 0.1
	?justification "center"
	?cvId pcCellView
	) ;end rodCreatePath
	;evalstring(buildString(list("'" "((20 -20) (40 -20) (40 -30) (80 -30))")))
	;list(20:-20 40:-20 40:-30 80:-30)
	
	listHandleDirX=list()
	listHandleDirY=list()

	for( i 0 length(vecOrient)-1
		sprintf(handleStr "mid%d" i)
		
		case(nth(i vecOrient)
			((0 4) 
				if(i==0 then
					listHandleDirX= cons( "start0" listHandleDirX )
				)
				if(i==(length(vecOrient)-1) then
					listHandleDirX= cons( "endLast" listHandleDirX )
				)					
				listHandleDirY= cons( handleStr listHandleDirY )
				)
			((2 6)
				if(i==0 then
					listHandleDirY= cons( "start0" listHandleDirY )
				)						
				if(i==(length(vecOrient)-1) then
					listHandleDirY= cons( "endLast" listHandleDirY )
				)					
				listHandleDirX= cons( handleStr listHandleDirX ))
			((1 3 5 7) 
				if(i==0 then
					listHandleDirX= cons( "start0" listHandleDirX )
					listHandleDirY= cons( "start0" listHandleDirY )
				)
				if(i==(length(vecOrient)-1) then
					listHandleDirX= cons( "endLast" listHandleDirX )
					listHandleDirY= cons( "endLast" listHandleDirY )
				)					
				listHandleDirX= cons( handleStr listHandleDirX )
				listHandleDirY= cons( handleStr listHandleDirY )
			)
			(t nil)
		);end of case
	)
	
	rodAssignHandleToParameter(
		?parameter "pts"
		?rodObj objRodPath
		?handleName listHandleDirY
		?stretchType "absolute"
		?moveOrigin nil
		?stretchDir "y"
		?userFunction "pathStrench_CB"
	)

	rodAssignHandleToParameter(
		?parameter "pts"
		?rodObj objRodPath
		?handleName listHandleDirX
		?stretchType "absolute"
		?moveOrigin nil
		?stretchDir "x"
		?userFunction "pathStrench_CB"
	)		
);Emd of Let
)