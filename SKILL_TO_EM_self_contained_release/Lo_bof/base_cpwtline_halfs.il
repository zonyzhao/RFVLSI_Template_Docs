
strCellName="base_cpwtline_halfs";	  /*Assign your cell name to variable strCellName*/

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(L  "float"	30.0)
	(Signal  "float" 	2.0)
	(Wall	 "float" 	2.0)
	(SG_Gap	 "float" 	3.0)
	(SS_Gap  "float" 4.0)
	(PLANE_TOP_ME    "string" "6") ; commented by ywang 2012/06/08
	(TOP_ME    "string" "9")
	(BTM_ME    "string" "9")
	(bEMExportSimplification "boolean" nil) ; Added by ywang on 20120425
	(bBuildWalls "boolean" t)
)
let((M_vias Total_W mdmexcl inst0 rodi0),
	if(SS_Gap==0
	then
		Signal = (Signal/2)
	)
	M_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout"); get the master view of a single turn layout
	mdmexcl = dbOpenCellViewByType(pcCellView~>lib "base_admexcl" "layout")
	/*parameters*/
	Total_W = SG_Gap+Signal+Wall+SS_Gap/2
	/* dmy exclusions */
	inst0 = dbCreateParamInst(pcCellView mdmexcl nil 0:0 "R0" 1
        list(
			list("BTM_ME" "int" atoi(PLANE_TOP_ME))
	        list("TOP_ME" "int" atoi(TOP_ME))
	        list("AP_ME"  "boolean" t)
	        list("Width"  "float" Total_W)
	        list("Length" "float" L)
        	list("DMEXCL" "string" "DMEXCL")
		))
	dbCreateParamInst(pcCellView mdmexcl nil 0:0 "R0" 1
        list(
            list("BTM_ME" "int" atoi(PLANE_TOP_ME))
            list("TOP_ME" "int" atoi(TOP_ME))
            list("AP_ME"  "boolean" t)
            list("Width"  "float" Total_W)
            list("Length" "float" L)
            list("DMEXCL" "string" "VIAEXCL")
        ))
/*Step2:Draw Signal Rectangles*/
	dbCreateParamInst(pcCellView M_vias nil SS_Gap/2:0 "R0" 1 
		list(
			list("Width"      "float"  Signal) 
			list("BTM_ME"      "int"  atoi(BTM_ME))
	        list("Length"        "float" L)
    	    list("TOP_ME"      "int"  atoi(TOP_ME))
    		list("bEMExportSimplification"   "boolean"      bEMExportSimplification)
		)
	)

    rodi0 = rodGetObj(inst0)
    rodAssignHandleToParameter(
        ?parameter "L"
        ?rodObj rodi0
        ?displayName "L"
        ?displayExpression "L"
        ?handleName list("upperCenter" "lowerCenter")
        ?stretchType "relative"
        ?moveOrigin t
        ?stretchDir "y"
        ?userFunction "std_CB"
    ) ; end rodAssignHandleToParameter   */

	rodAssignHandleToParameter(
        ?parameter "SG_Gap"
        ?rodObj rodi0
        ?displayName "SG_Gap"
        ?displayExpression "SG_Gap"
        ?handleName list("centerRight" "centerLeft")
        ?stretchType "relative"
        ?moveOrigin t
        ?stretchDir "x"
        ?userFunction "std_CB"
    ) ; end rodAssignHandleToParameter   */

	if(bBuildWalls
	then
		dbCreateParamInst(pcCellView M_vias nil SS_Gap/2+Signal+SG_Gap:0 "R0" 1 
		list(
        list("Length"        "float" L)
        list("TOP_ME"      "int"  atoi(TOP_ME))
    	list("bEMExportSimplification"   "boolean"      bEMExportSimplification)
		list("Width"      "float"  Wall) 
		list("BTM_ME"      "int"  atoi(PLANE_TOP_ME))
			))
	)


)/*end of let*/
)/*end of pcDefinePCell*/
