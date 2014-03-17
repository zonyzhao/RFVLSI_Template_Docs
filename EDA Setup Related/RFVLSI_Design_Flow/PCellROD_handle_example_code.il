; this pcell code use "ROD handle" to pass low level coordinate point
; to higher level. 
; This is like retrieving properties from child-object in Object-Oriented Programming.
; Note, we can pass not only reference point. But also: infomation, includeing, int, float, etc. Please read ROD manual
; "VirtuosoR Relative Object Design"
; This file is proprietry to RFVLSI Lab, NCTU, HsinChu, Taiwan.
; Copyright, 2014. Yu-Jiu Wang.

strLibName="yj_lib"
strCellName="vias"

pcDefinePCell(
list(ddGetObj(strLibName),"ROD1", "layout"),
(
	(Sep  "float" 2.0)
	;(force_drc	"boolean" t) % removed by YWANG on 2013/02/24, it is not a good idea not to place vias!!!, because it might cause chip failure.
)
let((netx Pitch num_Horz_Vias num_Vert_Vias len_Horz_Edge len_Vert_Edge m PP_ext NP_ext enc_prime),

	rodCreateRect(
                ?layer list("M2" "drawing")
                ?length 1.0
                ?width  1.0
                ?origin 0:0 
                ?cvId   pcCellView
                );  
				
	rodId = rodGetObj( "" pcCellView)
	rodCreateHandle( ?name "SepPoint"
		?type "point"
		?value rodSubPoints(Sep+1.0:0 rodId~>lowerLeft) 
		?rodObj rodId
	) ; use rodCreateHandle to create a "reference point" named "SepPoint" for the current pCell.. 
	; The reference point is equal to (Sep+1.0:0) in current pCell Coordinate System.


)/*end of let*/
)/*end of pcDefinePCell*/

pcDefinePCell(
list(ddGetObj(strLibName),"ROD2", "layout"),
(
	(Sep2  "float" 2.0)
	;(force_drc	"boolean" t) % removed by YWANG on 2013/02/24, it is not a good idea not to place vias!!!, because it might cause chip failure.
)
let((netx Pitch num_Horz_Vias num_Vert_Vias len_Horz_Edge len_Vert_Edge m PP_ext NP_ext enc_prime),
	
	master = dbOpenCellViewByType(pcCellView~>lib "ROD1" "layout")	;get the master view of "vias"
	
	dbCreateParamInst(pcCellView master "rod1" 1:1 "R0" 	1
		list(list("Sep"  "float" Sep2)) ;passing to lower level.
	)
	
	rodCreateRect(
        ?layer list("M1" "drawing")
        ?length 1.0
        ?width  1.0
        ?origin rodGetObj( "rod1" pcCellView)~>SepPoint ;retrieve reference point (ROD handle from low level)
        ?cvId   pcCellView
        );  
	printf("SepPoint:%L" rodGetObj( "rod1" pcCellView)~>SepPoint)
	printf("lowerLeft:%L" rodGetObj( "rod1" pcCellView)~>lowerLeft)
)/*end of let*/
)/*end of pcDefinePCell*/

