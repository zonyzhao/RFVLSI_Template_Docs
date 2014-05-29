
strCellName="base_path_bend";	The Cell Name is called Inductor
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W	"float"	10.0)	; Line width
	(LineW	"float"	3.0)	; Line width
	(L1	"float"	5.0)	; Line width
	(L2	"float"	5.0)	; Line width
	(TOP_ME "int" 6)
	(BTM_ME "int" 9)
	(vias_cornr "boolean" t)
)
let((master start end rodpg masterv),
	masterR90 = dbOpenCellViewByType(pcCellView~>lib "vias_diagonal_R90" "layout"); get the master view of a single turn layout; should it be vias_corner?
	masterv = dbOpenCellViewByType(pcCellView~>lib "vias" "layout"); get the master view of a single turn layout
	if(TOP_ME >= BTM_ME
	then
		start = BTM_ME
		end = TOP_ME
	else
		start = TOP_ME
		end = BTM_ME
	)

	rfvlsiCreateStackedPath(pcCellView list(LineW/2:0 LineW/2:L1 W:L1+W-LineW/2 W+L2:W+L1-LineW/2) start end LineW 1 0.2)
	/*
	dbCreateParamInst(
		pcCellView masterv nil 0:0 "R0" 1
		list(
		list("Width" "float" LineW)
		list("Length" "float" L1)
		list("TOP_ME" "int" end)
		list("BTM_ME" "int" start)
		list("force_drc" "boolean" nil)
	))

	dbCreateParamInst(
                pcCellView masterv nil W:L1+W-LineW "R0" 1
                list(
                list("Width" "float" L2)
                list("Length" "float" LineW)
		list("TOP_ME" "int" end)
		list("BTM_ME" "int" start)
		list("force_drc" "boolean" nil)
        ))
	
	dbCreateParamInst(
                pcCellView masterR90 nil 0:L1 "R0" 1
                list(
                list("Length" "float" W)
                list("Width" "float" LineW)
                list("TOP_ME" "int" end)
                list("BTM_ME" "int" start)
                list("vias_cornr" "boolean" vias_cornr)
        ))*/
	
)/*end of let*/
)/*end of pcDefinePCell*/
