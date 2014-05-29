strLibName="65nmPAD";	My Library name is my student id
strCellName="RFGND_PAD";	The Cell Name is called Inductor
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
let((Width mater),
	master = dbOpenCellViewByType(rfvlsi_pcell_lib_name "mesh_rect" "layout"); get the master view of a single turn layout

	Width = WidthR+WidthL

)/*end of let*/
)/*end of pcDefinePCell*/

