
strCellName="RF_PAD";	  /*Assign your cell name to variable strCellName*/

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
;------------starting dumping cell------------------
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
)
let((),
dbCreateParamInst(pcCellView  dbOpenCellViewByType(pcCellView~>lib "RF_PAD_QUART" "layout")
	 "I3" 0.0:0.0 "R270" 1
	 list(
		;CDF parameters
		;instant properties
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView  dbOpenCellViewByType(pcCellView~>lib "RF_PAD_QUART" "layout")
	 "I2" 0.0:0.0 "R180" 1
	 list(
		;CDF parameters
		;instant properties
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView  dbOpenCellViewByType(pcCellView~>lib "RF_PAD_QUART" "layout")
	 "I0" 0.0:0.0 "R90" 1
	 list(
		;CDF parameters
		;instant properties
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView  dbOpenCellViewByType(pcCellView~>lib "RF_PAD_QUART" "layout")
	 "I1" 0.0:0.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
	);close list
	);close dbCreateParamInst */

;------------starting generating figs------------------
;---------------------;creating nets
;---------------------;creating terminals
;---------------------;creating vias
))