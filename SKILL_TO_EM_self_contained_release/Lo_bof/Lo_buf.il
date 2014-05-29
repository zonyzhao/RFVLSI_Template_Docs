
strCellName="Lo_buf";	  /*Assign your cell name to variable strCellName*/

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
;------------starting dumping cell------------------
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(WidthL	"float"	32.5)	; Line width
	(WidthR	"float"	32.5)	; Line width
)
let((),

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "path_analog_stacked" "layout")
	 "I177" (-0.425):0.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("BTM_ME" "int" 9)
		list("TOP_ME" "int" 9)
		list("Width" "float" 2.0)
		list("PathSep" "float" 1.0)
		list("pts" "string" "((256.26 58.77) (252.08 58.77) (240.855 69.995) (239.045 69.995))")
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_diagonal" "layout")
	 "I69" 470.0:(-67.5) "MY" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("TOP_ME" "int" 2)
		list("Length" "float" 35.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_diagonal" "layout")
	 "I68" 470.0:67.5 "R180" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("TOP_ME" "int" 2)
		list("Length" "float" 35.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_tri" "layout")
	 "I79" 425.0:69.99 "R90" 1
	 list(
		;CDF parameters
		;instant properties
		list("TOP_ME" "int" 2)
		list("Length" "float" 40.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_tri" "layout")
	 "I78" 425.0:-69.99 "MYR90" 1
	 list(
		;CDF parameters
		;instant properties
		list("TOP_ME" "int" 2)
		list("Length" "float" 40.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I162" 425.0:(-13.0) "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 4.0)
		list("TOP_ME" "int" 8)
		list("BTM_ME" "int" 2)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I158" 435.0:(-70.5) "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 35.0)
		list("TOP_ME" "int" 3)
		list("Length" "float" 3.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I159" 435.0:67.5 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 35.0)
		list("TOP_ME" "int" 3)
		list("Length" "float" 3.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout")
	 "I74" 435.0:(-32.5) "MY" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("TOP_ME" "int" 2)
		list("Length" "float" 65.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I62" 445.0:9.0 "MY" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 18.7)
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 9)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_tri" "layout")
	 "I77" 425.0:59.99 "MYR90" 1
	 list(
		;CDF parameters
		;instant properties
		list("TOP_ME" "int" 2)
		list("Length" "float" 25.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_tri" "layout")
	 "I76" 425.0:(-59.99) "R90" 1
	 list(
		;CDF parameters
		;instant properties
		list("TOP_ME" "int" 2)
		list("Length" "float" 25.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout")
	 "I81" 346.14:69.99 "R270" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("TOP_ME" "int" 2)
		list("Length" "float" 78.86)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout")
	 "I80" 346.14:(-69.99) "MXR90" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("TOP_ME" "int" 2)
		list("Length" "float" 78.86)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_diagonal" "layout")
	 "I89" 346.14:59.99 "R180" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("TOP_ME" "int" 2)
		list("Length" "float" 40.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_diagonal" "layout")
	 "I88" 346.14:-59.99 "MY" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("TOP_ME" "int" 2)
		list("Length" "float" 40.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "cpw_diff" "layout")
	 "I90" 289.68:0.0 "R270" 1
	 list(
		;CDF parameters
		;list("L" nil 15.32);Ignored!
		;list("L_str" nil "15.32u");Ignored!
		;list("Signal" nil 4.0);Ignored!
		;list("Signal_str" nil "4.0u");Ignored!
		;list("Wall" nil 4.0);Ignored!
		;list("Wall_str" nil "4.0u");Ignored!
		;list("dcr" nil "10K");Ignored!
		;list("corner" nil "1T");Ignored!
		;list("zo" nil "50");Ignored!
		;list("vel" nil "0.4");Ignored!
		;list("SG_Gap" nil 6.0);Ignored!
		;list("SS_Gap" nil 6.0);Ignored!
		;list("len_VoidX" nil 1.0);Ignored!
		;list("len_VoidY" nil 1.0);Ignored!
		;list("len_FillX" nil 1.0);Ignored!
		;list("len_FillY" nil 1.0);Ignored!
		;list("bEMExportSimplification" nil nil);Ignored!
		;list("bBuildWalls" nil t);Ignored!
		;list("PLANE_BTM_ME" nil "6");Ignored!
		;list("PLANE_TOP_ME" nil "6");Ignored!
		;list("TOP_ME" nil "9");Ignored!
		;list("BTM_ME" nil "9");Ignored!
		;list("DUMMYL" nil "RFVLSI");Ignored!
		;list("DUMMYLP" nil "drawing");Ignored!
		;instant properties
		list("Signal_str" "string" "4.0u")
		list("L_str" "string" "15.32u")
		list("Wall_str" "string" "4.0u")
		list("Signal" "float" 4.0)
		list("Wall" "float" 4.0)
		list("SG_Gap" "float" 6.0)
		list("SS_Gap" "float" 6.0)
		list("L" "float" 15.32)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_tri" "layout")
	 "I71" 425.0:-67.5 "MXR90" 1
	 list(
		;CDF parameters
		;instant properties
		list("TOP_ME" "int" 2)
		list("Length" "float" 35.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_tri" "layout")
	 "I70" 425.0:67.5 "MX" 1
	 list(
		;CDF parameters
		;instant properties
		list("TOP_ME" "int" 2)
		list("Length" "float" 35.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I87" 307.0:7.0 "R180" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 2.0)
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 9)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I86" 307.0:-3.0 "R180" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 2.0)
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 9)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I157" 296.14:17.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("Length" "float" 2.99)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout")
	 "I67" 425.0:(-105.0) "MXR90" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 37.5)
		list("TOP_ME" "int" 2)
		list("Length" "float" 10.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout")
	 "I66" 425.0:105.0 "R270" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 37.5)
		list("TOP_ME" "int" 2)
		list("Length" "float" 10.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I179" 434.41:(-20.31) "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 0.5)
		list("TOP_ME" "int" 1)
		list("BTM_ME" "int" 0)
		list("Length" "float" 0.5)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "cpw_diff" "layout")
	 "I93" 271.88:45.97 "R180" 1
	 list(
		;CDF parameters
		;list("L" nil 28.17);Ignored!
		;list("L_str" nil "28.17u");Ignored!
		;list("Signal" nil 4.0);Ignored!
		;list("Signal_str" nil "4.0u");Ignored!
		;list("Wall" nil 4.0);Ignored!
		;list("Wall_str" nil "4.0u");Ignored!
		;list("dcr" nil "10K");Ignored!
		;list("corner" nil "1T");Ignored!
		;list("zo" nil "50");Ignored!
		;list("vel" nil "0.4");Ignored!
		;list("SG_Gap" nil 6.0);Ignored!
		;list("SS_Gap" nil 6.0);Ignored!
		;list("len_VoidX" nil 1.0);Ignored!
		;list("len_VoidY" nil 1.0);Ignored!
		;list("len_FillX" nil 1.0);Ignored!
		;list("len_FillY" nil 1.0);Ignored!
		;list("bEMExportSimplification" nil nil);Ignored!
		;list("bBuildWalls" nil t);Ignored!
		;list("PLANE_BTM_ME" nil "6");Ignored!
		;list("PLANE_TOP_ME" nil "6");Ignored!
		;list("TOP_ME" nil "9");Ignored!
		;list("BTM_ME" nil "9");Ignored!
		;list("DUMMYL" nil "RFVLSI");Ignored!
		;list("DUMMYLP" nil "drawing");Ignored!
		;instant properties
		list("Signal_str" "string" "4.0u")
		list("L_str" "string" "28.17u")
		list("Wall_str" "string" "4.0u")
		list("Signal" "float" 4.0)
		list("Wall" "float" 4.0)
		list("SG_Gap" "float" 6.0)
		list("SS_Gap" "float" 6.0)
		list("L" "float" 28.17)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I175" 305.0:(-17.0) "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 1.14)
		list("TOP_ME" "int" 9)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I174" 305.0:13.0 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 1.14)
		list("TOP_ME" "int" 9)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I156" 296.14:(-19.99) "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("Length" "float" 2.99)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias_diagonal" "layout")
	 "I85" 307.0:(-3.0) "R270" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 4.0)
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 9)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias_diagonal" "layout")
	 "I84" 307.0:3.0 "MXR90" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 4.0)
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 9)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout")
	 "I73" 435.0:(-180.0) "MY" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("TOP_ME" "int" 2)
		list("Length" "float" 75.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout")
	 "I72" 435.0:105.0 "MY" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 10.0)
		list("TOP_ME" "int" 2)
		list("Length" "float" 75.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I160" 253.28:46.77 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 1.2)
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 7)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I161" 253.28:76.77 "R0" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 1.2)
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 7)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "cpwtline45s" "layout")
	 "I94" 254.08:45.97 "R0" 1
	 list(
		;CDF parameters
		;list("bEMExportSimplification" nil t);Ignored!
		;list("len_FillW" nil 0.5);Ignored!
		;list("len_FillL" nil 0.5);Ignored!
		;list("len_VoidW" nil 1.5);Ignored!
		;list("len_VoidL" nil 1.5);Ignored!
		;list("PLANE_BTM_ME" nil 6);Ignored!
		;list("PLANE_TOP_ME" nil 6);Ignored!
		;list("SIGNAL_BTM_ME" nil 9);Ignored!
		;list("SIGNAL_TOP_ME" nil 9);Ignored!
		;list("SS_Gap" nil 6.0);Ignored!
		;list("SG_Gap" nil 6.0);Ignored!
		;list("DIVO" nil 2.5);Ignored!
		;list("DIVI" nil 2.5);Ignored!
		;list("Wall" nil 4.0);Ignored!
		;list("Signal_W" nil 4.0);Ignored!
		;list("Cc" nil 0.0);Ignored!
		;list("C2" nil 0.0);Ignored!
		;list("C1" nil 0.0);Ignored!
		;list("K" nil 0.0);Ignored!
		;list("L2" nil 0.0);Ignored!
		;list("L1" nil 0.0);Ignored!
		;instant properties
		list("Wall" "float" 4.0)
		list("SG_Gap" "float" 6.0)
		list("SS_Gap" "float" 6.0)
		list("Signal_W" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "cpwtline45s" "layout")
	 "I92" 289.68:17.8 "R180" 1
	 list(
		;CDF parameters
		;list("bEMExportSimplification" nil t);Ignored!
		;list("len_FillW" nil 0.5);Ignored!
		;list("len_FillL" nil 0.5);Ignored!
		;list("len_VoidW" nil 1.5);Ignored!
		;list("len_VoidL" nil 1.5);Ignored!
		;list("PLANE_BTM_ME" nil 6);Ignored!
		;list("PLANE_TOP_ME" nil 6);Ignored!
		;list("SIGNAL_BTM_ME" nil 9);Ignored!
		;list("SIGNAL_TOP_ME" nil 9);Ignored!
		;list("SS_Gap" nil 6.0);Ignored!
		;list("SG_Gap" nil 6.0);Ignored!
		;list("DIVO" nil 2.5);Ignored!
		;list("DIVI" nil 2.5);Ignored!
		;list("Wall" nil 4.0);Ignored!
		;list("Signal_W" nil 4.0);Ignored!
		;list("Cc" nil 0.0);Ignored!
		;list("C2" nil 0.0);Ignored!
		;list("C1" nil 0.0);Ignored!
		;list("K" nil 0.0);Ignored!
		;list("L2" nil 0.0);Ignored!
		;list("L1" nil 0.0);Ignored!
		;instant properties
		list("Wall" "float" 4.0)
		list("SG_Gap" "float" 6.0)
		list("SS_Gap" "float" 6.0)
		list("Signal_W" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	 "I75" 435.0:(-9.0) "R180" 1
	 list(
		;CDF parameters
		;instant properties
		list("Width" "float" 6.0)
		list("TOP_ME" "int" 9)
		list("BTM_ME" "int" 2)
		list("Length" "float" 4.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_tri" "layout")
	 "I83" 346.14:59.99 "R90" 1
	 list(
		;CDF parameters
		;instant properties
		list("TOP_ME" "int" 2)
		list("Length" "float" 10.0)
	);close list
	);close dbCreateParamInst */

dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "mesh_tri" "layout")
	 "I82" 346.14:(-59.99) "MYR90" 1
	 list(
		;CDF parameters
		;instant properties
		list("TOP_ME" "int" 2)
		list("Length" "float" 10.0)
	);close list
	);close dbCreateParamInst */

;------------starting generating figs------------------
label_1=dbCreateLabel(pcCellView list("M9" "pin") 
	231.735:70.02
	"LO_IM" "centerCenter" "R0" "roman" 1.0)
label_1~>labelType="normalLabel"
label_2=dbCreateLabel(pcCellView list("M9" "pin") 
	231.735:76.79
	"LO_IP" "centerCenter" "R0" "roman" 1.0)
label_2~>labelType="normalLabel"
dbCreateRect(pcCellView list("M2" "drawing") 
	list(425.33:(-13.43) 434.76:(-8.465)))
dbCreateRect(pcCellView list("M9" "drawing") 
	list(228.18:75.855 230.745:77.855))
dbCreateRect(pcCellView list("M9" "drawing") 
	list(230.565:75.855 241.565:77.855))
dbCreateRect(pcCellView list("M9" "drawing") 
	list(230.565:68.995 239.045:70.995))
dbCreateRect(pcCellView list("M9" "drawing") 
	list(228.18:68.995 230.745:70.995))
label_3=dbCreateLabel(pcCellView list("M1" "pin") 
	433.405:(-18.0)
	"vss" "centerCenter" "R0" "roman" 5.0)
label_3~>labelType="normalLabel"
label_4=dbCreateLabel(pcCellView list("M9" "pin") 
	440.39:10.645
	"LO_IN" "centerCenter" "R0" "roman" 1.0)
label_4~>labelType="normalLabel"
label_5=dbCreateLabel(pcCellView list("M9" "pin") 
	231.735:70.02
	"LO_IM" "centerCenter" "R0" "roman" 1.0)
label_5~>labelType="normalLabel"
label_6=dbCreateLabel(pcCellView list("M9" "pin") 
	231.735:76.79
	"LO_IP" "centerCenter" "R0" "roman" 1.0)
label_6~>labelType="normalLabel"
dbCreateRect(pcCellView list("M2" "drawing") 
	list(425.51:(-8.745) 434.71:(-8.1)))
dbCreateRect(pcCellView list("M2" "drawing") 
	list(425.49:(-13.83) 434.6:(-13.25))
dbCreateRect(pcCellView list("M6" "drawing") 
	list(288.88:16.89 290.295:18.415))
dbCreateRect(pcCellView list("M6" "drawing") 
	list(253.23:44.385 254.88:46.47))
dbCreateRect(pcCellView list("M6" "drawing") 
	list(253.23:45.965 254.08:50.765))

;---------------------;creating nets
;---------------------;creating terminals
;---------------------;creating vias
))