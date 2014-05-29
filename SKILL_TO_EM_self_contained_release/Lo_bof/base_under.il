
strCellName="base_under";	Cell Name
strViewName="layout";	This is a virtuoso layout

; Define my parameterized cell with the information above
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(L 	"float" 	10.0)	; Inductor total width
	(W  	"float"		8.0)	; Line width
	(TOP_ME "int"		10)
	(BTM_ME	"int"		9)
	(dummy "boolean" nil)
)
let((masterVIAS),
	/*	draw vias	*/
	masterVIAS= dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	dbCreateParamInst(pcCellView masterVIAS nil 0:0 "R0" 1
		list(
			list("Length" "float"    W)
			list("Width" "float"   W)
			list("TOP_ME" "float" TOP_ME)
			list("BTM_ME" "float" BTM_ME)
			list("dummy" "boolean" dummy)
        	)) ; close dbCreateParamInst	
	
		dbCreateParamInst(pcCellView masterVIAS nil L-W:0 "R0" 1
		list(
			list("Length" "float"    W)
			list("Width" "float"   W)
			list("TOP_ME" "float" TOP_ME)
			list("BTM_ME" "float" BTM_ME)
	        list("dummy" "boolean" dummy)
			)) ; close dbCreateParamInst	
	/*	enf of draw vias	*/
		dbCreateRect(pcCellView, MetalVec(BTM_ME-1),list(0:0   L-W:W))	
		dbCreateRect(pcCellView, list("RFVLSI_LVS",strcat("dummy" sprintf(nil "%L" BTM_ME))),list(0:0 L:W))   
))
