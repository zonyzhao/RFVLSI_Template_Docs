
strCellName="vias_dmexcl";	  /*Assign your cell name to variable strCellName*/

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
        (BTM_ME	"int" 1)
        (TOP_ME	"int" 9)
        (AP_ME	"boolean" t)
        (Width	"float" 10.0)
        (Length	"float" 10.0)
        (DMEXCL	"string" "DMEXCL")
        (POBLK	"boolean" nil)
        (ODBLK	"boolean" nil)
)
let((techfile_lib techFileID maskGrid ret),
     ;   fprintf(stderr "DMEXCL Stack by  TAO YI LEE (michael@michaelgod.idv.tw)\nRFVLSILAB, NCTU\n")

	declare(rect((TOP_ME-BTM_ME+1)))
	for(i BTM_ME TOP_ME
		rect((i-BTM_ME)) = rodCreateRect(
                        ?layer list(DMEXCL,strcat("dummy", sprintf(nil "%d",i)))
                        ?length Length
                        ?width  Width
                        ?origin 0:0
                        ?cvId   pcCellView
                );
        )
	if(POBLK
	then
		rodCreateRect(?layer list("POBLK", "dummy")
        	?length Length
            ?width  Width
            ?origin 0:0
            ?cvId   pcCellView
        )
	)
	if(ODBLK
    then
        rodCreateRect(?layer list("ODBLK", "dummy")
            ?length Length
            ?width  Width
            ?origin 0:0
            ?cvId   pcCellView
        )
    )

	ret = rodAssignHandleToParameter(
                ?parameter "Width"
                ?rodObj rect(0)
                ?displayName "Width"
                ?displayExpression "Width"
                ?handleName list("upperLeft","centerLeft","lowerLeft","upperRight","centerRight","lowerRight")
                ?stretchType "relative"
                ?moveOrigin t
                ?stretchDir "x"
                ?userData list(1 maskGrid)
                ?userFunction "param_CB"
        ) ; end rodAssignHandleToParameter

	ret = rodAssignHandleToParameter(
                ?parameter "Length"
                ?rodObj rect(0)
                ?displayName "Length"
                ?displayExpression "Length"
                ?handleName list("upperLeft","centerLeft","lowerLeft","upperRight","upperCenter","lowerCenter")
                ?stretchType "relative"
                ?moveOrigin t
                ?stretchDir "y"
                ?userData list(1 maskGrid)
                ?userFunction "param_CB"
        ) ; end rodAssignHandleToParameter


	if(AP_ME
	then
                        dbCreateRect(pcCellView, list(DMEXCL,"dummya"),list(0:0 Width:Length))
        )
)/*end of let*/
)/*end of pcDefinePCell*/
