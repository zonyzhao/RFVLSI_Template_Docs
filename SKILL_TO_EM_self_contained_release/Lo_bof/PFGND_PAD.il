
strCellName="RFGND_PAD";	  /*Assign your cell name to variable strCellName*/

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
;------------starting dumping cell------------------
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
)
let((),
dbCreateParamInst(pcCellView  dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout")
	 "I0" (-32.5):0.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 65.0)
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 6)
		list("len_Void" "float" 2.0)
		list("len_Fill" "float" 2.0)
		list("Length" "float" 65.0)
	);close list
	);close dbCreateParamInst */

;------------starting generating figs------------------
dbCreateRect(pcCellView  list("M9" "drawing") 
	list((-32.5):0.0 32.5:65.0))
dbCreateRect(pcCellView  list("CB" "drawing") 
	list((-28.5):4.0 28.5:61.0))
dbCreateRect(pcCellView  list("CB2" "drawing") 
	list((-28.5):4.0 28.5:61.0))
dbCreateRect(pcCellView  list("AP" "drawing") 
	list((-29.5):3.0 29.5:62.0))
;---------------------;creating nets
;---------------------;creating terminals
;---------------------;creating vias
))