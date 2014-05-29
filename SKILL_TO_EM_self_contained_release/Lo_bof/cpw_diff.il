
strCellName="cpw_diff";	  /*Assign your cell name to variable strCellName*/

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(L	"float" 30.0)
	(Signal	"float"	2.0)
	(Wall	"float"	2.0)
	(SG_Gap	"float"	2.0)
	(SS_Gap	"float"	2.0)
	(PLANE_BTM_ME    "string" "6")
	(PLANE_TOP_ME    "string" "6")
	(TOP_ME    "string" "9")
	(BTM_ME    "string" "9")
	(DUMMYL	"string" "RFVLSI")
	(DUMMYLP	"string" "drawing")
	(PINP	"string" "dummy1")
	(len_VoidX   "float" 1.0)
	(len_VoidY   "float" 1.0)
    (len_FillX   "float" 1.0)
    (len_FillY   "float" 1.0)
	(bEMExportSimplification "boolean" nil) ; Added by ywang on 20120425
	(bBuildWalls "boolean" t)
)
let((techfile_lib master dmy_h dmyedge Total_W param rodi0 inst0 dmyl dmy_h dmyedge),

;	fprintf(stderr "PCELL BY SHUEN TAI CHIU (patrick.ee96g@g2.nctu.edu.tw)\n\n")
;	fprintf(stderr "PCELL BY TAO YI LEE (michael@michaelgod.idv.tw)\n\n")
;	fprintf(stderr "RFVLSI LAB, NCTU\n")

master = dbOpenCellViewByType(pcCellView~>lib "base_cpwtline_halfs" "layout"); get the master view of a single turn layout

param = list(
        list("L" "float" L)
        list("Signal"  "float" Signal)
        list("Wall" "float" Wall)
        list("SG_Gap" "float" SG_Gap)
        list("SS_Gap" "float" SS_Gap)
        list("PLANE_TOP_ME"    "string" PLANE_TOP_ME)
        list("TOP_ME"    "string" TOP_ME)
        list("BTM_ME"    "string" BTM_ME)
        list("bEMExportSimplification"   "boolean"      bEMExportSimplification)
        list("bBuildWalls"   "boolean"      bBuildWalls)
) 
	inst0 = dbCreateParamInst(pcCellView master "I0" 0:0 "R0" 1 param)
	dbCreateParamInst(pcCellView master "I1" 0:0 "MY" 1 param)

	rodi0 = rodGetObj(inst0)
	rodAssignHandleToParameter(
        ?parameter "L"
        ?rodObj rodi0
        ?displayName "L"
        ?displayExpression "L"
        ?handleName list("upperLeft" "lowerLeft")
        ?stretchType "relative"
        ?moveOrigin t
        ?stretchDir "y"
        ?userFunction "std_CB"
    ) ; end rodAssignHandleToParameter   */

/*Step5: LVS information*/
dmy_h=0.5
dmyedge = dmy_h/2
Total_W=2*(Wall+Signal) + 2*SG_Gap + SS_Gap

	dmyl = list(DUMMYL, DUMMYLP)
	dmypl = list(DUMMYL, PINP)
	dbCreateRect(pcCellView, dmypl ,list(SS_Gap/2:dmyedge			SS_Gap/2+Signal:dmy_h))
	dbCreateLabel(pcCellView, dmypl, SS_Gap/2+Signal/2:dmy_h/2+dmyedge/2, "P1", "centerCenter", "R0", "roman", 0.2)

	dbCreateLabel(pcCellView, list(DUMMYL, "dummy5"), -1:L/2,  sprintf(nil "%L" L), "centerCenter", "R90", "roman", 0.5)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy6"), -2:L/2,  sprintf(nil "%L" Signal), "centerCenter", "R90", "roman", 0.5)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy7"), -3:L/2,  sprintf(nil "%L" Wall), "centerCenter", "R90", "roman", 0.5)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy8"), -4:L/2, sprintf(nil "%L" SG_Gap), "centerCenter", "R90", "roman", 0.5)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy9"), -5:L/2, sprintf(nil "%L" SS_Gap), "centerCenter", "R90", "roman", 0.5)

	dbCreateRect(pcCellView, dmypl,list(-SS_Gap/2:dmyedge	-SS_Gap/2-Signal:dmy_h))
	dbCreateLabel(pcCellView, dmypl, -SS_Gap/2-Signal/2:dmy_h/2+dmyedge/2, "N1", "centerCenter", "R0", "roman", 0.2)

	dbCreateRect(pcCellView, dmypl,list(SS_Gap/2:L-dmy_h	SS_Gap/2+Signal:L-dmyedge))
	dbCreateLabel(pcCellView, dmypl, SS_Gap/2+Signal/2:L-dmy_h/2-dmyedge/2, "P2", "centerCenter", "R0", "roman", 0.2)

	dbCreateRect(pcCellView, dmypl,list(-SS_Gap/2:L-dmy_h	-SS_Gap/2-Signal:L-dmyedge))
	dbCreateLabel(pcCellView, dmypl, -SS_Gap/2-Signal/2:L-dmy_h/2-dmyedge/2, "N2", "centerCenter", "R0", "roman", 0.2)

	dbCreateRect(pcCellView, dmypl, list(-SS_Gap/2-Wall-SG_Gap:dmyedge	-SS_Gap/2-Signal-Wall-SG_Gap:L-dmyedge))
	dbCreateLabel(pcCellView, dmypl, -SS_Gap/2-Signal/2-Wall-SG_Gap:L-dmy_h/2-dmyedge/2, "VSS", "centerCenter", "R0", "roman", 0.2)

	dbCreateRect(pcCellView, dmyl,list(-Total_W/2:dmyedge Signal+SS_Gap/2:L-dmyedge))
	dbCreateLabel(pcCellView, dmyl, 0:L/2, "cpw_diff", "centerCenter", "R90", "roman", 0.5)
	
	/* LVS Metal Removal */
	for(m (atoi(BTM_ME)-1)	(atoi(TOP_ME)-1)
		dbCreateRect(pcCellView, RFVLSI_LVS_Vec(m),list((-SS_Gap/2-Signal:dmyedge)	(-SS_Gap/2:L-dmyedge))) ; LVS Dummy
		dbCreateRect(pcCellView, RFVLSI_LVS_Vec(m),list((SS_Gap/2:dmyedge)	(SS_Gap/2+Signal:L-dmyedge))) ; LVS Dummy
	)
	
/*Step3:Draw Ground plane (M4 M5 M6) */
    dbCreateParamInst(pcCellView
        dbOpenCellViewByType(pcCellView~>lib "mesh_rect_asym" "layout"); get the master view of a single turn layout
        nil (-Total_W/2):0 "R0" 1
                list(
                list("Length"         "float" L)
                list("Width"       "float" Total_W)
                list("BTM_ME"   "int" atoi(PLANE_BTM_ME))
                list("TOP_ME"   "int" atoi(PLANE_TOP_ME))
                list("bEMExportSimplification"   "boolean"      bEMExportSimplification)
                list("len_FillW"      "float" len_FillX)
                list("len_FillL"      "float" len_FillY)
                list("len_VoidW"      "float" len_VoidX)
                list("len_VoidL"      "float" len_VoidY)
                ) ; close list
    ) ; close dbCreateParamInst

)/*end of let*/
)/*end of pcDefinePCell*/
