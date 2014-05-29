
strCellName="cpwtline45s";	  /*Assign your cell name to variable strCellName*/

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Signal_W	"float"	2.0)
	(Wall	"float"	2.0)
	(DIVI	"float"	2.5)
	(DIVO	"float"	2.5)
	(SG_Gap	"float"	2.0)
	(SS_Gap	"float"	2.0)
	(OFFSET	"float"	0.8)
	(DUMMYL       "string" "RFVLSI")
    (DUMMYLP      "string" "drawing")
    (PINP "string" "dummy1")
	(SIGNAL_TOP_ME	"int"	9)
	(SIGNAL_BTM_ME	"int"	9)
	(PLANE_TOP_ME   "int" 6)
	(PLANE_BTM_ME   "int" 6)
	(len_VoidL   "float" 1.5)
	(len_VoidW	"float" 1.5)
	(len_FillL   "float" 0.5)
	(len_FillW   "float" 0.5)
	(bEMExportSimplification "boolean" t)	
)
let((OD_SWR masterswr instswr OD_SR OD_SL OD_SWL master),

/* Draw SW and signal  line */
; SW (right)
OD_SWR=OFFSET+2*Wall+2*SG_Gap+2*Signal_W+SS_Gap
OD_SR=OFFSET+Wall+SG_Gap+2*Signal_W+SS_Gap
OD_SL=OFFSET+Wall+SG_Gap+Signal_W
OD_SWL=OFFSET+Wall

master = dbOpenCellViewByType(pcCellView~>lib "base_path_bend" "layout")
dbCreateParamInst(pcCellView master nil OFFSET+2*(Signal_W+Wall)+SS_Gap+2*SG_Gap:0 "MY" 1
                list(
                list("L1"         "float" OD_SWR/2)                
                list("L2"         "float" OD_SWR/2)
                list("W"         "float" OD_SWR/2)
                list("LineW"     "float" Wall)
                list("TOP_ME"  "int" SIGNAL_TOP_ME)
                list("BTM_ME"  "int" PLANE_BTM_ME)
                ) ; close list
        ) ; close dbCreateParamInst
	dbCreateParamInst(pcCellView master nil OFFSET+2*Wall+Signal_W+SS_Gap+SG_Gap:0 "MY" 1
                list(
                list("L1"         "float" OD_SWR/2-Signal_W)
                list("L2"         "float" OD_SWR/2-Signal_W)
                list("W"         "float" OD_SWR/2-SG_Gap)
                list("LineW"     "float" Signal_W)
                list("TOP_ME"  "int" SIGNAL_TOP_ME)
                list("BTM_ME"  "int" SIGNAL_BTM_ME)
                ) ; close list
        ) ; close dbCreateParamInst

	dbCreateParamInst(pcCellView master nil OD_SL:0 "MY" 1
                list(
                list("L1"         "float" OFFSET+Wall)
                list("L2"         "float" OFFSET+Wall)
                list("W"         "float" SG_Gap+Signal_W)
                list("LineW"     "float" Signal_W)
                list("TOP_ME"  "int" SIGNAL_TOP_ME)
                list("BTM_ME"  "int" SIGNAL_BTM_ME)
                ))
        dbCreateParamInst(pcCellView master nil OD_SWL:0 "MY" 1
                list(
                list("L1"         "float" OFFSET)
                list("L2"         "float" OFFSET)
                list("W"         "float" Wall)
                list("LineW"     "float" Wall)
                list("vias_cornr"     "boolean" nil)
                list("TOP_ME"  "int" SIGNAL_TOP_ME)
                list("BTM_ME"  "int" PLANE_BTM_ME)
                ) ; close list
        ) ; close dbCreateParamInst

	dbCreateParamInst(pcCellView 
	dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout") nil 0:0 "R0" 1
                list(
                list("Length"         "float"  OD_SWR-Signal_W)
                list("Width"       "float" OD_SWR/2)
                list("len_Void"   "float" len_VoidL)
                list("len_Fill"   "float" len_FillL)
                list("TOP_ME"   "int" PLANE_TOP_ME)
                list("BTM_ME"   "int" PLANE_BTM_ME)
		list("bEMExportSimplification" "boolean" bEMExportSimplification)
		))

	dbCreateParamInst(pcCellView
        dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout") nil OD_SWR/2:0 "R0" 1
                list(
                list("Length"         "float"  OD_SWR/2)
                list("Width"       "float" OD_SWR/2-Signal_W)
                list("len_Void"   "float" len_VoidL)
                list("len_Fill"   "float" len_FillL)
                list("TOP_ME"   "int" PLANE_TOP_ME)
                list("BTM_ME"   "int" PLANE_BTM_ME)
                list("bEMExportSimplification" "boolean" bEMExportSimplification)
		))

	dbCreateParamInst(pcCellView
        dbOpenCellViewByType(pcCellView~>lib "mesh_tri" "layout") nil OD_SWR/2:OD_SWR/2 "R0" 1
                list(
                list("Length"         "float"  OD_SWR/2-Signal_W)
                list("len_Void"   "float" len_VoidL)
                list("len_Fill"   "float" len_FillL)
                list("TOP_ME"   "int" PLANE_TOP_ME)
                list("BTM_ME"   "int" PLANE_BTM_ME)
                list("bEMExportSimplification" "boolean" bEMExportSimplification)
                ))



dmy_h=0.5
dmyedge = dmy_h/2
Total_W=(2*Wall+2*SG_Gap+2*Signal_W+SS_Gap)

dmyl =  list(DUMMYL, DUMMYLP)
dmypl =  list(DUMMYL, PINP)
dbCreateRect(pcCellView, MetalVec(5),list(0:0 OFFSET+Wall:OFFSET+Wall))

dbCreateRect(pcCellView, dmypl, list(OD_SR:dmyedge OD_SR-Signal_W:dmy_h))
dbCreateLabel(pcCellView, dmypl,  OD_SR-Signal_W/2:dmy_h/2+dmyedge/2, "P1", "centerCenter", "R0", "roman", 0.2)
dbCreateRect(pcCellView, dmypl, list(OD_SL:dmyedge OD_SL-Signal_W:dmy_h))
dbCreateLabel(pcCellView, dmypl, OD_SL-Signal_W/2:dmy_h/2+dmyedge/2, "N1", "centerCenter", "R0", "roman", 0.2)

dbCreateRect(pcCellView, dmypl,list(dmyedge:OD_SR       dmy_h:OD_SR-Signal_W))
dbCreateLabel(pcCellView, dmypl, dmyedge/2+dmy_h/2:OD_SR-Signal_W/2, "P2", "centerCenter", "R0", "roman", 0.2)

dbCreateRect(pcCellView, dmypl,list(dmyedge:OD_SL       dmy_h:OD_SL-Signal_W ))
dbCreateLabel(pcCellView, dmypl, dmyedge/2+dmy_h/2:OD_SL-Signal_W/2, "N2", "centerCenter", "R0", "roman", 0.2)

dbCreatePolygon(pcCellView, dmyl,list(dmyedge:SG_Gap+Wall SG_Gap+Wall:dmyedge
	OD_SWR-SG_Gap-Wall:dmyedge 
	OD_SWR-SG_Gap-Wall:OD_SWR/2 
	OD_SWR/2:OD_SWR-SG_Gap-Wall dmyedge:OD_SWR-SG_Gap-Wall))
dbCreateLabel(pcCellView, dmyl, OD_SWR/2:OD_SWR/2, "tline_bend", "centerCenter", "R90", "roman", 0.5)

)/*end of let*/
)/*end of pcDefinePCell*/
