
strCellName="base_admexcl";	  /*Assign your cell name to variable strCellName*/
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
let((i rect),
	for(i BTM_ME+1 TOP_ME
			rodCreateRect(
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
rect = rodCreateRect(
                        ?layer list(DMEXCL,strcat("dummy", sprintf(nil "%d", BTM_ME)))
                        ?length Length
                        ?width  Width
                        ?origin 0:0
                        ?cvId   pcCellView
            );

	ret = rodAssignHandleToParameter(
                ?parameter "Width"
                ?rodObj rect
                ?displayName "Width"
                ?displayExpression "Width"
                ?handleName list("upperLeft","centerLeft","lowerLeft","upperRight","centerRight","lowerRight")
                ?stretchType "relative"
                ?moveOrigin t
                ?stretchDir "x"
                ?userFunction "std_CB"
        ) ; end rodAssignHandleToParameter

	ret = rodAssignHandleToParameter(
                ?parameter "Length"
                ?rodObj rect
                ?displayName "Length"
                ?displayExpression "Length"
                ?handleName list("upperLeft","centerLeft","lowerLeft","upperRight","upperCenter","lowerCenter")
                ?stretchType "relative"
                ?moveOrigin t
                ?stretchDir "y"
                ?userFunction "std_CB"
        ) ; end rodAssignHandleToParameter


	if(AP_ME
	then
                        dbCreateRect(pcCellView, list(DMEXCL,"dummya"),list(0:0 Width:Length))
    )
)/*end of let*/
)/*end of pcDefinePCell*/
