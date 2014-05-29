
strCellName="RF_PAD_QUART";	  /*Assign your cell name to variable strCellName*/

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
;------------starting dumping cell------------------
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
)
let((),
dbCreatePolygon(pcCellView  list("M9" "drawing") 
	list(27.5:22.5 22.5:27.5 0.0:27.5 0.0:0.0 27.5:0.0))
dbCreatePolygon(pcCellView  list("AP" "drawing") 
	list(25.0:21.46 21.46:25.0 0.0:25.0 0.0:0.0 25.0:0.0))
dbCreatePolygon(pcCellView  list("CB" "drawing") 
	lsit(23.5:20.83 20.83:23.5 0.0:23.5 0.0:0.0 23.5:0.0))
dbCreatePolygon(pcCellView  list("CB2" "drawing") 
	list(23.5:20.83 20.83:23.5 0.0:23.5 0.0:0.0 23.5:0.0))
;---------------------;creating nets
;---------------------;creating terminals
;---------------------;creating vias
))