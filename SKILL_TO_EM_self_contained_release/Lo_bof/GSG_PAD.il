
strCellName="GSG_PAD";	  /*Assign your cell name to variable strCellName*/

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
;------------starting dumping cell------------------
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
)
let((),
	masterVias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout");
dbCreateParamInst(pcCellView  masterVias "I6" (-180.0):0.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("WidthL" "float" 33.31)
		list("WidthR" "float" 79.19)
		list("BTMME" "int" 1)
		list("AP_enc" "float" 2.5)
		list("len_Fill" "float" 2.0)
		list("len_Void" "float" 2.0)
		list("Width" "float" 112.5)
		list("TOP_ME" "int" 3)
		list("Length" "float" 3.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView  masterVias "I5" 67.5:0.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("WidthL" "float" 33.31)
		list("len_Void" "float" 2.0)
		list("len_Fill" "float" 2.0)
		list("AP_enc" "float" 2.5)
		list("BTMME" "int" 1)
		list("WidthR" "float" 79.19)
		list("Width" "float" 112.5)
		list("TOP_ME" "int" 3)
		list("Length" "float" 3.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView  masterVias "I4" 67.5:0.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("WidthL" "float" 33.31)
		list("WidthR" "float" 79.19)
		list("BTMME" "int" 1)
		list("AP_enc" "float" 2.5)
		list("Width" "float" 112.5)
		list("TOP_ME" "int" 1)
		list("len_Void" "float" 2.0)
		list("len_Fill" "float" 2.0)
		list("Length" "float" 65.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView  masterVias "I3" (-180.0):0.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("WidthL" "float" 33.31)
		list("AP_enc" "float" 2.5)
		list("BTMME" "int" 1)
		list("WidthR" "float" 79.19)
		list("Width" "float" 112.5)
		list("TOP_ME" "int" 1)
		list("len_Void" "float" 2.0)
		list("len_Fill" "float" 2.0)
		list("Length" "float" 65.0)
	);close list
	);close dbCreateParamInst */

	masterVias_dmexcl = dbOpenCellViewByType(pcCellView~>lib "vias_dmexcl" "layout");
dbCreateParamInst(pcCellView  masterVias_dmexcl "I2" (-180.0):0.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 360.0)
		list("Length" "float" 65.0)
		list("BTM_ME" "int" 3)
	);close list
	);close dbCreateParamInst */

	masterRFGND_PAD = dbOpenCellViewByType(pcCellView~>lib "RFGND_PAD" "layout");	
dbCreateParamInst(pcCellView  masterRFGND_PAD "I1" 100.81:0.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 107.48)
		list("WidthR" "float" 79.19)
		list("Length" "float" 65.0)
		list("BTMME" "int" 3)
		list("AP_enc" "float" 2.5)
		list("WidthL" "float" 33.31)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView masterRFGND_PAD "I2" (-146.69):0.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 107.48)
		list("WidthR" "float" 79.19)
		list("Length" "float" 65.0)
		list("BTMME" "int" 3)
		list("AP_enc" "float" 2.5)
		list("WidthL" "float" 33.31)
	);close list
	);close dbCreateParamInst */

	masterRF_PAD = dbOpenCellViewByType(pcCellView~>lib "RF_PAD" "layout");	
dbCreateParamInst(pcCellView masterRF_PAD "I0" 0.0:27.5 "R0" 1
	 list(
	 list("nothing" nil "")
		;CDF parameters
		;instant properties
	);close list
	);close dbCreateParamInst */

;------------starting generating figs------------------
;path is unimplemented
;---------------------;creating nets
;---------------------;creating terminals
;---------------------;creating vias
))