strLibName="65nmPAD";	My Library name is my student id
strCellName="GND_PAD";	The Cell Name is called Inductor
strViewName="layout";	This is a virtuoso layout
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(WidthL	"float"	32.5)	; Line width
	(WidthR	"float"	32.5)	; Line width
	(Length	"float"	65.0) ; Line spacing
	(BTMME "int" 6)
	(CB_enc "float" 4.0)
	(AP_enc "float" 3.0)
	(Len_Void "float" 2.0)
	(Len_Fill "float" 2.0)
)
let((techfile_lib techFileID maskGrid master Width rectm9),
	master = dbOpenCellViewByType(rfvlsi_pcell_lib_name "mesh_rect" "layout")
; get the master view of a single turn layout

	Width = WidthR+WidthL
	dbCreateParamInst(
		pcCellView master nil -WidthL:0 "R0" 1
		list(
	        list("Length"  "float" Length)
        	list("Width" "float"   Width)
	        list("TOP_ME"   "int" 9)
        	list("BTM_ME"   "int" BTMME)
	        list("len_Void"   "float" Len_Void)
        	list("len_Fill"   "float" Len_Fill)
	) ; close list
	) ; close dbCreateParamInst

	rectm9 = rodCreateRect(
                        ?layer MetalVec(8)
                        ?length Length
                        ?width  Width
                        ?origin -WidthL:0
                        ?cvId   pcCellView
                );
	rodAssignHandleToParameter(
                ?parameter "WidthR"
                ?rodObj rectm9
                ?displayName "WidthR"
                ?displayExpression "Width"
                ?handleName list("upperRight","centerRight","lowerRight")
                ?stretchType "relative"
                ?moveOrigin nil
                ?stretchDir "x"
                ?userData list(1 maskGrid)
                ?userFunction "param_CB"
        ) ; end rodAssignHandleToParameter

	rodAssignHandleToParameter(
                ?parameter "WidthL"
                ?rodObj rectm9
                ?displayName "WidthL"
                ?displayExpression "WidthL"
                ?handleName list("upperLeft","centerLeft","lowerLeft")
                ?stretchType "relative"
                ?moveOrigin nil
                ?stretchDir "x"
                ?userData list(1 maskGrid)
                ?userFunction "param_CB"
        ) ; end rodAssignHandleToParameter

	rodAssignHandleToParameter(
                ?parameter "Length"
                ?rodObj rectm9
                ?displayName "Length"
                ?displayExpression "Length"
                ?handleName list("upperLeft","lowerLeft","upperRight","upperCenter","lowerCenter")
                ?stretchType "relative"
                ?moveOrigin t
                ?stretchDir "y"
                ?userData list(1 maskGrid)
                ?userFunction "param_CB"
        ) ; end rodAssignHandleToParameter


	dbCreateRect(pcCellView, list("CB" "drawing")   ,list(-WidthL+CB_enc:CB_enc WidthR-CB_enc:Length-CB_enc))
	dbCreateRect(pcCellView, list("CB2" "drawing")   ,list(-WidthL+CB_enc:CB_enc WidthR-CB_enc:Length-CB_enc))
	dbCreateRect(pcCellView, list("AP" "drawing")   ,list(-WidthL+AP_enc:AP_enc WidthR-AP_enc:Length-AP_enc))
	dbCreateRect(pcCellView, list("VSSDMY" "drawing")   ,list(-WidthL:0 WidthR:Length))
)/*end of let*/
)/*end of pcDefinePCell*/

