' Begining Technology-dependent Codes
' All number in um. 
' RF-VLSI Lab, National Chiao-Tung University.
' All Rights Reserved, 2012

Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Set oAnsoftApp = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oAnsoftApp.GetAppDesktop()
oDesktop.RestoreWindow
oDesktop.NewProject
'oDesktop.OpenProject "F:\Dropbox\ANTLR\HFSS_API\examples\T65_SYM_2T\nominal.hfss"
Set oProject = oDesktop.GetActiveProject

oProject.InsertDesign "HFSS","cpwtline45s", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("cpwtline45s")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oProject.SaveAs "C:\Users\Wang\Documents\GitHub\RFVLSI_Template_Docs\SKILL_TO_EM_self_contained_release\cpwtline45s;Sig;2.0;Wal;2.0;DIV;2.5;DIV;2.5;SG_;2.0;SS_;2.0;OFF;0.8;SIG;9;SIG;9;PLA;6;PLA;6;len;1.5;len;1.5;len;0.5;len;0.5.hfss", true
DefineNewMetal "PO",625000.0
rfvlsi_totoal_PO_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "CO",160680.52930056708
rfvlsi_totoal_CO_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL1",3.4722222222222224E7
rfvlsi_totoal_METAL1_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via1",2205419.0296156267
rfvlsi_totoal_Via1_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL2",3.2467532467532463E7
rfvlsi_totoal_METAL2_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via2",2205419.0296156267
rfvlsi_totoal_Via2_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL3",3.2467532467532463E7
rfvlsi_totoal_METAL3_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via3",2205419.0296156267
rfvlsi_totoal_Via3_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL4",3.2467532467532463E7
rfvlsi_totoal_METAL4_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via4",2205419.0296156267
rfvlsi_totoal_Via4_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL5",3.2467532467532463E7
rfvlsi_totoal_METAL5_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via5",2205419.0296156267
rfvlsi_totoal_Via5_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL6",3.2467532467532463E7
rfvlsi_totoal_METAL6_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via6",2205419.0296156267
rfvlsi_totoal_Via6_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL7",3.2467532467532463E7
rfvlsi_totoal_METAL7_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via7",3338945.0056116725
rfvlsi_totoal_Via7_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL8",5.05050505050505E7
rfvlsi_totoal_METAL8_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via8",2469135.8024691353
rfvlsi_totoal_Via8_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL9",5.88235294117647E7
rfvlsi_totoal_METAL9_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via9",542005.4200542006
rfvlsi_totoal_Via9_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL10",3.2840722495894913E7
rfvlsi_totoal_METAL10_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

oProject.Save
rfvlsi_em_sim_piority = 0

rfvlsi_em_export = 100
rfvlsi_print_DIE=False

Set oEditor = oDesign.SetActiveEditor("3D Modeler")

Function floor(Number)
	floor=Int(Number)
End Function

function Ceil(Number)
    Ceil = Int(Number)
    if Ceil <> Number then
        Ceil = Ceil + 1
    end if
end function

Function ceiltogrid(Number)
	ceiltogrid=Ceil(Number/rfvlsi_maskgrid)*rfvlsi_maskgrid
End Function

Function floortogrid(Number)
	floortogrid=Floor(Number/rfvlsi_maskgrid)*rfvlsi_maskgrid
End Function

Function pcRound(Number)
	pcRound=Round(Number)
End Function

Function atoi(Number)
	atoi=CInt(Number)
End Function

Function sqrt(Number)
	sqrt=sqr(Number)
End Function

Function Max(Number1, Number2)
	If (Number1>Number2) Then
		Max=Number1
	Else
		Max=Number2
	End If 
End Function

Function Min(Number1, Number2)
	If (Number1<Number2) Then
		Min=Number1
	Else
		Min=Number2
	End If 
End Function

Function cdfParseFloatString(strFloat)
        value=0.0
        if(Right(strFloat,1)="T") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e12
        Elseif (Right(strFloat,1)="G") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e9
        Elseif (Right(strFloat,1)="M") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e6
        Elseif (Right(strFloat,1)="K") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e3
        Elseif (Right(strFloat,1)="k") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e3
        Elseif (Right(strFloat,1)="m") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-3
        Elseif (Right(strFloat,1)="u") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-6
        Elseif (Right(strFloat,1)="n") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-9
        Elseif (Right(strFloat,1)="p") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-12
        Elseif (Right(strFloat,1)="f") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-15
        Elseif (Right(strFloat,1)="a") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-18
        Else
                value=CDbl(Left(strFloat,(Len(strFloat))))
        End If

       cdfParseFloatString=value
End Function

Function roundtogrid(Number)
	roundtogrid=Round(Number/rfvlsi_maskgrid)*rfvlsi_maskgrid
End Function

''Drawing output functions:
Sub CMetalRect(strORIENT, iMetalIndex, fOriginX, fOriginY, fWidth, fLength, iNumX, iNumY, fSpaceX, fSpaceY)			
	For iXCreateBox=0 To (iNumX-1) 
		For iYCreateBox=0 To (iNumY-1) 
                	if((Len(Cstr(MetalName(iMetalIndex))) <> 0) AND (fWidth<>0) AND (fLength<>0) ) Then
                            oEditor.CreateBox _
                            Array("NAME:BoxParameters", _
                            "XPosition:=", cstr(rfvlsi_newOriginX(fOriginX, fOriginY, strORIENT, (iXCreateBox*(fWidth+fSpaceX)), (iYCreateBox*(fLength+fSpaceY)), rfvlsi_ORIENT_R0))&"um" , _
                            "YPosition:=", cstr(rfvlsi_newOriginY(fOriginX, fOriginY, strORIENT, (iXCreateBox*(fWidth+fSpaceX)), (iYCreateBox*(fLength+fSpaceY)), rfvlsi_ORIENT_R0))&"um" , _
                            "ZPosition:=", cstr(MetalHeight(iMetalIndex))&"um", _
                            "XSize:=", cstr(rfvlsi_newOriginX(0, 0, strORIENT, fWidth, fLength, rfvlsi_ORIENT_R0)) &"um", _
                            "YSize:=", cstr(rfvlsi_newOriginY(0, 0, strORIENT, fWidth, fLength, rfvlsi_ORIENT_R0)) &"um", _
                            "ZSize:=", cstr(MetalThickness(iMetalIndex))&"um"), _
                            Array("NAME:Attributes", _
                            "Name:=", MetalName(iMetalIndex), _
                            "Flags:=", "", _
                            "Color:=", "(132 132 193)", _
                            "Transparency:=", 0.75, _
                            "PartCoordinateSystem:=", "Global", _
                            "MaterialName:=",  MetalMaterial(iMetalIndex), _
                            "SolveInside:=", false)

                            MetalCountPlusOne iMetalIndex
                        End If
		Next
	Next
End Sub

Sub CViaRect(strORIENT, iViaIndex, fOriginX, fOriginY, fWidth, fLength, iNumX, iNumY, fSpaceX, fSpaceY)			
	For iXCreateBox=0 To (iNumX-1) 
		For iYCreateBox=0 To (iNumY-1) 
			oEditor.CreateBox _
			Array("NAME:BoxParameters", _
			"XPosition:=", cstr(rfvlsi_newOriginX(fOriginX, fOriginY, strORIENT, (iXCreateBox*(fWidth+fSpaceX)), (iYCreateBox*(fLength+fSpaceY)), rfvlsi_ORIENT_R0)) &"um", _
			"YPosition:=", cstr(rfvlsi_newOriginY(fOriginX, fOriginY, strORIENT, (iXCreateBox*(fWidth+fSpaceX)), (iYCreateBox*(fLength+fSpaceY)), rfvlsi_ORIENT_R0)) &"um", _
			"ZPosition:=", Cstr(ViaHeight(iViaIndex))&"um", _
			"XSize:=", cstr(rfvlsi_newOriginX(0, 0, strORIENT, fWidth, fLength, rfvlsi_ORIENT_R0)) &"um", _
			"YSize:=", cstr(rfvlsi_newOriginY(0, 0, strORIENT, fWidth, fLength, rfvlsi_ORIENT_R0)) &"um", _
			"ZSize:=", Cstr(ViaThickness(iViaIndex))&"um"), _
			Array("NAME:Attributes", _
			"Name:=", ViaName(iViaIndex), _
			"Flags:=", "", _
			"Color:=", "(132 132 193)", _
			"Transparency:=", 0.75, _
			"PartCoordinateSystem:=", "Global", _
			"MaterialName:=",  ViaMaterial(iViaIndex), _
			"SolveInside:=", false)

                         ViaCountPlusOne iViaIndex
		Next
	Next
End Sub

Sub CMetalPolygon(iMetalIndex,hfss_ThicknessFactor,XArray,YArray)
	Dim strPolyname
	Dim iNumPts
	iNumPts=UBound(XArray)+1
	Dim arrayPolyLinePoints
	Redim arrayPolyLinePoints(iNumPts)' staring from index 0,point1, ... , pointLast

	Dim iPts
	arrayPolyLinePoints(0)="NAME:PolylinePoints"
	For iPts=1 To (iNumPts) 
		arrayPolylinePoints(iPts)=Array("NAME:PLPoint", "X:=", XArray(iPts-1)&"um", "Y:=",  YArray(iPts-1)&"um", "Z:=", Cstr(MetalHeight(iMetalIndex))&"um")
	Next

	Dim arrayPolyLineSegments
	Redim arrayPolyLineSegments(iNumPts-1)
	arrayPolyLineSegments(0)="NAME:PolylineSegments"
	For iPts=1 To (iNumPts-1) 
		arrayPolyLineSegments(iPts)=Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", iPts-1, "NoOfPoints:=", iNumPts-2)
	Next

	idPolyShape = oEditor.CreatePolyline(Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  true, arrayPolylinePoints, arrayPolyLineSegments), _
	Array("NAME:Attributes", "Name:=", MetalName(iMetalIndex), "Flags:=", "", "Color:=",  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=", "", "MaterialValue:=", Chr(34)&"vacuum"&Chr(34), "SolveInside:=", true))

	oEditor.ThickenSheet Array("NAME:Selections", "Selections:=", idPolyShape, "NewPartsModelFlag:=",  _
	  "Model"), Array("NAME:SheetThickenParameters", "Thickness:=", Cstr(hfss_ThicknessFactor&MetalThickness(iMetalIndex))&"um", "BothSides:=",  _
	  false)

	oEditor.AssignMaterial Array("NAME:Selections", "Selections:=", idPolyShape), Array("NAME:Attributes", "MaterialValue:=",  _
	  Chr(34)&MetalMaterial(iMetalIndex)&Chr(34), "SolveInside:=", false)

        MetalCountPlusOne iMetalIndex
End Sub

Sub CViaPolygon(iViaIndex,hfss_ThicknessFactor,XArray,YArray)
	Dim strPolyname
	Dim iNumPts
	iNumPts=UBound(XArray)+1
	Dim arrayPolyLinePoints
	Redim arrayPolyLinePoints(iNumPts)' staring from index 0,point1, ... , pointLast

	Dim iPts
	arrayPolyLinePoints(0)="NAME:PolylinePoints"
	For iPts=1 To (iNumPts) 
		arrayPolylinePoints(iPts)=Array("NAME:PLPoint", "X:=", XArray(iPts-1)&"um", "Y:=",  YArray(iPts-1)&"um", "Z:=", Cstr(ViaHeight(iViaIndex))&"um")
	Next

	Dim arrayPolyLineSegments
	Redim arrayPolyLineSegments(iNumPts-1)
	arrayPolyLineSegments(0)="NAME:PolylineSegments"
	For iPts=1 To (iNumPts-1) 
		arrayPolyLineSegments(iPts)=Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", iPts-1, "NoOfPoints:=", iNumPts-2)
	Next

	idPolyShape = oEditor.CreatePolyline( _
	Array("NAME:PolylineParameters", _
	"IsPolylineCovered:=", true, _
	"IsPolylineClosed:=",  true, _
	arrayPolylinePoints, _
	arrayPolyLineSegments), _ 
	Array("NAME:Attributes", "Name:=", ViaName(iViaIndex), "Flags:=", "", "Color:=",  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=", "", "MaterialValue:=", Chr(34)&"vacuum"&Chr(34), "SolveInside:=", true))

	oEditor.ThickenSheet Array("NAME:Selections", "Selections:=", idPolyShape, "NewPartsModelFlag:=",  _
	  "Model"), Array("NAME:SheetThickenParameters", "Thickness:=", Cstr(hfss_ThicknessFactor&ViaThickness(iViaIndex))&"um", "BothSides:=",  _
	  false)

	oEditor.AssignMaterial Array("NAME:Selections", "Selections:=", idPolyShape), Array("NAME:Attributes", "MaterialValue:=",  _
	  Chr(34)&ViaMaterial(iViaIndex)&Chr(34), "SolveInside:=", false)

       ViaCountPlusOne iViaIndex
End Sub

Sub DefineNewMetal(metal_name, conductivity)
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.AddMaterial _
    Array("NAME:" & metal_name, _
    "CoordinateSystemType:=","Cartesian",_
    "conductivity:=", conductivity)
End Sub

Sub CDielectric(dielectric_name, permitivity, conductivity, losstangent, fOriginX, fOriginY, fOriginZ, fWidth, fLength, fThickness, priority)
If (rfvlsi_em_sim_piority<=priority) Then
    Set oDefinitionManager = oProject.GetDefinitionManager()
    oDefinitionManager.AddMaterial _
        Array("NAME:" & dielectric_name, _
        "CoordinateSystemType:=","Cartesian",_
        "permittivity:=", permitivity, _
        "conductivity:=", conductivity, _
        "dielectric_loss_tangent:=", losstangent)

    oEditor.CreateBox _
            Array("NAME:BoxParameters", _
                "XPosition:=", cstr(fOriginX) & "um", _
                "YPosition:=", cstr(fOriginY) & "um", _
                "ZPosition:=", cstr(fOriginZ) & "nm", _
                "XSize:=", cstr(fWidth) &"um", _
                "YSize:=", cstr(fLength) &"um", _
                "ZSize:=", cstr(fThickness) &"nm"), _
            Array("NAME:Attributes", _
                "Name:=", dielectric_name, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 0.1, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=",  dielectric_name, _
                "SolveInside:=", true)
    End If
End Sub

Sub CBoundary(X0, Y0, Z0, XSize, YSize, ZSize, priority)
    If rfvlsi_em_sim_piority<= priority Then
        oEditor.CreateBox _
            Array("NAME:BoxParameters", _
            "XPosition:=", cstr(X0)&"um" , _
            "YPosition:=", cstr(Y0)&"um" , _
            "ZPosition:=", cstr(Z0)&"um", _
            "XSize:=", cstr(XSize) &"um", _
            "YSize:=", cstr(YSize) &"um", _
            "ZSize:=", cstr(ZSize) &"um"), _
            Array("NAME:Attributes", _
            "Name:=", "RadiationBoundary", _
            "Flags:=", "", _
            "Color:=", "(132 132 193)", _
            "Transparency:=", 0.05, _
            "PartCoordinateSystem:=", "Global", _
            "MaterialName:=",  "Air", _
            "SolveInside:=", True)

        Set oModule = oDesign.GetModule("BoundarySetup")
        oModule.AssignRadiation _
            Array("NAME:RadiationBoundary", _
            "Objects:=", Array("RadiationBoundary"))

        oProject.Save
    End If
End Sub

Sub CVport(portName,X1,Y1, X2, Y2, Width, strAxis, iMetalStart, iMetalStop, priority)
    If (rfvlsi_em_sim_piority<=priority) Then
        If strAxis="X" Then
            oEditor.CreateRectangle _
                Array("NAME:RectangleParameters", _
                "IsCovered:=", true, _
                "XStart:=", Cstr(X1) & "um", _
                "YStart:=", Cstr(Y1) &"um", _
                "ZStart:=", Cstr(MetalHeight(iMetalStart)) & "um", _
                "Width:=", Cstr(Width) & "um", _
                "Height:=", Cstr(MetalHeight(iMetalStop)+MetalThickness(iMetalStop)-MetalHeight(iMetalStart))&"um", _
                "WhichAxis:=", strAxis), _
                Array("NAME:Attributes", _
                "Name:=", "sheet_" &portName, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 5.000000e-001, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=", "vacuum", _
                "SolveInside:=", true)
        Else
            oEditor.CreateRectangle _
                Array("NAME:RectangleParameters", _
                "IsCovered:=", true, _
                "XStart:=", Cstr(X1) & "um", _
                "YStart:=", Cstr(Y1) &"um", _
                "ZStart:=", Cstr(MetalHeight(iMetalStart)) & "um", _
                "Width:=", Cstr(MetalHeight(iMetalStop)+MetalThickness(iMetalStop)-MetalHeight(iMetalStart))&"um", _
                "Height:=", Cstr(Width) & "um", _
                "WhichAxis:=", strAxis), _
                Array("NAME:Attributes", _
                "Name:=", "sheet_" &portName, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 5.000000e-001, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=", "vacuum", _
                "SolveInside:=", true)
        End If

        Set oModule = oDesign.GetModule("BoundarySetup")

        oModule.AssignLumpedPort Array("NAME:"&portName, "Objects:=", Array("sheet_" &portName), "RenormalizeAllTerminals:=",  _
          true, Array("NAME:Modes", Array("NAME:Mode1", "ModeNum:=", 1, "UseIntLine:=", true, Array("NAME:IntLine", "Start:=", Array( _
          Cstr((X1+X2)/2) & "um", Cstr((Y1+Y2)/2) & "um", Cstr(MetalHeight(iMetalStart)) & "um"), "End:=", Array(Cstr((X1+X2)/2) & "um",  _
          Cstr((Y1+Y2)/2) & "um", Cstr(MetalHeight(iMetalStop)+MetalThickness(iMetalStop)) & "um")), "CharImp:=", "Zpi", "RenormImp:=",  _
          "50ohm")), "ShowReporterFilter:=", false, "ReporterFilter:=", Array(true), "FullResistance:=",  _
          "50ohm", "FullReactance:=", "0ohm")

        'Below is for driven-terminal simulatoin.
        'Dim faceID 
        'faceID=oEditor.GetFaceByPosition(Array("NAME:Parameters", _
        '"BodyName:=", "sheet_" &portName, "XPosition:=", Cstr((X1+X2)/2)&"um", "YPosition:=", _
        'Cstr((Y1+Y2)/2)&"um", "ZPosition:=",  Cstr(MetalHeight(iMetalStop)+(MetalThickness(iMetalStop)-MetalHeight(iMetalStart))/2)&"um"))
        'oModule.AutoIdentifyPorts Array("NAME:Faces", faceID), false, Array("NAME:ReferenceConductors",  _
        '  MetalName(iMetalStart)), portName, true

        'oModule.AssignTerminal Array("NAME:" & portName & "_T1", "Objects:=", Array("sheet_" &portName), "ParentBndID:=",  _
        '  portName, "TerminalResistance:=", "50ohm")

        oProject.Save
    End If    
End Sub


Sub CHport(portName,X0,Y0, Width, Xi1, Yi1, Xi2,Yi2,iMetal, Axis, priority)
MsgBox Cstr(X0) & ":" & Cstr(Y0)
MsgBox Width
MsgBox Cstr(Xi1)&":"&Cstr(Yi1)
MsgBox  Cstr(Xi2)&":"&Cstr(Yi2)
    If (rfvlsi_em_sim_piority<=priority) Then
        If(Axis="X") Then
            oEditor.CreateRectangle _
                Array("NAME:RectangleParameters", _
                "IsCovered:=", true, _
                "XStart:=", Cstr(X0) & "um", _
                "YStart:=", Cstr(Y0) &"um", _
                "ZStart:=", Cstr(MetalHeight(iMetal)) & "um", _
                "Width:=", Cstr(Width) & "um", _
                "Height:=", Cstr(MetalThickness(iMetal))&"um", _
                "WhichAxis:=", Axis), _
                Array("NAME:Attributes", _
                "Name:=", "sheet_" &portName, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 5.000000e-001, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=", "vacuum", _
                "SolveInside:=", true)
        Else
             oEditor.CreateRectangle _
                Array("NAME:RectangleParameters", _
                "IsCovered:=", true, _
                "XStart:=", Cstr(X0) & "um", _
                "YStart:=", Cstr(Y0) &"um", _
                "ZStart:=", Cstr(MetalHeight(iMetal)) & "um", _
                "Width:=", Cstr(MetalThickness(iMetal))&"um", _
                "Height:=", Cstr(Width) & "um", _
                "WhichAxis:=", Axis), _
                Array("NAME:Attributes", _
                "Name:=", "sheet_" &portName, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 5.000000e-001, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=", "vacuum", _
                "SolveInside:=", true)       
        End If
        Set oModule = oDesign.GetModule("BoundarySetup")
        oModule.AssignLumpedPort Array("NAME:"&portName, "Objects:=", Array("sheet_" &portName), "RenormalizeAllTerminals:=",  _
          true, Array("NAME:Modes", Array("NAME:Mode1", "ModeNum:=", 1, "UseIntLine:=", true, Array("NAME:IntLine", "Start:=", Array( _
          Cstr(Xi1) & "um", Cstr(Yi1) & "um", Cstr(MetalHeight(iMetal)+(MetalThickness(iMetal))/2) & "um"), "End:=", Array(Cstr(Xi2) & "um",  _
          Cstr(Yi2) & "um", Cstr(MetalHeight(iMetal)+(MetalThickness(iMetal))/2) & "um")), "CharImp:=", "Zpi", "RenormImp:=",  _
          "50ohm")), "ShowReporterFilter:=", false, "ReporterFilter:=", Array(true), "FullResistance:=",  _
          "50ohm", "FullReactance:=", "0ohm")

        oProject.Save
    End If    
End Sub

Sub CHportXY(portName,X0,Y0, Width, Height, Xi1, Yi1, Xi2,Yi2,iMetal, priority)


    If (rfvlsi_em_sim_piority<=priority) Then
            oEditor.CreateRectangle _
                Array("NAME:RectangleParameters", _
                "IsCovered:=", true, _
                "XStart:=", Cstr(X0) & "um", _
                "YStart:=", Cstr(Y0) &"um", _
                "ZStart:=", Cstr(MetalHeight(iMetal)+MetalThickness(iMetal)) & "um", _
                "Width:=", Cstr(Width) & "um", _
                "Height:=", Cstr(Height)&"um", _
                "WhichAxis:=", "Z"), _
                Array("NAME:Attributes", _
                "Name:=", "sheet_" &portName, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 5.000000e-001, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=", "vacuum", _
                "SolveInside:=", true)

        Set oModule = oDesign.GetModule("BoundarySetup")
        oModule.AssignLumpedPort Array("NAME:"&portName, "Objects:=", Array("sheet_" &portName), "RenormalizeAllTerminals:=",  _
          true, Array("NAME:Modes", Array("NAME:Mode1", "ModeNum:=", 1, "UseIntLine:=", true, Array("NAME:IntLine", "Start:=", Array( _
          Cstr(Xi1) & "um", Cstr(Yi1) & "um", Cstr(MetalHeight(iMetal)+(MetalThickness(iMetal))) & "um"), "End:=", Array(Cstr(Xi2) & "um",  _
          Cstr(Yi2) & "um", Cstr(MetalHeight(iMetal)+(MetalThickness(iMetal))) & "um")), "CharImp:=", "Zpi", "RenormImp:=",  _
          "50ohm")), "ShowReporterFilter:=", false, "ReporterFilter:=", Array(true), "FullResistance:=",  _
          "50ohm", "FullReactance:=", "0ohm")

        oProject.Save
    End If    
End Sub

'Orientation Constant Definition:
Const rfvlsi_ORIENT_R0 = 0
Const rfvlsi_ORIENT_R90 = 1
Const rfvlsi_ORIENT_R180 = 2
Const rfvlsi_ORIENT_R270 = 3
Const rfvlsi_ORIENT_MX = 4
Const rfvlsi_ORIENT_MXR90 = 5
Const rfvlsi_ORIENT_MY = 6
Const rfvlsi_ORIENT_MYR90 = 7

Dim rfvlsiHFSS_RotateR0By
Dim rfvlsiHFSS_RotateR90By
Dim rfvlsiHFSS_RotateR180By
Dim rfvlsiHFSS_RotateR270By
Dim rfvlsiHFSS_RotateMXBy
Dim rfvlsiHFSS_RotateMXR90By
Dim rfvlsiHFSS_RotateMYBy
Dim rfvlsiHFSS_RotateMYR90By

rfvlsiHFSS_RotateR0By=Array(0,1,2,3,4,5,6,7)
rfvlsiHFSS_RotateR90By=Array(1,2,3,0,7,4,5,6)
rfvlsiHFSS_RotateR180By=Array(2,3,0,1,6,7,4,5)
rfvlsiHFSS_RotateR270By=Array(3,0,1,2,5,6,7,4)
rfvlsiHFSS_RotateMXBy=Array(4,5,6,7,0,1,2,3)
rfvlsiHFSS_RotateMXR90By=Array(5,6,7,4,3,0,1,2)
rfvlsiHFSS_RotateMYBy=Array(6,7,4,5,2,3,0,1)
rfvlsiHFSS_RotateMYR90By=Array(7,4,5,6,1,2,3,0)


Function rfvlsiHFSS_ThicknessFactor(rfvlsiHFSS_ORIENT)

	Select Case rfvlsiHFSS_ORIENT
      Case rfvlsi_ORIENT_R0
		rfvlsiHFSS_ThicknessFactor=""
      Case rfvlsi_ORIENT_R90
		rfvlsiHFSS_ThicknessFactor=""
      Case rfvlsi_ORIENT_R180
		rfvlsiHFSS_ThicknessFactor=""
      Case rfvlsi_ORIENT_R270
		rfvlsiHFSS_ThicknessFactor=""
      Case rfvlsi_ORIENT_MX
		rfvlsiHFSS_ThicknessFactor="-"
      Case rfvlsi_ORIENT_MXR90
		rfvlsiHFSS_ThicknessFactor="-"
      Case rfvlsi_ORIENT_MY
		rfvlsiHFSS_ThicknessFactor="-"
	  Case Else
		rfvlsiHFSS_ThicknessFactor="-"
   End Select

End Function

Function rfvlsi_newORIENT(orient1, orient2)
      Select Case orient2
      Case rfvlsi_ORIENT_R0
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR0By(orient1)
      Case rfvlsi_ORIENT_R90
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR90By(orient1)
      Case rfvlsi_ORIENT_R180
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR180By(orient1)
      Case rfvlsi_ORIENT_R270
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR270By(orient1)
      Case rfvlsi_ORIENT_MX
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMXBy(orient1)
      Case rfvlsi_ORIENT_MXR90
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMXR90By(orient1)
      Case rfvlsi_ORIENT_MY
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMYBy(orient1)
	  Case Else
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMYR90By(orient1)
   End Select
End Function

Function rfvlsi_newOriginX(offsetX, offsetY, offset_ORIENT, originX, originY, origin_ORIENT)
	Select Case offset_ORIENT
      Case rfvlsi_ORIENT_R0
		rfvlsi_newOriginX=offsetX+originX
      Case rfvlsi_ORIENT_R90
		rfvlsi_newOriginX=offsetX-originY
      Case rfvlsi_ORIENT_R180
		rfvlsi_newOriginX=offsetX-originX
      Case rfvlsi_ORIENT_R270
		rfvlsi_newOriginX=offsetX+originY
      Case rfvlsi_ORIENT_MX
		rfvlsi_newOriginX=offsetX+originX
      Case rfvlsi_ORIENT_MXR90
		rfvlsi_newOriginX=offsetX+originY
      Case rfvlsi_ORIENT_MY
		rfvlsi_newOriginX=offsetX-originX
	  Case Else
		rfvlsi_newOriginX=offsetX-originY
   End Select
End Function

Function rfvlsi_newOriginY(offsetX, offsetY, offset_ORIENT, originX, originY, origin_ORIENT)
	Select Case offset_ORIENT
      Case rfvlsi_ORIENT_R0
		rfvlsi_newOriginY=offsetY+originY
      Case rfvlsi_ORIENT_R90
		rfvlsi_newOriginY=offsetY+originX
      Case rfvlsi_ORIENT_R180
		rfvlsi_newOriginY=offsetY-originY
      Case rfvlsi_ORIENT_R270
		rfvlsi_newOriginY=offsetY-originX
      Case rfvlsi_ORIENT_MX
		rfvlsi_newOriginY=offsetY-originY
      Case rfvlsi_ORIENT_MXR90
		rfvlsi_newOriginY=offsetY+originX
      Case rfvlsi_ORIENT_MY
		rfvlsi_newOriginY=offsetY+originY
	  Case Else
		rfvlsi_newOriginY=offsetY-originX
   End Select
End Function
Function MetalHeight(iLayer)
	Select Case iLayer
            Case -2	'PO
                MetalHeight=0.32
            Case 0	'METAL1
                MetalHeight=0.59
            Case 1	'METAL2
                MetalHeight=0.945
            Case 2	'METAL3
                MetalHeight=1.34
            Case 3	'METAL4
                MetalHeight=1.735
            Case 4	'METAL5
                MetalHeight=2.13
            Case 5	'METAL6
                MetalHeight=2.525
            Case 6	'METAL7
                MetalHeight=2.92
            Case 7	'METAL8
                MetalHeight=3.735
            Case 8	'METAL9
                MetalHeight=5.375
            Case 9	'METAL10
                MetalHeight=9.575
	End Select
End Function

Function ViaHeight(iLayer)
	Select Case iLayer
            Case -1	'CO
                ViaHeight=0.42
            Case 0	'Via1
                ViaHeight=0.77
            Case 1	'Via2
                ViaHeight=1.165
            Case 2	'Via3
                ViaHeight=1.56
            Case 3	'Via4
                ViaHeight=1.955
            Case 4	'Via5
                ViaHeight=2.35
            Case 5	'Via6
                ViaHeight=2.745
            Case 6	'Via7
                ViaHeight=3.14
            Case 7	'Via8
                ViaHeight=4.635
            Case 8	'Via9
                ViaHeight=8.775
	End Select
End Function

Function MetalThickness(iLayer)
	Select Case iLayer
            Case -2	'PO
                MetalThickness=0.1
            Case 0	'METAL1
                MetalThickness=0.18
            Case 1	'METAL2
                MetalThickness=0.22
            Case 2	'METAL3
                MetalThickness=0.22
            Case 3	'METAL4
                MetalThickness=0.22
            Case 4	'METAL5
                MetalThickness=0.22
            Case 5	'METAL6
                MetalThickness=0.22
            Case 6	'METAL7
                MetalThickness=0.22
            Case 7	'METAL8
                MetalThickness=0.9
            Case 8	'METAL9
                MetalThickness=3.4
            Case 9	'METAL10
                MetalThickness=1.45
	End Select
End Function

Function ViaThickness(iLayer)
	Select Case iLayer
            Case -1	'CO
                ViaThickness=0.17
            Case 0	'Via1
                ViaThickness=0.175
            Case 1	'Via2
                ViaThickness=0.175
            Case 2	'Via3
                ViaThickness=0.175
            Case 3	'Via4
                ViaThickness=0.175
            Case 4	'Via5
                ViaThickness=0.175
            Case 5	'Via6
                ViaThickness=0.175
            Case 6	'Via7
                ViaThickness=0.595
            Case 7	'Via8
                ViaThickness=0.74
            Case 8	'Via9
                ViaThickness=0.8
	End Select
End Function

Function MetalMaterial(iLayer)
	Select Case iLayer
            Case -2	'PO
                MetalMaterial="PO"
            Case 0	'METAL1
                MetalMaterial="METAL1"
            Case 1	'METAL2
                MetalMaterial="METAL2"
            Case 2	'METAL3
                MetalMaterial="METAL3"
            Case 3	'METAL4
                MetalMaterial="METAL4"
            Case 4	'METAL5
                MetalMaterial="METAL5"
            Case 5	'METAL6
                MetalMaterial="METAL6"
            Case 6	'METAL7
                MetalMaterial="METAL7"
            Case 7	'METAL8
                MetalMaterial="METAL8"
            Case 8	'METAL9
                MetalMaterial="METAL9"
            Case 9	'METAL10
                MetalMaterial="METAL10"
	End Select
End Function

Function ViaMaterial(iLayer)
	Select Case iLayer
            Case -1	'CO
                ViaMaterial="CO"
            Case 0	'Via1
                ViaMaterial="Via1"
            Case 1	'Via2
                ViaMaterial="Via2"
            Case 2	'Via3
                ViaMaterial="Via3"
            Case 3	'Via4
                ViaMaterial="Via4"
            Case 4	'Via5
                ViaMaterial="Via5"
            Case 5	'Via6
                ViaMaterial="Via6"
            Case 6	'Via7
                ViaMaterial="Via7"
            Case 7	'Via8
                ViaMaterial="Via8"
            Case 8	'Via9
                ViaMaterial="Via9"
	End Select
End Function

Function MetalName(iLayer)
	Select Case iLayer
            Case -2	'PO
                MetalName="PO"
            Case 0	'METAL1
                MetalName="METAL1"
            Case 1	'METAL2
                MetalName="METAL2"
            Case 2	'METAL3
                MetalName="METAL3"
            Case 3	'METAL4
                MetalName="METAL4"
            Case 4	'METAL5
                MetalName="METAL5"
            Case 5	'METAL6
                MetalName="METAL6"
            Case 6	'METAL7
                MetalName="METAL7"
            Case 7	'METAL8
                MetalName="METAL8"
            Case 8	'METAL9
                MetalName="METAL9"
            Case 9	'METAL10
                MetalName="METAL10"
	End Select
End Function

Function ViaName(iLayer)
	Select Case iLayer
            Case -1	'CO
                ViaName="CO"
            Case 0	'Via1
                ViaName="Via1"
            Case 1	'Via2
                ViaName="Via2"
            Case 2	'Via3
                ViaName="Via3"
            Case 3	'Via4
                ViaName="Via4"
            Case 4	'Via5
                ViaName="Via5"
            Case 5	'Via6
                ViaName="Via6"
            Case 6	'Via7
                ViaName="Via7"
            Case 7	'Via8
                ViaName="Via8"
            Case 8	'Via9
                ViaName="Via9"
	End Select
End Function

Sub MetalCountPlusOne(iLayer)
	Select Case iLayer
            Case -2	'PO
                rfvlsi_totoal_PO_ModelerObjects=rfvlsi_totoal_PO_ModelerObjects+1
            Case 0	'METAL1
                rfvlsi_totoal_METAL1_ModelerObjects=rfvlsi_totoal_METAL1_ModelerObjects+1
            Case 1	'METAL2
                rfvlsi_totoal_METAL2_ModelerObjects=rfvlsi_totoal_METAL2_ModelerObjects+1
            Case 2	'METAL3
                rfvlsi_totoal_METAL3_ModelerObjects=rfvlsi_totoal_METAL3_ModelerObjects+1
            Case 3	'METAL4
                rfvlsi_totoal_METAL4_ModelerObjects=rfvlsi_totoal_METAL4_ModelerObjects+1
            Case 4	'METAL5
                rfvlsi_totoal_METAL5_ModelerObjects=rfvlsi_totoal_METAL5_ModelerObjects+1
            Case 5	'METAL6
                rfvlsi_totoal_METAL6_ModelerObjects=rfvlsi_totoal_METAL6_ModelerObjects+1
            Case 6	'METAL7
                rfvlsi_totoal_METAL7_ModelerObjects=rfvlsi_totoal_METAL7_ModelerObjects+1
            Case 7	'METAL8
                rfvlsi_totoal_METAL8_ModelerObjects=rfvlsi_totoal_METAL8_ModelerObjects+1
            Case 8	'METAL9
                rfvlsi_totoal_METAL9_ModelerObjects=rfvlsi_totoal_METAL9_ModelerObjects+1
            Case 9	'METAL10
                rfvlsi_totoal_METAL10_ModelerObjects=rfvlsi_totoal_METAL10_ModelerObjects+1
	End Select
End Sub

Sub ViaCountPlusOne(iLayer)
	Select Case iLayer
            Case -1	'CO
                rfvlsi_totoal_CO_ModelerObjects=rfvlsi_totoal_CO_ModelerObjects+1
            Case 0	'Via1
                rfvlsi_totoal_Via1_ModelerObjects=rfvlsi_totoal_Via1_ModelerObjects+1
            Case 1	'Via2
                rfvlsi_totoal_Via2_ModelerObjects=rfvlsi_totoal_Via2_ModelerObjects+1
            Case 2	'Via3
                rfvlsi_totoal_Via3_ModelerObjects=rfvlsi_totoal_Via3_ModelerObjects+1
            Case 3	'Via4
                rfvlsi_totoal_Via4_ModelerObjects=rfvlsi_totoal_Via4_ModelerObjects+1
            Case 4	'Via5
                rfvlsi_totoal_Via5_ModelerObjects=rfvlsi_totoal_Via5_ModelerObjects+1
            Case 5	'Via6
                rfvlsi_totoal_Via6_ModelerObjects=rfvlsi_totoal_Via6_ModelerObjects+1
            Case 6	'Via7
                rfvlsi_totoal_Via7_ModelerObjects=rfvlsi_totoal_Via7_ModelerObjects+1
            Case 7	'Via8
                rfvlsi_totoal_Via8_ModelerObjects=rfvlsi_totoal_Via8_ModelerObjects+1
            Case 8	'Via9
                rfvlsi_totoal_Via9_ModelerObjects=rfvlsi_totoal_Via9_ModelerObjects+1
	End Select
End Sub'This part is translated through skill-to-EM translator from *.il
rfvlsi_maskgrid=0.005

Function ViaWidthVec(iLayer)
	Select Case iLayer
		Case -1	'CO
			ViaWidthVec=0.09
		Case 0	'VIA1
			ViaWidthVec=0.1
		Case 1	'VIA2
			ViaWidthVec=0.1
		Case 2	'VIA3
			ViaWidthVec=0.1
		Case 3	'VIA4
			ViaWidthVec=0.1
		Case 4	'VIA5
			ViaWidthVec=0.1
		Case 5	'VIA6
			ViaWidthVec=0.1
		Case 6	'VIA7
			ViaWidthVec=0.36
		Case 7 	'VIA8
			ViaWidthVec=0.36
		Case Else	'RV
			ViaWidthVec=3.0
	End Select
End Function

Function ViaSpacingVec(iLayer)
	Select Case iLayer
		Case -1	'CO
			ViaSpacingVec=0.14
		Case 0	'VIA1
			ViaSpacingVec=0.13
		Case 1	'VIA2
			ViaSpacingVec=0.13
		Case 2	'VIA3
			ViaSpacingVec=0.13
		Case 3	'VIA4
			ViaSpacingVec=0.13
		Case 4	'VIA5
			ViaSpacingVec=0.13
		Case 5	'VIA6
			ViaSpacingVec=0.13
		Case 6	'VIA7
			ViaSpacingVec=0.54
		Case 7 	'VIA8
			ViaSpacingVec=0.54
		Case Else	'RV
			ViaSpacingVec=3.0
	End Select
End Function

Function ViaEncVec(iLayer)
	Select Case iLayer
		Case -1	'CO
			ViaEncVec=0.04
		Case 0	'VIA1
			ViaEncVec=0.04
		Case 1	'VIA2
			ViaEncVec=0.04
		Case 2	'VIA3
			ViaEncVec=0.04
		Case 3	'VIA4
			ViaEncVec=0.04
		Case 4	'VIA5
			ViaEncVec=0.04
		Case 5	'VIA6
			ViaEncVec=0.04
		Case 6	'VIA7
			ViaEncVec=0.08
		Case 7 	'VIA8
			ViaEncVec=0.3
		Case Else	'RV
			ViaEncVec=1.5
	End Select
End Function

Function MetalSingularEdgeFillVec(m)
	Select Case m
		Case 0, 1, 2, 3, 4, 5, 6
			returnVal = 0.5
		Case 7
			returnVal = 0.5
		Case 8
			returnVal = 2.0
		Case true
			returnVal = 3.0
	End Select
	MetalSingularEdgeFillVec = returnVal
End Function

Function drc_entry(m)
	Select Case m
		Case "co_diff"
			returnVal = 0.155
		Case "PO_S_4"
			returnVal = 0.05
		Case "co_diff_nch"
			returnVal = 0.115
		Case "co_diff_nch_25"
			returnVal = 0.135
		Case true
			returnVal = 0.2
	End Select
	drc_entry = returnVal
End Function

Function CoDiff(m)
	Select Case m
		Case "nch"
			returnVal = 0.115
		Case "pch"
			returnVal = 0.115
		Case "nch_lvt"
			returnVal = 0.115
		Case "nch_hvt"
			returnVal = 0.115
		Case "nch_25"
			returnVal = 0.135
		Case "pch_25"
			returnVal = 0.31
		Case "pch_lvt"
			returnVal = 0.2
		Case true
			returnVal = 0.2
	End Select
	CoDiff = returnVal
End Function

Function DiffWidth(m)
	Select Case m
		Case "nch"
			returnVal = 0.2
		Case "pch"
			returnVal = 0.2
		Case "nch_lvt"
			returnVal = 0.2
		Case "nch_hvt"
			returnVal = 0.2
		Case "nch_25"
			returnVal = 0.31
		Case "pch_25"
			returnVal = 0.31
		Case "pch_lvt"
			returnVal = 0.2
		Case true
			returnVal = 0.2
	End Select
	DiffWidth = returnVal
End Function


Function ImpbPP(m)
	Select Case m
		Case "nch"
			returnVal = true
		Case "pch"
			returnVal = false
		Case "nch_lvt"
			returnVal = true
		Case "nch_hvt"
			returnVal = true
		Case "nch_25"
			returnVal = true
		Case "pch_25"
			returnVal = false
		Case "pch_lvt"
			returnVal = false
		Case true
			returnVal = true
	End Select
	ImpbPP = returnVal
End Function

Function MOSYSpacing(m)
	Select Case m
		Case "nch"
			returnVal = 0.68
		Case "pch"
			returnVal = 0.68
		Case "nch_lvt"
			returnVal = 0.68
		Case "nch_hvt"
			returnVal = 0.68
		Case "nch_25"
			returnVal = 0.31
		Case "pch_lvt"
			returnVal = 0.68
		Case true
			returnVal = 0.2
	End Select
	MOSYSpacing = returnVal
End Function

Function OriginOffset(m)
	Select Case m
		Case "nch"
			returnVal = 0.1
		Case "pch"
			returnVal = 0.1
		Case "nch_lvt"
			returnVal = 0.1
		Case "nch_hvt"
			returnVal = 0.1
		Case "nch_25"
			returnVal = 0.155
		Case "pch_lvt"
			returnVal = 0.1
		Case true
			returnVal = 0.1
	End Select
	OriginOffset = returnVal
End Function

Function MinMetWidth(m)
	Select Case m
		Case 0
			returnVal = 0.09
		Case 1, 2, 3, 4, 5, 6, 7
			returnVal = 0.1
		Case 8, 9
			returnVal = 2.0
		Case true
			returnVal = 3.0
	End Select
	MinMetWidth = returnVal
End Function

Function ViaSpacingVec(m)
	Select Case m
		Case (-1)
			returnVal = 0.14
		Case 0, 1, 2, 3, 4, 5
			returnVal = 0.13
		Case 6, 7
			returnVal = 0.54
		Case true
			returnVal = 3.0
	End Select
	ViaSpacingVec = returnVal
End Function

Function MetSpacingVec(m)
	Select Case m
		Case 1
			returnVal = 0.09
		Case 2, 3, 4, 5, 6, 7
			returnVal = 0.1
		Case 8, 9
			returnVal = 0.54
		Case true
			returnVal = 3.0
	End Select
	MetSpacingVec = returnVal
End Function

Function ViaOneRowSpacingVec(m)
	Select Case m
		Case (-1)
			returnVal = 0.11
		Case 0, 1, 2, 3, 4, 5
			returnVal = 0.1
		Case 6, 7
			returnVal = 0.34
		Case true
			returnVal = 3.0
	End Select
	ViaOneRowSpacingVec = returnVal
End Function

Function ViaEncVec(m)
	Select Case m
		Case (-1), 0, 1, 2, 3, 4, 5
			returnVal = 0.04
		Case 6
			returnVal = 0.08
		Case 7
			returnVal = 0.3
		Case true
			returnVal = 1.5
	End Select
	ViaEncVec = returnVal
End Function

Function ViaMinEncWidthVec(m, bIsLast)

	If (bIsLast) Then
		Select Case m
			Case 0
				returnVal = 0.1
			Case 1, 2, 3, 4, 5, 6
				returnVal = 0.1
			Case 7
				returnVal = 0.4
			Case 8
				returnVal = 2.0
			Case true
				returnVal = 4.5
		End Select
	Else
		Select Case m
			Case 0
				returnVal = 0.1
			Case 1, 2, 3, 4, 5
				returnVal = 0.1
			Case 6, 7
				returnVal = 0.4
			Case 7
				returnVal = 0.4
			Case true
				returnVal = 4.5
		End Select
	End If

	ViaMinEncWidthVec = returnVal
End Function

Function ViaDiagonalEncVec(m)
	Select Case m
		Case 0, 1, 2, 3, 4, 5
			returnVal = 0.06
		Case 6
			returnVal = 0.115
		Case 7
			returnVal = 0.45
		Case true
			returnVal = 2.12
	End Select
	ViaDiagonalEncVec = returnVal
End Function
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "vias"
Sub rfvlsiHFSS_Create_vias(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal Length , ByVal Width , ByVal TOP_ME , ByVal BTM_ME , ByVal bPP , ByVal conservative , ByVal x_cut , ByVal y_cut )
	PP_ext = 0.02
	NP_ext = 0.13
	NW_ENC = 0.16
	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		((TOP_ME)-(1)), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		Width, Length, 1, 1, 1.0, 1.0	
		

	'( rectOutline = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.

	If ((BTM_ME)<(1)) Then
		If (bPP) Then
			' Not using MetalVec/ViaVec, thus ignored in translation
		Else
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		End If

	End If


	For m = (((BTM_ME)-(1))) to (((TOP_ME)-(2)))
		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(m), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
			(Width)-(0), (Length)-(0), 1, 1, 1.0, 1.0	
			

		enc_prime = ViaEncVec(m)

		If (conservative) Then
			enc_prime = max(ViaEncVec(m), (ViaSpacingVec(m))/(2))
		End If

		Pitch = (ViaWidthVec(m))+(ViaSpacingVec(m))
		num_Horz_Vias = floor(((((Width)-((2)*(enc_prime)))+(ViaSpacingVec(m))))/(Pitch))

		If (x_cut) Then
			num_Horz_Vias = floor((((Width)+(ViaSpacingVec(m))))/(Pitch))
		End If

		num_Horz_Vias = max(num_Horz_Vias, 1)
		num_Vert_Vias = floor(((((Length)-((2)*(enc_prime)))+(ViaSpacingVec(m))))/(Pitch))

		If (y_cut) Then
			num_Vert_Vias = floor((((Length)+(ViaSpacingVec(m))))/(Pitch))
		End If

		num_Vert_Vias = max(num_Vert_Vias, 1)
		len_Horz_Edge = roundtogrid(((((Width)-((num_Horz_Vias)*(ViaWidthVec(m))))-((((num_Horz_Vias)-(1)))*(ViaSpacingVec(m)))))/(2))
		len_Vert_Edge = roundtogrid(((((Length)-((num_Vert_Vias)*(ViaWidthVec(m))))-((((num_Vert_Vias)-(1)))*(ViaSpacingVec(m)))))/(2))

		If (((rfvlsi_em_export)=(0))) Then
			If (((num_Vert_Vias)>(0))AND ((num_Horz_Vias)>(0))) Then
				CViaRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ 
					(m), _ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Horz_Edge, len_Vert_Edge, rfvlsi_ORIENT_R0), _ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Horz_Edge, len_Vert_Edge, rfvlsi_ORIENT_R0), _ 
					ViaWidthVec(m), ViaWidthVec(m), num_Horz_Vias, num_Vert_Vias, ViaSpacingVec(m), ViaSpacingVec(m)
					

				'( rectHorz = )part is not translated, due to CViaRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _  returns a VOID in HFSS.
			End If

		Else
			CViaRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ 
				(m), _ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
				Width, Length, 1, 1, ViaSpacingVec(m), ViaSpacingVec(m)
				

			'( rectHorz = )part is not translated, due to CViaRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _  returns a VOID in HFSS.
		End If

	Next

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "vias_diagonal"
strViewName = "layout"
Sub rfvlsiHFSS_Create_vias_diagonal(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal Length , ByVal Width , ByVal TOP_ME , ByVal BTM_ME )
	For m = (BTM_ME) to (TOP_ME)
		CMetalPolygon ((m)-(1)), _
			rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
			Array(_
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Width , 0 , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Width)+(Length)) , Length , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , Length , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0)), _
			Array(_
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Width , 0 , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Width)+(Length)) , Length , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , Length , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0)) 

		'( rectOutline = )part is not translated, due to CMetalPolygon ((m)-(1)), _ returns a VOID in HFSS.
	Next


	For m = (((BTM_ME)-(1))) to (((TOP_ME)-(2)))
		Pitch = (ViaWidthVec(m))+(ViaSpacingVec(m))
		num_Vert_Vias = floor(((((Length)-((2)*(ViaEncVec(m))))+(ViaSpacingVec(m))))/(Pitch))
		len_Vert_Edge = roundtogrid(((((Length)-((num_Vert_Vias)*(ViaWidthVec(m))))-((((num_Vert_Vias)-(1)))*(ViaSpacingVec(m)))))/(2))
		num_Horz_Vias = floor((((((Width)-((2)*(ViaDiagonalEncVec(m))))+(ViaSpacingVec(m)))-(ViaWidthVec(m))))/(Pitch))
		len_Horz_delta = roundtogrid(((((((Width)-((num_Horz_Vias)*(ViaWidthVec(m))))-((((num_Horz_Vias)-(1)))*(ViaSpacingVec(m))))-((2)*(ViaDiagonalEncVec(m))))-(ViaWidthVec(m))))/(2))
		len_Horz_Edge = (((len_Horz_delta)+(len_Vert_Edge))+(ViaWidthVec(m)))+(ViaDiagonalEncVec(m))

		If (((num_Horz_Vias)<=(0))) Then
			num_Horz_Vias = 1
		End If


		If (((num_Vert_Vias)<=(0))) Then
			num_Vert_Vias = 1
		End If


		If (((rfvlsi_em_export)=(0))) Then
			For n = (0) to (((num_Vert_Vias)-(1)))
				CViaRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ 
					(m), _ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((len_Horz_Edge)+((n)*(Pitch))), ((len_Vert_Edge)+((n)*(Pitch))), rfvlsi_ORIENT_R0), _ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((len_Horz_Edge)+((n)*(Pitch))), ((len_Vert_Edge)+((n)*(Pitch))), rfvlsi_ORIENT_R0), _ 
					ViaWidthVec(m), ViaWidthVec(m), num_Horz_Vias, 1, ViaSpacingVec(m), ViaSpacingVec(m)
					

				'( rectVert = )part is not translated, due to CViaRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _  returns a VOID in HFSS.
			Next

		Else
			CViaPolygon (m), _
				rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
				Array(_
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Horz_Edge , len_Vert_Edge , rfvlsi_ORIENT_R0),_ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((len_Horz_Edge)+((((num_Horz_Vias)-(1)))*(Pitch))) , len_Vert_Edge , rfvlsi_ORIENT_R0),_ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((len_Horz_Edge)+((((num_Horz_Vias)-(1)))*(Pitch)))+(Length))-((2)*(len_Vert_Edge))) , ((Length)-(len_Vert_Edge)) , rfvlsi_ORIENT_R0),_ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((len_Horz_Edge)+(Length))-((2)*(len_Vert_Edge))) , ((Length)-(len_Vert_Edge)) , rfvlsi_ORIENT_R0),_ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Horz_Edge , len_Vert_Edge , rfvlsi_ORIENT_R0)), _
				Array(_
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Horz_Edge , len_Vert_Edge , rfvlsi_ORIENT_R0),_ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((len_Horz_Edge)+((((num_Horz_Vias)-(1)))*(Pitch))) , len_Vert_Edge , rfvlsi_ORIENT_R0),_ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((len_Horz_Edge)+((((num_Horz_Vias)-(1)))*(Pitch)))+(Length))-((2)*(len_Vert_Edge))) , ((Length)-(len_Vert_Edge)) , rfvlsi_ORIENT_R0),_ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((len_Horz_Edge)+(Length))-((2)*(len_Vert_Edge))) , ((Length)-(len_Vert_Edge)) , rfvlsi_ORIENT_R0),_ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Horz_Edge , len_Vert_Edge , rfvlsi_ORIENT_R0)) 

		End If

	Next

	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "vias_dmexcl"
Sub rfvlsiHFSS_Create_vias_dmexcl(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal BTM_ME , ByVal TOP_ME , ByVal AP_ME , ByVal Width , ByVal Length , ByVal DMEXCL , ByVal POBLK , ByVal ODBLK )
	declare(rect((((TOP_ME)-(BTM_ME))+(1))))

	For i = (BTM_ME) to (TOP_ME)
		rect(((i)-(BTM_ME)))
		' Not using MetalVec/ViaVec, thus ignored in translation
	Next


	If (POBLK) Then
		' Not using MetalVec/ViaVec, thus ignored in translation
	End If


	If (ODBLK) Then
		' Not using MetalVec/ViaVec, thus ignored in translation
	End If

	' No output for: ret=rodAssignHandleToParameter(?parameter"Width"?rodObjrect(0)?displayName"Width"?displayExpression"Width"?handleNamelist("upperLeft","centerLeft","lowerLeft","upperRight","centerRight","lowerRight")?stretchType"relative"?moveOrigint?stretchDir"x"?userDatalist(1maskGrid)?userFunction"param_CB"), but is internally processed.
	' No output for: ret=rodAssignHandleToParameter(?parameter"Length"?rodObjrect(0)?displayName"Length"?displayExpression"Length"?handleNamelist("upperLeft","centerLeft","lowerLeft","upperRight","upperCenter","lowerCenter")?stretchType"relative"?moveOrigint?stretchDir"y"?userDatalist(1maskGrid)?userFunction"param_CB"), but is internally processed.

	If (AP_ME) Then
		' Not using MetalVec/ViaVec, thus ignored in translation
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "mesh_rect"
Sub rfvlsiHFSS_Create_mesh_rect(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal Length , ByVal Width , ByVal TOP_ME , ByVal BTM_ME , ByVal len_Void , ByVal len_Fill , ByVal bPP , ByVal bEMExportSimplification )
	If ((BTM_ME)<(1)) Then
		If (bPP) Then
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		Else
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		End If

	End If

	Pitch = (len_Void)+(len_Fill)
	num_Horz_Holes = floor((((Width)-(len_Fill)))/(Pitch))
	num_Vert_Holes = floor((((Length)-(len_Fill)))/(Pitch))

	If ((bEMExportSimplification)AND (((rfvlsi_em_export)<>(0)))) Then
		num_Horz_Holes = 0
		num_Vert_Holes = 0
	End If

	len_Horz_Edge = roundtogrid(((((Width)-((num_Horz_Holes)*(len_Void)))-((((num_Horz_Holes)-(1)))*(len_Fill))))/(2))
	len_Vert_Edge = roundtogrid(((((Length)-((num_Vert_Holes)*(len_Void)))-((((num_Vert_Holes)-(1)))*(len_Fill))))/(2))
	delta_Horz = (len_Horz_Edge)-(len_Fill)
	delta_Vert = (len_Vert_Edge)-(len_Fill)

	If (((num_Horz_Holes)<(1))) Then
		len_Horz_Edge = Width
	End If


	If (((num_Vert_Holes)<(1))) Then
		len_Vert_Edge = Length
	End If

	' No output for: master=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		(((TOP_ME)-(1))), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		len_Horz_Edge, Length, 1, 1, 1.0, 1.0	
		

	'( rectHorz1 = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.

	If (((num_Vert_Holes)>(0))) Then
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, len_Vert_Edge, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, len_Vert_Edge, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((Length)-((2)*(len_Vert_Edge))), len_Horz_Edge, TOP_ME, BTM_ME, bPP, True, False, False
	End If


	If (((num_Horz_Holes)>(0))) Then
		If ((((num_Horz_Holes)>(1)))AND (((num_Vert_Holes)>(0)))) Then
			For iXCreateBox=0 To (((num_Horz_Holes)-(1))-1) 
			    For iYCreateBox=0 To (1-1)

			        rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((delta_Horz)+(Pitch))+iXCreateBox*(Pitch), len_Vert_Edge+iYCreateBox*(Pitch), rfvlsi_ORIENT_R0), _
			                rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((delta_Horz)+(Pitch))+iXCreateBox*(Pitch), len_Vert_Edge+iYCreateBox*(Pitch), rfvlsi_ORIENT_R0), _	
			                rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			                ((Length)-((2)*(len_Vert_Edge))), len_Fill, TOP_ME, BTM_ME, bPP, True, False, False
			    Next
			Next
		End If

		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(((TOP_ME)-(1))), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Width)-(len_Horz_Edge)), 0, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Width)-(len_Horz_Edge)), 0, rfvlsi_ORIENT_R0), _ 
			len_Horz_Edge, Length, 1, 1, 1.0, 1.0	
			

		'( rectHorzN = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	End If

	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		len_Vert_Edge, Width, TOP_ME, BTM_ME, bPP, True, False, False
	'( inst = )part is not translated, due to rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	' No output for: rectVert1=rodGetObj(inst), but is internally processed.

	If ((((((num_Vert_Holes)-(1)))>=(1)))AND (((num_Horz_Holes)>=(1)))) Then
		For iXCreateBox=0 To (num_Horz_Holes-1) 
		    For iYCreateBox=0 To (((num_Vert_Holes)-(1))-1)

		        rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((delta_Horz)+(len_Fill))+iXCreateBox*(Pitch), ((len_Vert_Edge)+(len_Void))+iYCreateBox*(Pitch), rfvlsi_ORIENT_R0), _
		                rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((delta_Horz)+(len_Fill))+iXCreateBox*(Pitch), ((len_Vert_Edge)+(len_Void))+iYCreateBox*(Pitch), rfvlsi_ORIENT_R0), _	
		                rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		                len_Fill, len_Void, TOP_ME, BTM_ME, bPP, True, False, False
		    Next
		Next
	End If

	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		((TOP_ME)-(1)), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _ 
		Width, len_Vert_Edge, 1, 1, 1.0, 1.0	
		

	'( rectVertN = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.

	If ((num_Vert_Holes)>(0)) Then
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((Width)-(len_Horz_Edge)), len_Vert_Edge, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((Width)-(len_Horz_Edge)), len_Vert_Edge, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((Length)-((2)*(len_Vert_Edge))), len_Horz_Edge, TOP_ME, BTM_ME, bPP, True, False, False
		'( inst2 = )part is not translated, due to rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((Width)-(len_Horz_Edge)), len_Vert_Edge, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
		' No output for: rodinst2=rodGetObj(inst2), but is internally processed.
		' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	End If

	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		len_Vert_Edge, Width, TOP_ME, BTM_ME, bPP, True, False, False
	'( inst3 = )part is not translated, due to rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	' No output for: rodinst3=rodGetObj(inst3), but is internally processed.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "mesh_rect_asym"
Sub rfvlsiHFSS_Create_mesh_rect_asym(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal Length , ByVal Width , ByVal TOP_ME , ByVal BTM_ME , ByVal len_VoidL , ByVal len_VoidW , ByVal len_FillL , ByVal len_FillW , ByVal bPP , ByVal bEMExportSimplification )
	If ((BTM_ME)<(1)) Then
		If (bPP) Then
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		Else
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		End If

	End If

	' No output for: master=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	PitchY = (len_VoidL)+(len_FillL)
	PitchX = (len_VoidW)+(len_FillW)
	num_Vert_Holes = floor((((Length)-(len_FillL)))/(PitchY))
	num_Horz_Holes = floor((((Width)-(len_FillW)))/(PitchX))

	If (((((bEMExportSimplification)=(True)))AND (((rfvlsi_em_export)<>(0))))) Then
		num_Horz_Holes = 0
		num_Vert_Holes = 0
	End If

	len_Vert_Edge = ((((Length)-((num_Vert_Holes)*(len_VoidL)))-((((num_Vert_Holes)-(1)))*(len_FillL))))/(2)
	len_Horz_Edge = ((((Width)-((num_Horz_Holes)*(len_VoidW)))-((((num_Horz_Holes)-(1)))*(len_FillW))))/(2)
	delta_Vert = (len_Vert_Edge)-(len_FillL)
	delta_Horz = (len_Horz_Edge)-(len_FillW)

	If (((num_Vert_Holes)<(1))) Then
		len_Vert_Edge = Length
	End If


	If (((num_Horz_Holes)<(1))) Then
		len_Horz_Edge = Width
	End If

	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		(((TOP_ME)-(1))), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		len_Horz_Edge, Length, 1, 1, 1.0, 1.0	
		

	'( rectHorz1 = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.

	If (((num_Vert_Holes)>(0))) Then
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, len_Vert_Edge, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, len_Vert_Edge, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((Length)-((2)*(len_Vert_Edge))), len_Horz_Edge, TOP_ME, BTM_ME, bPP, True, False, False
	End If


	If (((num_Horz_Holes)>(0))) Then
		If ((((num_Horz_Holes)>(1)))AND (((num_Vert_Holes)>(0)))) Then
			For iXCreateBox=0 To (((num_Horz_Holes)-(1))-1) 
			    For iYCreateBox=0 To (1-1)

			        rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((delta_Horz)+(PitchX))+iXCreateBox*(PitchX), len_Vert_Edge+iYCreateBox*(PitchY), rfvlsi_ORIENT_R0), _
			                rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((delta_Horz)+(PitchX))+iXCreateBox*(PitchX), len_Vert_Edge+iYCreateBox*(PitchY), rfvlsi_ORIENT_R0), _	
			                rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			                ((Length)-((2)*(len_Vert_Edge))), len_FillW, TOP_ME, BTM_ME, bPP, True, False, False
			    Next
			Next
		End If

		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(((TOP_ME)-(1))), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Width)-(len_Horz_Edge)), 0, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Width)-(len_Horz_Edge)), 0, rfvlsi_ORIENT_R0), _ 
			len_Horz_Edge, Length, 1, 1, 1.0, 1.0	
			

		'( rectHorzN = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	End If

	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		(((TOP_ME)-(1))), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		Width, len_Vert_Edge, 1, 1, 1.0, 1.0	
		

	'( rectVert1 = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		len_Vert_Edge, Width, TOP_ME, BTM_ME, bPP, True, False, False

	For m = (((BTM_ME)-(1))) to (((TOP_ME)-(1)))
		If ((((num_Vert_Holes)>(0)))AND (((((num_Vert_Holes)-(1)))>(0)))) Then
			For iXCreateBox=0 To (num_Horz_Holes-1) 
			    For iYCreateBox=0 To (((num_Vert_Holes)-(1))-1)

			        rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((delta_Horz)+(len_FillW))+iXCreateBox*(PitchX), ((len_Vert_Edge)+(len_FillL))+iYCreateBox*(PitchY), rfvlsi_ORIENT_R0), _
			                rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((delta_Horz)+(len_FillW))+iXCreateBox*(PitchX), ((len_Vert_Edge)+(len_FillL))+iYCreateBox*(PitchY), rfvlsi_ORIENT_R0), _	
			                rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			                len_FillL, len_VoidW, TOP_ME, BTM_ME, bPP, True, False, False
			    Next
			Next
		End If

		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(m), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _ 
			Width, len_Vert_Edge, 1, 1, 1.0, 1.0	
			

		'( rectVertN = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	Next


	If (((num_Vert_Holes)>(0))) Then
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((Width)-(len_Horz_Edge)), len_Vert_Edge, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((Width)-(len_Horz_Edge)), len_Vert_Edge, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((Length)-((2)*(len_Vert_Edge))), len_Horz_Edge, TOP_ME, BTM_ME, bPP, True, False, False
	End If

	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		len_Vert_Edge, Width, TOP_ME, BTM_ME, bPP, True, False, False
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "mesh_diagonal"
Sub rfvlsiHFSS_Create_mesh_diagonal(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal Length , ByVal Width , ByVal TOP_ME , ByVal BTM_ME , ByVal len_VoidL , ByVal len_FillL , ByVal len_VoidW , ByVal len_FillW , ByVal bPP , ByVal bEMExportSimplification )
	If ((BTM_ME)<(1)) Then
		If (bPP) Then
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		Else
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		End If

	End If

	PitchL = (len_VoidL)+(len_FillL)
	PitchW = (len_VoidW)+(len_FillW)
	num_Horz_Holes = floor((((Width)-(len_FillW)))/(PitchW))
	num_Vert_Holes = floor((((Length)-(len_FillL)))/(PitchL))
	len_Horz_Edge = ((((Width)-((num_Horz_Holes)*(len_VoidW)))-((((num_Horz_Holes)-(1)))*(len_FillW))))/(2)
	len_Vert_Edge = ((((Length)-((num_Vert_Holes)*(len_VoidL)))-((((num_Vert_Holes)-(1)))*(len_FillL))))/(2)
	delta_Horz = (len_Horz_Edge)-(len_FillW)
	delta_Vert = (len_Vert_Edge)-(len_FillL)

	If (((((bEMExportSimplification)=(True)))AND (((rfvlsi_em_export)<>(0))))) Then
		num_Horz_Holes = 0
		num_Vert_Holes = 0
	End If


	If (((num_Horz_Holes)<(1))) Then
		len_Horz_Edge = Width
	End If


	If (((num_Vert_Holes)<(1))) Then
		len_Vert_Edge = Length
	End If

	' No output for: master=dbOpenCellViewByType(pcCellView~>lib"vias_diagonal""layout"), but is internally processed.

	If (((num_Vert_Holes)>(0))) Then
		rfvlsiHFSS_Create_vias_diagonal rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, len_Vert_Edge, len_Vert_Edge, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, len_Vert_Edge, len_Vert_Edge, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((Length)-((2)*(len_Vert_Edge))), len_Horz_Edge, TOP_ME, BTM_ME
	End If


	If (((num_Horz_Holes)>(0))) Then
		If ((((num_Horz_Holes)>(1)))AND (((num_Vert_Holes)>(0)))) Then
			For n = (1) to (((num_Horz_Holes)-(1)))
				rfvlsiHFSS_Create_vias_diagonal rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((len_Vert_Edge)+(delta_Horz))+((PitchW)*(n))), len_Vert_Edge, rfvlsi_ORIENT_R0), _
					rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((len_Vert_Edge)+(delta_Horz))+((PitchW)*(n))), len_Vert_Edge, rfvlsi_ORIENT_R0), _	
					rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
					((Length)-((2)*(len_Vert_Edge))), len_FillW, TOP_ME, BTM_ME
			Next

		End If

	End If

	rfvlsiHFSS_Create_vias_diagonal rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		len_Vert_Edge, Width, TOP_ME, BTM_ME

	For m = (((BTM_ME)-(1))) to (((TOP_ME)-(1)))
		If (((num_Vert_Holes)>(0))) Then
			If (((num_Vert_Holes)>(1))) Then
				For n = (1) to (((num_Vert_Holes)-(1)))
					CMetalPolygon (m), _
						rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
						Array(_
							rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((len_Vert_Edge)-(len_FillL))+((n)*(PitchL))) , (((len_Vert_Edge)-(len_FillL))+((n)*(PitchL))) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((len_Vert_Edge)-(len_FillL))+(Width))+((n)*(PitchL))) , (((len_Vert_Edge)-(len_FillL))+((n)*(PitchL))) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((len_Vert_Edge)+(Width))+((n)*(PitchL))) , ((len_Vert_Edge)+((n)*(PitchL))) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((len_Vert_Edge)+((n)*(PitchL))) , ((len_Vert_Edge)+((n)*(PitchL))) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((len_Vert_Edge)-(len_FillL))+((n)*(PitchL))) , (((len_Vert_Edge)-(len_FillL))+((n)*(PitchL))) , rfvlsi_ORIENT_R0)), _
						Array(_
							rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((len_Vert_Edge)-(len_FillL))+((n)*(PitchL))) , (((len_Vert_Edge)-(len_FillL))+((n)*(PitchL))) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((len_Vert_Edge)-(len_FillL))+(Width))+((n)*(PitchL))) , (((len_Vert_Edge)-(len_FillL))+((n)*(PitchL))) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((len_Vert_Edge)+(Width))+((n)*(PitchL))) , ((len_Vert_Edge)+((n)*(PitchL))) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((len_Vert_Edge)+((n)*(PitchL))) , ((len_Vert_Edge)+((n)*(PitchL))) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((len_Vert_Edge)-(len_FillL))+((n)*(PitchL))) , (((len_Vert_Edge)-(len_FillL))+((n)*(PitchL))) , rfvlsi_ORIENT_R0)) 

					'( rectVert = )part is not translated, due to CMetalPolygon (m), _ returns a VOID in HFSS.
				Next


				For n = (0) to (((num_Vert_Holes)-(1)))
					For k = (0) to (((num_Horz_Holes)-(1)))
						CMetalPolygon (m), _
							rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
							Array(_
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k))) , ((len_Vert_Edge)+((PitchL)*(n))) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((((len_Vert_Edge)+(len_Horz_Edge))+(MetalSingularEdgeFillVec(m)))+((PitchL)*(n)))+((PitchW)*(k))) , ((len_Vert_Edge)+((PitchL)*(n))) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((((len_Vert_Edge)+(len_Horz_Edge))+(MetalSingularEdgeFillVec(m)))+((PitchL)*(n)))+((PitchW)*(k))) , (((len_Vert_Edge)+(MetalSingularEdgeFillVec(m)))+((PitchL)*(n))) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k))) , ((len_Vert_Edge)+((PitchL)*(n))) , rfvlsi_ORIENT_R0)), _
							Array(_
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k))) , ((len_Vert_Edge)+((PitchL)*(n))) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((((len_Vert_Edge)+(len_Horz_Edge))+(MetalSingularEdgeFillVec(m)))+((PitchL)*(n)))+((PitchW)*(k))) , ((len_Vert_Edge)+((PitchL)*(n))) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((((len_Vert_Edge)+(len_Horz_Edge))+(MetalSingularEdgeFillVec(m)))+((PitchL)*(n)))+((PitchW)*(k))) , (((len_Vert_Edge)+(MetalSingularEdgeFillVec(m)))+((PitchL)*(n))) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k))) , ((len_Vert_Edge)+((PitchL)*(n))) , rfvlsi_ORIENT_R0)) 

						CMetalPolygon (m), _
							rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
							Array(_
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k)))+(len_VoidL))+(len_VoidW)) , (((len_Vert_Edge)+((PitchL)*(n)))+(len_VoidL)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k)))+(len_VoidL))+(len_VoidW))-(MetalSingularEdgeFillVec(m))) , (((len_Vert_Edge)+((PitchL)*(n)))+(len_VoidL)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k)))+(len_VoidL))+(len_VoidW))-(MetalSingularEdgeFillVec(m))) , ((((len_Vert_Edge)+((PitchL)*(n)))+(len_VoidL))-(MetalSingularEdgeFillVec(m))) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k)))+(len_VoidL))+(len_VoidW)) , (((len_Vert_Edge)+((PitchL)*(n)))+(len_VoidL)) , rfvlsi_ORIENT_R0)), _
							Array(_
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k)))+(len_VoidL))+(len_VoidW)) , (((len_Vert_Edge)+((PitchL)*(n)))+(len_VoidL)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k)))+(len_VoidL))+(len_VoidW))-(MetalSingularEdgeFillVec(m))) , (((len_Vert_Edge)+((PitchL)*(n)))+(len_VoidL)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k)))+(len_VoidL))+(len_VoidW))-(MetalSingularEdgeFillVec(m))) , ((((len_Vert_Edge)+((PitchL)*(n)))+(len_VoidL))-(MetalSingularEdgeFillVec(m))) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((((len_Vert_Edge)+(len_Horz_Edge))+((PitchL)*(n)))+((PitchW)*(k)))+(len_VoidL))+(len_VoidW)) , (((len_Vert_Edge)+((PitchL)*(n)))+(len_VoidL)) , rfvlsi_ORIENT_R0)) 

					Next

				Next

			End If

		End If

	Next


	If (((num_Vert_Holes)>(0))) Then
		rfvlsiHFSS_Create_vias_diagonal rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((len_Vert_Edge)+(Width))-(len_Horz_Edge)), len_Vert_Edge, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((len_Vert_Edge)+(Width))-(len_Horz_Edge)), len_Vert_Edge, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((Length)-((2)*(len_Vert_Edge))), len_Horz_Edge, TOP_ME, BTM_ME
	End If

	rfvlsiHFSS_Create_vias_diagonal rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((Length)-(len_Vert_Edge)), ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((Length)-(len_Vert_Edge)), ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		len_Vert_Edge, Width, TOP_ME, BTM_ME
	CMetalPolygon (((TOP_ME)-(1))), _
		rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
		Array(_
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Width , 0 , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Width)+(len_Vert_Edge)) , len_Vert_Edge , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Vert_Edge , len_Vert_Edge , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0)), _
		Array(_
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Width , 0 , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Width)+(len_Vert_Edge)) , len_Vert_Edge , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Vert_Edge , len_Vert_Edge , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0)) 

	'( rodP1 = )part is not translated, due to CMetalPolygon (((TOP_ME)-(1))), _ returns a VOID in HFSS.
	CMetalPolygon (((TOP_ME)-(1))), _
		rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
		Array(_
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Vert_Edge)) , ((Length)-(len_Vert_Edge)) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((Length)-(len_Vert_Edge))+(Width)) , ((Length)-(len_Vert_Edge)) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)+(Width)) , Length , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , Length , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Vert_Edge)) , ((Length)-(len_Vert_Edge)) , rfvlsi_ORIENT_R0)), _
		Array(_
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Vert_Edge)) , ((Length)-(len_Vert_Edge)) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((Length)-(len_Vert_Edge))+(Width)) , ((Length)-(len_Vert_Edge)) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)+(Width)) , Length , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , Length , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Vert_Edge)) , ((Length)-(len_Vert_Edge)) , rfvlsi_ORIENT_R0)) 

	'( rodP2 = )part is not translated, due to CMetalPolygon (((TOP_ME)-(1))), _ returns a VOID in HFSS.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct"
Sub rfvlsiHFSS_Create_base_oct(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal LOP , ByVal ROP , ByVal MET , ByVal dummy )
	' No output for: m_base_oct_quad=dbOpenCellViewByType(pcCellView~>lib"base_oct_half""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_oct_half rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, LOP, ROP, MET, dummy
	rfvlsiHFSS_Create_base_oct_half rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		OD, W, LOP, ROP, MET, dummy
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct_half"
Sub rfvlsiHFSS_Create_base_oct_half(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal LOP , ByVal ROP , ByVal MET , ByVal dummy )
	' No output for: m_base_oct_quad=dbOpenCellViewByType(pcCellView~>lib"base_oct_quad""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_oct_quad rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(OD)))/(2)), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(OD)))/(2)), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, LOP, MET
	rfvlsiHFSS_Create_base_oct_quad rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)/(2)), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)/(2)), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		OD, W, ROP, MET
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct_half_fill"
Sub rfvlsiHFSS_Create_base_oct_half_fill(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal LOP , ByVal ROP , ByVal MET , ByVal layer , ByVal purp )
	' No output for: m_base_oct_quad_fill=dbOpenCellViewByType(pcCellView~>lib"base_oct_quad_fill""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_oct_quad_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(OD)))/(2)), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(OD)))/(2)), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, ROP, MET, layer, purp
	rfvlsiHFSS_Create_base_oct_quad_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)/(2)), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)/(2)), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		OD, W, LOP, MET, layer, purp
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct_quad"
Sub rfvlsiHFSS_Create_base_oct_quad(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal OP , ByVal MET )
	pi = 3.141592
	C = ceiltogrid(((W)*(tan((pi)/(8))))+(0.005))
	DIV = (2)+(sqrt(2))
	A = roundtogrid((OD)/(DIV))
	B = (OD)-((2)*(A))
	BA = floortogrid(((B)/(2))-(0.005))
	BB = (B)-(BA)

	If ((OP)>(BA)) Then
		CMetalPolygon ((MET)-(1)), _
			rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
			Array(_
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (W)+(BA) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)/(2) , ((W)/(2))+(BA) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)/(2) , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (A)+(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, A , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (W)+(BA) , rfvlsi_ORIENT_R0)), _
			Array(_
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (W)+(BA) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)/(2) , ((W)/(2))+(BA) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)/(2) , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (A)+(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, A , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (W)+(BA) , rfvlsi_ORIENT_R0)) 

	Else
		CMetalPolygon ((MET)-(1)), _
			rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
			Array(_
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , OP , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , OP , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (A)+(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, A , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0)), _
			Array(_
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , OP , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , OP , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (A)+(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, A , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0)) 

	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct_quad_fill"
Sub rfvlsiHFSS_Create_base_oct_quad_fill(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal OP , ByVal MET , ByVal layer , ByVal purp )
	pi = 3.141592
	C = ceiltogrid(((W)*(tan((pi)/(8))))+(0.005))
	DIV = (2)+(sqrt(2))
	A = roundtogrid((OD)/(DIV))
	B = (OD)-((2)*(A))
	BA = floortogrid(((B)/(2))-(0.005))
	BB = (B)-(BA)
	' Not using MetalVec/ViaVec, thus ignored in translation
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_xfm_cross"
strLibName = "N65_FK_XFM"
Sub rfvlsiHFSS_Create_base_xfm_cross(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal WI , ByVal WO , ByVal S , ByVal TOP_ME , ByVal BTM_ME , ByVal dummy , ByVal viat , ByVal viad , ByVal top , ByVal layer , ByVal purpose )
	pi = 3.141592
	C = ceiltogrid(((WO)*(tan((pi)/(8))))+(0.005))
	C2 = ceiltogrid((C)/(sqrt(2)))
	OOCH = (((WO)+(S))+((WI)/(2)))-(C2)

	If ((((2)*(S))+(WI))<=((2.0)*(sqrt(2.0)))) Then
		OOCHD = ceiltogrid(((2.01)*(sqrt(2.0)))-(WI))
	Else
		OOCHD = 0.0
	End If

	' No output for: masterxdiag=dbOpenCellViewByType("N65_FK_XFM""base_ind_diag""layout"), but is internally processed.

	If (top) Then
		rfvlsiHFSS_Create_base_ind_diag rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			WO, ((2)*(S))+(WI), TOP_ME
	Else
		rfvlsiHFSS_Create_base_ind_diag rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			WO, ((2)*(S))+(WI), BTM_ME
	End If

	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OOCH)))-(OOCHD), rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OOCH)))-(OOCHD), rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		WO, WO, TOP_ME, BTM_ME, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((WI)+(WO))+((2)*(S)), (OOCH)+(OOCHD), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((WI)+(WO))+((2)*(S)), (OOCH)+(OOCHD), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		WO, WO, TOP_ME, BTM_ME, True, True, False, False
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_ind_diag"
Sub rfvlsiHFSS_Create_base_ind_diag(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal W , ByVal S , ByVal MET )
	pi = 3.141592
	P = (S)+(W)
	C = ceiltogrid(((W)*(tan((pi)/(8))))+(0.005))
	C2 = ceiltogrid((C)/(sqrt(2)))
	OO = ((2)*(W))+(S)
	OOC = (((2)*(W))+(S))-((2)*(C2))
	OOCH = (OOC)/(2)

	If ((S)<=((2.0)*(sqrt(2)))) Then
		CMetalPolygon ((MET)-(1)), _
			rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
			Array(_
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , ((-(OOCH)))+(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (-(((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)+(P) , ((-(OOCH)))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OO , ((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OO)-(W) , ((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, P , (((-(OOCH)))+(C))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , ((-(OOCH)))+(C) , rfvlsi_ORIENT_R0)), _
			Array(_
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , ((-(OOCH)))+(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (-(((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)+(P) , ((-(OOCH)))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OO , ((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OO)-(W) , ((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, P , (((-(OOCH)))+(C))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , ((-(OOCH)))+(C) , rfvlsi_ORIENT_R0)) 

	Else
		CMetalPolygon ((MET)-(1)), _
			rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
			Array(_
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (OOCH)-(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)+(P) , ((-(OOCH)))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OO , OOCH , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, P , OOCH , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (OOCH)-(P) , rfvlsi_ORIENT_R0)), _
			Array(_
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (OOCH)-(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)+(P) , ((-(OOCH)))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OO , OOCH , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, P , OOCH , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (OOCH)-(P) , rfvlsi_ORIENT_R0)) 

	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "X"
Sub rfvlsiHFSS_Create_X(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal Height , ByVal LineWidth , ByVal TOP_ME , ByVal BTM_ME )
	pi = 3.141592
	C = ceiltogrid(((LineWidth)*(tan((3.141592)/(8))))+(0.01))
	C2 = ceiltogrid((C)/(sqrt(2)))
	' No output for: masterc=dbOpenCellViewByType(pcCellView~>lib"base_xfm_cross""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_xfm_cross rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((((-(Height)))/(2))+(LineWidth))-(C2)), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((((-(Height)))/(2))+(LineWidth))-(C2)), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		((Height)-((3)*(LineWidth)))-(C), LineWidth, 0.0, TOP_ME, BTM_ME, True, True, True, True, "RFVLSI", "drawing"
	rfvlsiHFSS_Create_base_xfm_cross rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((Height)/(2))-(LineWidth))+(C2)), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((Height)/(2))-(LineWidth))+(C2)), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		((Height)-((3)*(LineWidth)))-(C), LineWidth, 0.0, TOP_ME, BTM_ME, True, True, True, False, "RFVLSI", "drawing"
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_lead"
Sub rfvlsiHFSS_Create_base_lead(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal L , ByVal W , ByVal WD , ByVal PINTXT , ByVal TOP_ME , ByVal BTM_ME , ByVal dummy )
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		W, L, atoi(TOP_ME), atoi(BTM_ME), True, True, False, False

	If (dummy) Then
		' Not using MetalVec/ViaVec, thus ignored in translation

		For m = (((atoi(BTM_ME))-(1))) to (((atoi(TOP_ME))-(1)))
			' Not using MetalVec/ViaVec, thus ignored in translation
		Next

		' Not using MetalVec/ViaVec, thus ignored in translation
		' dbCreateLabel is skipped in translation output, and not processed at all.
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_lead_pair"
Sub rfvlsiHFSS_Create_base_lead_pair(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal W , ByVal OPENING , ByVal LEAD , ByVal TOP_ME , ByVal LEAD_ME , ByVal dummy , ByVal P1TXT , ByVal N1TXT )
	' No output for: m_lead=dbOpenCellViewByType(pcCellView~>lib"base_lead""layout"), but is internally processed.
	' No output for: m_vias=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	TM = atoi(TOP_ME)
	LM = atoi(LEAD_ME)
	rfvlsiHFSS_Create_base_lead rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, OPENING, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, OPENING, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		LEAD, W, 1.0, P1TXT, LEAD_ME, LEAD_ME, dummy
	rfvlsiHFSS_Create_base_lead rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OPENING)))-(W), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OPENING)))-(W), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		LEAD, W, 1.0, N1TXT, LEAD_ME, LEAD_ME, dummy

	If ((TM)<>(LM)) Then
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, OPENING, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, OPENING, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			W, W, TM, LM, True, True, False, False
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OPENING)))-(W), rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OPENING)))-(W), rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			W, W, TM, LM, True, True, False, False
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_under"
strViewName = "layout"
Sub rfvlsiHFSS_Create_base_under(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal L , ByVal W , ByVal TOP_ME , ByVal BTM_ME , ByVal dummy )
	' No output for: masterVIAS=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		W, W, TOP_ME, BTM_ME, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (L)-(W), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (L)-(W), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		W, W, TOP_ME, BTM_ME, True, True, False, False
	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		((BTM_ME)-(1)), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		((L)-(W))-(0), (W)-(0), 1, 1, 1.0, 1.0	
		

	' Not using MetalVec/ViaVec, thus ignored in translation
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct_fill"
Sub rfvlsiHFSS_Create_base_oct_fill(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal LOP , ByVal ROP , ByVal MET , ByVal layer , ByVal purp )
	' No output for: m_base_oct_fill=dbOpenCellViewByType(pcCellView~>lib"base_oct_half_fill""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_oct_half_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, 0.0, 0.0, MET, layer, purp
	rfvlsiHFSS_Create_base_oct_half_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		OD, W, 0.0, 0.0, MET, layer, purp
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_pri_chu"
Sub rfvlsiHFSS_Create_base_pri_chu(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal WI , ByVal WO , ByVal M8_S , ByVal S , ByVal B_TK , ByVal LEADDYI , ByVal LEADDYO , ByVal A_TK , ByVal ROP , ByVal LOP , ByVal en_NTN , ByVal en_HighK , ByVal en_1to1 , ByVal text )
	PI = (WI)+(S)
	PO = (WO)+(S)
	' No output for: master=dbOpenCellViewByType(pcCellView~>lib"base_oct""layout"), but is internally processed.
	' No output for: masterc=dbOpenCellViewByType(pcCellView~>lib"X""layout"), but is internally processed.

	If (en_1to1) Then
		LOPP = 0
		ROPP = ROP
		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, WO, ((-(WO)))/(2), rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, WO, ((-(WO)))/(2), rfvlsi_ORIENT_R0), _ 
			((PI)+(PO))-(WO), ((WO)/(2))-(((-(WO)))/(2)), 1, 1, 1.0, 1.0	
			

		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(7), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-(((PI)+(PO))), ROP, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-(((PI)+(PO))), ROP, rfvlsi_ORIENT_R0), _ 
			((OD)-(WO))-((OD)-(((PI)+(PO)))), ((ROP)+(WO))-(ROP), 1, 1, 1.0, 1.0	
			

		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(7), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-(((PI)+(PO))), (-(ROP)), rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-(((PI)+(PO))), (-(ROP)), rfvlsi_ORIENT_R0), _ 
			((OD)-(WO))-((OD)-(((PI)+(PO)))), ((-(((ROP)+(WO)))))-((-(ROP))), 1, 1, 1.0, 1.0	
			

	Else
		LOPP = 0.6
		ROPP = 0
		rfvlsiHFSS_Create_X rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((WI)/(2))+(WO))+(S), 0, rfvlsi_ORIENT_R90), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((WI)/(2))+(WO))+(S), 0, rfvlsi_ORIENT_R90), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R90),_
			((WI)+((2)*(WO)))+((2)*(S)), WO, 9, 8
		rfvlsiHFSS_Create_base_oct rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)/(2), 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)/(2), 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			OD, WO, ((WI)/(2))+(S), ROP, 9, False
		rfvlsiHFSS_Create_base_oct rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((WO)+(WI))+(S))+(S))+((((OD)-((2)*(((PI)+(PO))))))/(2)), 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((WO)+(WI))+(S))+(S))+((((OD)-((2)*(((PI)+(PO))))))/(2)), 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			(OD)-((2)*(((PI)+(PO)))), WO, ((WI)/(2))+(S), ROPP, 9, False
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_cpwtline_halfs"
Sub rfvlsiHFSS_Create_base_cpwtline_halfs(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal L , ByVal Signal , ByVal Wall , ByVal SG_Gap , ByVal SS_Gap , ByVal PLANE_TOP_ME , ByVal TOP_ME , ByVal BTM_ME , ByVal bEMExportSimplification , ByVal bBuildWalls )
	If ((SS_Gap)=(0)) Then
		Signal = ((Signal)/(2))
	End If

	' No output for: M_vias=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	' No output for: mdmexcl=dbOpenCellViewByType(pcCellView~>lib"base_admexcl""layout"), but is internally processed.
	Total_W = (((SG_Gap)+(Signal))+(Wall))+((SS_Gap)/(2))
	rfvlsiHFSS_Create_base_admexcl rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		atoi(PLANE_TOP_ME), atoi(TOP_ME), True, Total_W, L, "DMEXCL", False, False
	'( inst0 = )part is not translated, due to rfvlsiHFSS_Create_base_admexcl rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	rfvlsiHFSS_Create_base_admexcl rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		atoi(PLANE_TOP_ME), atoi(TOP_ME), True, Total_W, L, "VIAEXCL", False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (SS_Gap)/(2), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (SS_Gap)/(2), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		L, Signal, atoi(TOP_ME), atoi(BTM_ME), True, True, False, False
	' No output for: rodi0=rodGetObj(inst0), but is internally processed.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.

	If (bBuildWalls) Then
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((SS_Gap)/(2))+(Signal))+(SG_Gap), 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((SS_Gap)/(2))+(Signal))+(SG_Gap), 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			L, Wall, atoi(TOP_ME), atoi(PLANE_TOP_ME), True, True, False, False
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_admexcl"
Sub rfvlsiHFSS_Create_base_admexcl(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal BTM_ME , ByVal TOP_ME , ByVal AP_ME , ByVal Width , ByVal Length , ByVal DMEXCL , ByVal POBLK , ByVal ODBLK )
	For i = ((BTM_ME)+(1)) to (TOP_ME)
		' Not using MetalVec/ViaVec, thus ignored in translation
	Next


	If (POBLK) Then
		' Not using MetalVec/ViaVec, thus ignored in translation
	End If


	If (ODBLK) Then
		' Not using MetalVec/ViaVec, thus ignored in translation
	End If

	' No output for: rect=rodCreateRect(?layerlist(DMEXCL,strcat("dummy",sprintf(nil"%d",BTM_ME)))?lengthLength?widthWidth?origin0:0?cvIdpcCellView), but is internally processed.
	' No output for: ret=rodAssignHandleToParameter(?parameter"Width"?rodObjrect?displayName"Width"?displayExpression"Width"?handleNamelist("upperLeft","centerLeft","lowerLeft","upperRight","centerRight","lowerRight")?stretchType"relative"?moveOrigint?stretchDir"x"?userFunction"std_CB"), but is internally processed.
	' No output for: ret=rodAssignHandleToParameter(?parameter"Length"?rodObjrect?displayName"Length"?displayExpression"Length"?handleNamelist("upperLeft","centerLeft","lowerLeft","upperRight","upperCenter","lowerCenter")?stretchType"relative"?moveOrigint?stretchDir"y"?userFunction"std_CB"), but is internally processed.

	If (AP_ME) Then
		' Not using MetalVec/ViaVec, thus ignored in translation
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "cpw_diff"
Sub rfvlsiHFSS_Create_cpw_diff(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal L , ByVal Signal , ByVal Wall , ByVal SG_Gap , ByVal SS_Gap , ByVal PLANE_BTM_ME , ByVal PLANE_TOP_ME , ByVal TOP_ME , ByVal BTM_ME , ByVal DUMMYL , ByVal DUMMYLP , ByVal PINP , ByVal len_VoidX , ByVal len_VoidY , ByVal len_FillX , ByVal len_FillY , ByVal bEMExportSimplification , ByVal bBuildWalls )
	' No output for: master=dbOpenCellViewByType(pcCellView~>lib"base_cpwtline_halfs""layout"), but is internally processed.
	' No output for: param=list(list("L""float"L)list("Signal""float"Signal)list("Wall""float"Wall)list("SG_Gap""float"SG_Gap)list("SS_Gap""float"SS_Gap)list("PLANE_TOP_ME""string"PLANE_TOP_ME)list("TOP_ME""string"TOP_ME)list("BTM_ME""string"BTM_ME)list("bEMExportSimplification""boolean"bEMExportSimplification)list("bBuildWalls""boolean"bBuildWalls)), but is internally processed.
	rfvlsiHFSS_Create_base_cpwtline_halfs rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		L, Signal, Wall, SG_Gap, SS_Gap, PLANE_TOP_ME, TOP_ME, BTM_ME, bEMExportSimplification, bBuildWalls
	'( inst0 = )part is not translated, due to rfvlsiHFSS_Create_base_cpwtline_halfs rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	rfvlsiHFSS_Create_base_cpwtline_halfs rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		L, Signal, Wall, SG_Gap, SS_Gap, PLANE_TOP_ME, TOP_ME, BTM_ME, bEMExportSimplification, bBuildWalls
	' No output for: rodi0=rodGetObj(inst0), but is internally processed.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	dmy_h = 0.5
	dmyedge = (dmy_h)/(2)
	Total_W = (((2)*(((Wall)+(Signal))))+((2)*(SG_Gap)))+(SS_Gap)
	' No output for: dmyl=list(DUMMYL,DUMMYLP), but is internally processed.
	' No output for: dmypl=list(DUMMYL,PINP), but is internally processed.
	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.

	For m = (((atoi(BTM_ME))-(1))) to (((atoi(TOP_ME))-(1)))
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
	Next

	rfvlsiHFSS_Create_mesh_rect_asym rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(Total_W)))/(2)), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(Total_W)))/(2)), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		L, Total_W, atoi(PLANE_TOP_ME), atoi(PLANE_BTM_ME), len_VoidY, len_VoidX, len_FillY, len_FillX, True, bEMExportSimplification
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_path_bend"
Sub rfvlsiHFSS_Create_base_path_bend(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal W , ByVal LineW , ByVal L1 , ByVal L2 , ByVal TOP_ME , ByVal BTM_ME , ByVal vias_cornr )
	' No output for: masterR90=dbOpenCellViewByType(pcCellView~>lib"vias_diagonal_R90""layout"), but is internally processed.
	' No output for: masterv=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.

	If ((TOP_ME)>=(BTM_ME)) Then
		start = BTM_ME
		end = TOP_ME
	Else
		start = TOP_ME
		end = BTM_ME
	End If

	rfvlsiCreateStackedPath('Waiving pcCellView, 'list('coord(x=(LineW)/(2),y=0), 'coord(x=(LineW)/(2),y=L1), 'coord(x=W,y=((L1)+(W))-((LineW)/(2))), 'coord(x=(W)+(L2),y=((W)+(L1))-((LineW)/(2)))), start, end, LineW, 1, 0.2)
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "mesh_tri"
Sub rfvlsiHFSS_Create_mesh_tri(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal Length , ByVal TOP_ME , ByVal BTM_ME , ByVal len_Void , ByVal len_Fill , ByVal bPP , ByVal bDoubleSided , ByVal bEMExportSimplification )
	PP_ext = 0.03
	NP_ext = 0.2
	NW_ENC = 0.24
	' No output for: master=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	Pitch = (len_Void)+(len_Fill)
	num_Holes = floor((((((Length)-(len_Fill))-(len_Void))-((1.4142)*(len_Fill))))/(Pitch))
	num_Horz_Holes = floor((((((Length)-(((2)*(1.4142))*(len_Fill)))-((2)*(len_Void)))+(len_Fill)))/(Pitch))
	len_Edge = (((((Length)-((num_Horz_Holes)*(len_Void)))-((((num_Horz_Holes)-(1)))*(len_Fill))))/(2))-(len_Fill)

	If ((((BTM_ME)<(1)))AND (((bDoubleSided)=(True)))) Then
		If (bPP) Then
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		Else
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		End If

	End If


	If ((((BTM_ME)<(1)))AND (((bDoubleSided)=(False)))) Then
		If (bPP) Then
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		Else
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		End If

	End If


	For n = (((BTM_ME)-(1))) to (((TOP_ME)-(1)))
		If (((((bEMExportSimplification)=(False)))OR (((rfvlsi_em_export)=(0))))) Then
			total_pitch = (num_Holes)*(Pitch)

			If (bDoubleSided) Then
				For m = (0) to (floor((num_Horz_Holes)/(2)))
					xm = (m)*(Pitch)
					xm_Void = (xm)-(len_Void)
					xm_Fill = (xm)+(len_Fill)
					CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
						(n), _ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((xm)+(len_Edge)), 0, rfvlsi_ORIENT_R0), _ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((xm)+(len_Edge)), 0, rfvlsi_ORIENT_R0), _ 
						(((xm)+(len_Fill))+(len_Edge))-((xm)+(len_Edge)), ((xm)+(len_Edge))-(0), 1, 1, 1.0, 1.0	
						

					CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
						(n), _ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((Length)-(xm))-(len_Edge))-(len_Fill)), 0, rfvlsi_ORIENT_R0), _ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((Length)-(xm))-(len_Edge))-(len_Fill)), 0, rfvlsi_ORIENT_R0), _ 
						(((Length)-(xm))-(len_Edge))-((((Length)-(xm))-(len_Edge))-(len_Fill)), ((xm)+(len_Edge))-(0), 1, 1, 1.0, 1.0	
						


					If (((m)<>(floor((num_Horz_Holes)/(2))))) Then
						CMetalPolygon (n), _
							rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
							Array(_
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm , xm , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((xm)+(Pitch))+(len_Edge)) , xm , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((xm)+(Pitch))+(len_Edge)) , (((xm)+(Pitch))+(len_Edge)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm , xm , rfvlsi_ORIENT_R0)), _
							Array(_
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm , xm , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((xm)+(Pitch))+(len_Edge)) , xm , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((xm)+(Pitch))+(len_Edge)) , (((xm)+(Pitch))+(len_Edge)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm , xm , rfvlsi_ORIENT_R0)) 

						CMetalPolygon (n), _
							rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
							Array(_
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(xm)) , xm , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((Length)-(xm))-(Pitch))-(len_Edge)) , xm , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((Length)-(xm))-(Pitch))-(len_Edge)) , (((xm)+(Pitch))+(len_Edge)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(xm)) , xm , rfvlsi_ORIENT_R0)), _
							Array(_
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(xm)) , xm , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((Length)-(xm))-(Pitch))-(len_Edge)) , xm , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((Length)-(xm))-(Pitch))-(len_Edge)) , (((xm)+(Pitch))+(len_Edge)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(xm)) , xm , rfvlsi_ORIENT_R0)) 

					End If

				Next

				CMetalPolygon (n), _
					rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
					Array(_
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , len_Fill , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , 0 , rfvlsi_ORIENT_R0)), _
					Array(_
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , len_Fill , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , 0 , rfvlsi_ORIENT_R0)) 

			Else
				For m = (0) to (num_Holes)
					xm = (m)*(Pitch)
					xm_Void = (xm)-(len_Void)
					xm_Fill = (xm)+(len_Fill)
					CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
						(n), _ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm, 0, rfvlsi_ORIENT_R0), _ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm, 0, rfvlsi_ORIENT_R0), _ 
						((xm)+(len_Fill))-(xm), (((Length)-(xm))-(len_Fill))-(0), 1, 1, 1.0, 1.0	
						

					CMetalPolygon (n), _
						rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
						Array(_
							rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm , (((total_pitch)+(len_Fill))-(xm)) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((Length)-(total_pitch))-(len_Fill))+(xm)) , (((total_pitch)+(len_Fill))-(xm)) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm , ((Length)-(xm)) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm , (((total_pitch)+(len_Fill))-(xm)) , rfvlsi_ORIENT_R0)), _
						Array(_
							rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm , (((total_pitch)+(len_Fill))-(xm)) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((Length)-(total_pitch))-(len_Fill))+(xm)) , (((total_pitch)+(len_Fill))-(xm)) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm , ((Length)-(xm)) , rfvlsi_ORIENT_R0),_ 
							rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, xm , (((total_pitch)+(len_Fill))-(xm)) , rfvlsi_ORIENT_R0)) 

				Next

				CMetalPolygon (n), _
					rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
					Array(_
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , len_Fill , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , 0 , rfvlsi_ORIENT_R0)), _
					Array(_
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , len_Fill , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(len_Fill)) , 0 , rfvlsi_ORIENT_R0)) 

			End If


			If (bDoubleSided) Then
				CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
					(n), _ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Fill, 0, rfvlsi_ORIENT_R0), _ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Fill, 0, rfvlsi_ORIENT_R0), _ 
					((Length)-((2)*(len_Fill))), len_Fill, 1, 1, 1.0, 1.0	
					

				'( rectVert1 = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
			Else
				CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
					(n), _ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
					len_Fill, ((Length)-(len_Fill)), 1, 1, 1.0, 1.0	
					

				'( rectHorz1 = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
				CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
					(n), _ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
					((Length)-(len_Fill)), len_Fill, 1, 1, 1.0, 1.0	
					

				'( rectVert1 = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
			End If


			If (bDoubleSided) Then
				()
			Else
				For m = (1) to (num_Holes)
					ym = (m)*(Pitch)
					CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
						(n), _ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, ym, rfvlsi_ORIENT_R0), _ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, ym, rfvlsi_ORIENT_R0), _ 
						(((Length)-(ym))-(len_Fill))-(0), ((ym)+(len_Fill))-(ym), 1, 1, 1.0, 1.0	
						

				Next

			End If


			If (bDoubleSided) Then
				()
			Else
				' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
				' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
			End If

			' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
			' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
		Else
			If (bDoubleSided) Then
				CMetalPolygon (n), _
					rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
					Array(_
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (Length)/(2) , (Length)/(2) , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0)), _
					Array(_
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (Length)/(2) , (Length)/(2) , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0)) 

			Else
				CMetalPolygon (n), _
					rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
					Array(_
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , Length , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0)), _
					Array(_
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Length , 0 , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , Length , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , 0 , rfvlsi_ORIENT_R0)) 

			End If

		End If

	Next


	If (((((bEMExportSimplification)=(False)))OR (((rfvlsi_em_export)=(0))))) Then
		If (bDoubleSided) Then
			For m = (1) to (floor((((num_Holes)-(1)))/(2)))
				xm = (m)*(Pitch)
				xm_Void = (xm)-(len_Void)
				xm_Fill = (xm)+(len_Fill)
				rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((xm)+(len_Fill)), xm, rfvlsi_ORIENT_R0), _
					rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((xm)+(len_Fill)), xm, rfvlsi_ORIENT_R0), _	
					rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
					len_Fill, (((Length)-((2)*(xm)))-((2)*(len_Fill))), TOP_ME, BTM_ME, bPP, True, False, False

				If (((m)=(floor((((num_Holes)-(1)))/(2))))) Then
					For n = (((BTM_ME)-(1))) to (((TOP_ME)-(1)))
						CMetalPolygon (n), _
							rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
							Array(_
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((xm)+(len_Fill)) , ((xm)+(len_Fill)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((Length)-(xm))-(len_Fill)) , ((xm)+(len_Fill)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)/(2)) , ((Length)/(2)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((xm)+(len_Fill)) , ((xm)+(len_Fill)) , rfvlsi_ORIENT_R0)), _
							Array(_
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((xm)+(len_Fill)) , ((xm)+(len_Fill)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((Length)-(xm))-(len_Fill)) , ((xm)+(len_Fill)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)/(2)) , ((Length)/(2)) , rfvlsi_ORIENT_R0),_ 
								rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((xm)+(len_Fill)) , ((xm)+(len_Fill)) , rfvlsi_ORIENT_R0)) 

					Next

				End If

			Next

		Else
			For m = (1) to (floor((((num_Holes)-(1)))/(2)))
				xm = (m)*(Pitch)
				xm_Void = (xm)-(len_Void)
				xm_Fill = (xm)+(len_Fill)
				rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, xm, ((xm)+(len_Fill)), rfvlsi_ORIENT_R0), _
					rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, xm, ((xm)+(len_Fill)), rfvlsi_ORIENT_R0), _	
					rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
					(((Length)-((2)*(xm)))-((2)*(len_Fill))), len_Fill, TOP_ME, BTM_ME, bPP, True, False, False
				rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((xm)+(len_Fill)), xm, rfvlsi_ORIENT_R0), _
					rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((xm)+(len_Fill)), xm, rfvlsi_ORIENT_R0), _	
					rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
					len_Fill, (((Length)-((2)*(xm)))-((2)*(len_Fill))), TOP_ME, BTM_ME, bPP, True, False, False
			Next

		End If

	Else
		For n = (((BTM_ME)-(1))) to (((TOP_ME)-(2)))
			If (bDoubleSided) Then
				CViaPolygon (n), _
					rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
					Array(_
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Pitch)+(len_Fill)) , Pitch , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((Length)-(Pitch))-(len_Fill)) , Pitch , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)/(2)) , (((Length)/(2))-(len_Fill)) , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Pitch)+(len_Fill)) , Pitch , rfvlsi_ORIENT_R0)), _
					Array(_
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Pitch)+(len_Fill)) , Pitch , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((Length)-(Pitch))-(len_Fill)) , Pitch , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)/(2)) , (((Length)/(2))-(len_Fill)) , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Pitch)+(len_Fill)) , Pitch , rfvlsi_ORIENT_R0)) 

			Else
				CViaPolygon (n), _
					rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
					Array(_
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Pitch , Pitch , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(Pitch)) , Pitch , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Pitch , ((Length)-(Pitch)) , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Pitch , Pitch , rfvlsi_ORIENT_R0)), _
					Array(_
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Pitch , Pitch , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Length)-(Pitch)) , Pitch , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Pitch , ((Length)-(Pitch)) , rfvlsi_ORIENT_R0),_ 
						rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, Pitch , Pitch , rfvlsi_ORIENT_R0)) 

			End If

		Next

	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "cpwtline45s"
Sub rfvlsiHFSS_Create_cpwtline45s(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal Signal_W , ByVal Wall , ByVal DIVI , ByVal DIVO , ByVal SG_Gap , ByVal SS_Gap , ByVal OFFSET , ByVal DUMMYL , ByVal DUMMYLP , ByVal PINP , ByVal SIGNAL_TOP_ME , ByVal SIGNAL_BTM_ME , ByVal PLANE_TOP_ME , ByVal PLANE_BTM_ME , ByVal len_VoidL , ByVal len_VoidW , ByVal len_FillL , ByVal len_FillW , ByVal bEMExportSimplification )
	OD_SWR = ((((OFFSET)+((2)*(Wall)))+((2)*(SG_Gap)))+((2)*(Signal_W)))+(SS_Gap)
	OD_SR = ((((OFFSET)+(Wall))+(SG_Gap))+((2)*(Signal_W)))+(SS_Gap)
	OD_SL = (((OFFSET)+(Wall))+(SG_Gap))+(Signal_W)
	OD_SWL = (OFFSET)+(Wall)
	' No output for: master=dbOpenCellViewByType(pcCellView~>lib"base_path_bend""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_path_bend rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((OFFSET)+((2)*(((Signal_W)+(Wall)))))+(SS_Gap))+((2)*(SG_Gap)), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((OFFSET)+((2)*(((Signal_W)+(Wall)))))+(SS_Gap))+((2)*(SG_Gap)), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		(OD_SWR)/(2), Wall, (OD_SWR)/(2), (OD_SWR)/(2), SIGNAL_TOP_ME, PLANE_BTM_ME, True
	rfvlsiHFSS_Create_base_path_bend rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((OFFSET)+((2)*(Wall)))+(Signal_W))+(SS_Gap))+(SG_Gap), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((OFFSET)+((2)*(Wall)))+(Signal_W))+(SS_Gap))+(SG_Gap), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		((OD_SWR)/(2))-(SG_Gap), Signal_W, ((OD_SWR)/(2))-(Signal_W), ((OD_SWR)/(2))-(Signal_W), SIGNAL_TOP_ME, SIGNAL_BTM_ME, True
	rfvlsiHFSS_Create_base_path_bend rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD_SL, 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD_SL, 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		(SG_Gap)+(Signal_W), Signal_W, (OFFSET)+(Wall), (OFFSET)+(Wall), SIGNAL_TOP_ME, SIGNAL_BTM_ME, True
	rfvlsiHFSS_Create_base_path_bend rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD_SWL, 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD_SWL, 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		Wall, Wall, OFFSET, OFFSET, SIGNAL_TOP_ME, PLANE_BTM_ME, False
	rfvlsiHFSS_Create_mesh_rect rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(OD_SWR)-(Signal_W), (OD_SWR)/(2), PLANE_TOP_ME, PLANE_BTM_ME, len_VoidL, len_FillL, True, bEMExportSimplification
	rfvlsiHFSS_Create_mesh_rect rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD_SWR)/(2), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD_SWR)/(2), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(OD_SWR)/(2), ((OD_SWR)/(2))-(Signal_W), PLANE_TOP_ME, PLANE_BTM_ME, len_VoidL, len_FillL, True, bEMExportSimplification
	rfvlsiHFSS_Create_mesh_tri rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD_SWR)/(2), (OD_SWR)/(2), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD_SWR)/(2), (OD_SWR)/(2), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		((OD_SWR)/(2))-(Signal_W), PLANE_TOP_ME, PLANE_BTM_ME, len_VoidL, len_FillL, True, False, bEMExportSimplification
	dmy_h = 0.5
	dmyedge = (0.5)/(2)
	Total_W = (((((2)*(Wall))+((2)*(SG_Gap)))+((2)*(Signal_W)))+(SS_Gap))
	' No output for: dmyl=list(DUMMYL,DUMMYLP), but is internally processed.
	' No output for: dmypl=list(DUMMYL,PINP), but is internally processed.
	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		(5), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		((OFFSET)+(Wall))-(0), ((OFFSET)+(Wall))-(0), 1, 1, 1.0, 1.0	
		

	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' Not using MetalVec/ViaVec, thus ignored in translation
	' dbCreateLabel is skipped in translation output, and not processed at all.
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "xfm_highk_rx_chu"
Sub rfvlsiHFSS_Create_xfm_highk_rx_chu(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal WI , ByVal WO , ByVal ROP , ByVal LEAD , ByVal LEADDYI , ByVal LEADDYO , ByVal S , ByVal en_NTN , ByVal balun_str , ByVal en_HighK , ByVal en_1to1 , ByVal en_dmy )
	PI = (WI)+(S)
	PO = (WO)+(S)
	M8_S = 3.0
	pi = 3.141592
	C = roundtogrid((WO)*(tan((pi)/(8))))
	C2 = roundtogrid((C)/(sqrt(2)))
	LOP = ((((WO)+((WI)/(2)))+(S))+(C2))+(M8_S)
	LOP_P = 9
	via_w = 5.0
	' No output for: masterp=dbOpenCellViewByType(pcCellView~>lib"base_pri_chu""layout"), but is internally processed.
	' No output for: masters=dbOpenCellViewByType(pcCellView~>lib"base_oct""layout"), but is internally processed.
	' No output for: masterL=dbOpenCellViewByType(pcCellView~>lib"base_lead""layout"), but is internally processed.
	' No output for: masterUD=dbOpenCellViewByType(pcCellView~>lib"base_under""layout"), but is internally processed.
	' No output for: m_lead_pair=dbOpenCellViewByType(pcCellView~>lib"base_lead_pair""layout"), but is internally processed.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' No output for: m_base_oct_half_fill=dbOpenCellViewByType(pcCellView~>lib"base_oct_fill""layout"), but is internally processed.

	If (en_dmy) Then
		rfvlsiHFSS_Create_base_oct_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)/(2), 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)/(2), 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			OD, 5.0, 0.0, 0.0, 9, "RFVLSI", "drawing"
		rfvlsiHFSS_Create_base_oct_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)/(2), 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)/(2), 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			OD, 5.0, 0.0, 0.0, 9, "RFVLSI_LVS", "dummy8"
		rfvlsiHFSS_Create_base_oct_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)/(2), 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)/(2), 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			OD, 5.0, 0.0, 0.0, 9, "RFVLSI_LVS", "dummy9"
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
	End If

	rfvlsiHFSS_Create_base_pri_chu rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, WI, WO, 3.0, S, 0.0, LEADDYI, LEADDYO, 0.0, ROP, LOP, en_NTN, en_HighK, en_1to1, balun_str
	rfvlsiHFSS_Create_base_oct rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (PO)+((((OD)-((2)*(PO))))/(2)), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (PO)+((((OD)-((2)*(PO))))/(2)), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(OD)-((2)*(PO)), WI, LOP_P, 0.0, 9, False
	rfvlsiHFSS_Create_base_under rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(S)))-(WI)), LOP_P, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(S)))-(WI)), LOP_P, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(((2)*(S))+(WO))+((2)*(WI)), WI, 9, 8, False
	rfvlsiHFSS_Create_base_under rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(S)))-(WI)), (-(LOP_P)), rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(S)))-(WI)), (-(LOP_P)), rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		(((2)*(S))+(WO))+((2)*(WI)), WI, 9, 8, False
	rfvlsiHFSS_Create_base_lead_pair rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (-(S)), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (-(S)), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		WI, LOP_P, LEAD, "9", "9", True, "P1", "N1"
	rfvlsiHFSS_Create_base_lead_pair rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		WO, ROP, LEAD, "9", "9", True, "P2", "N2"
	' No output for: masterVias=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	'Creating Dummy Structure for EM simulation.  This part will not be used in PCell, but only in EM Simulation
	If (rfvlsi_em_sim_piority<=1) Then
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), ((-(OD))), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), ((-(OD))), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(2)*(OD), 10.0, 1, 1, True, True, False, False
	End If

	'Creating Dummy Structure for EM simulation.  This part will not be used in PCell, but only in EM Simulation
	If (rfvlsi_em_sim_piority<=1) Then
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)+(LEAD)), ((-(OD))), rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)+(LEAD)), ((-(OD))), rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		(2)*(OD), 10.0, 1, 1, True, True, False, False
	End If

	'Creating Dummy Structure for EM simulation.  This part will not be used in PCell, but only in EM Simulation
	If (rfvlsi_em_sim_piority<=1) Then
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), ((OD)-(10.0)), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), ((OD)-(10.0)), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		10.0, (((OD)+((2)*(LEAD)))+(S)), 1, 1, True, True, False, False
	End If

	'Creating Dummy Structure for EM simulation.  This part will not be used in PCell, but only in EM Simulation
	If (rfvlsi_em_sim_piority<=1) Then
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), (((-(OD)))+(10.0)), rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), (((-(OD)))+(10.0)), rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		10.0, (((OD)+((2)*(LEAD)))+(S)), 1, 1, True, True, False, False
	End If

	'Adding a vertical lumped port.
	CVport "port1",((-(LEAD)))-(S),LOP_P,((-(LEAD)))-(S),(LOP_P)+(WI),((LOP_P)+(WI))-(LOP_P),"X",0,8,1
	'Adding a vertical lumped port.
	CVport "port2",((-(LEAD)))-(S),(-(LOP_P)),((-(LEAD)))-(S),((-(LOP_P)))-(WI),(((-(LOP_P)))-(WI))-((-(LOP_P))),"X",0,8,1
	'Adding a vertical lumped port.
	CVport "port3",(OD)+(LEAD),ROP,(OD)+(LEAD),(ROP)+(WO),((ROP)+(WO))-(ROP),"X",0,8,1
	'Adding a vertical lumped port.
	CVport "port4",(OD)+(LEAD),(-(ROP)),(OD)+(LEAD),((-(ROP)))-(WO),(((-(ROP)))-(WO))-((-(ROP))),"X",0,8,1
	'Create a radiation boundary
	CBoundary (((-(0.5)))*(OD))-(10.0),((-(OD)))-(10.0),(-(300.0)),((2)*(OD))+(20.0),((2)*(OD))+(20.0),600.0, 1

	rfvlsi_print_DIE=True
	CDielectric "Substrate", 11.9, 1, 10.0, (((-(0.5)))*(OD))-(5.0), ((-(OD)))-(5.0), -250000.0, ((2)*(OD))+(10.0), ((2)*(OD))+(10.0), 250000.0, 1
	CDielectric "FOX", 3.28174467495264, 1, 0.0, (((-(0.5)))*(OD))-(5.0), ((-(OD)))-(5.0), 0.0, ((2)*(OD))+(10.0), ((2)*(OD))+(10.0), 3140.0, 1
	CDielectric "IMD_7c", 4.491322366879034, 1, 0.0, (((-(0.5)))*(OD))-(5.0), ((-(OD)))-(5.0), 3140.0, ((2)*(OD))+(10.0), ((2)*(OD))+(10.0), 7435.0, 1
	oProject.Save



	If ((en_1to1)<>(True)) Then
		'Adding a vertical lumped port.
		CVport "port5",(OD)+(LEAD),((-(WI)))/(2),(OD)+(LEAD),(WI)/(2),((WI)/(2))-(((-(WI)))/(2)),"X",0,8,1
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "xfm_highk_rx_ct_chu"
Sub rfvlsiHFSS_Create_xfm_highk_rx_ct_chu(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal WI , ByVal WO , ByVal LOP , ByVal ROP , ByVal LEAD , ByVal LEADDYI , ByVal LEADDYO , ByVal S , ByVal en_dmy , ByVal en_NTN , ByVal balun_str , ByVal en_HighK , ByVal en_ct2 )
	rfvlsiHFSS_Create_xfm_highk_rx_chu rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, WI, WO, ROP, LEAD, LEADDYI, LEADDYO, S, en_NTN, balun_str, en_HighK, False, en_dmy
	' No output for: m_lead=dbOpenCellViewByType(pcCellView~>lib"base_lead""layout"), but is internally processed.
	' dbCreateLabel is skipped in translation output, and not processed at all.

	If (en_ct2) Then
		' No output for: masterVias=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)-((((WI)+(WO))+((2)*(S)))))-(WO), ((-(WO)))/(2), rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)-((((WI)+(WO))+((2)*(S)))))-(WO), ((-(WO)))/(2), rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			WO, WO, 9, 8, True, True, False, False
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)-(WO), ((-(WO)))/(2), rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)-(WO), ((-(WO)))/(2), rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			WO, WO, 9, 8, True, True, False, False
		rfvlsiHFSS_Create_base_lead rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)-(WO), ((-(WI)))/(2), rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)-(WO), ((-(WI)))/(2), rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			(LEAD)+(WO), WI, 1.0, "ct", "9", "9", True
		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(7), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-((((WI)+(WO))+((2)*(S)))), ((-(WO)))/(2), rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-((((WI)+(WO))+((2)*(S)))), ((-(WO)))/(2), rfvlsi_ORIENT_R0), _ 
			(OD)-((OD)-((((WI)+(WO))+((2)*(S))))), ((WO)/(2))-(((-(WO)))/(2)), 1, 1, 1.0, 1.0	
			

	Else
		rfvlsiHFSS_Create_base_lead rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)-(WO))-(S), ((-(WI)))/(2), rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)-(WO))-(S), ((-(WI)))/(2), rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((LEAD)+(WO))+(S), WI, 1.0, "ct", "9", "9", True
	End If

	' Not using MetalVec/ViaVec, thus ignored in translation
End Sub
'Generating topcell
rfvlsiHFSS_Create_cpwtline45s 0.0, 0.0, rfvlsi_ORIENT_R0, 2.0, 2.0, 2.5, 2.5, 2.0, 2.0, 0.8, "RFVLSI", "drawing", "dummy1", 9, 9, 6, 6, 1.5, 1.5, 0.5, 0.5, True 
' End Invoking topcell .... 
oProject.Save
'Merging metals & Vias
If (rfvlsi_totoal_PO_ModelerObjects>=2) Then' If there are more than two objects of PO , we merge them.
    A = oEditor.GetMatchedObjectName("PO*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_CO_ModelerObjects>=2) Then' If there are more than two objects of CO , we merge them.
    A = oEditor.GetMatchedObjectName("CO*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL1_ModelerObjects>=2) Then' If there are more than two objects of METAL1 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL1*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via1_ModelerObjects>=2) Then' If there are more than two objects of Via1 , we merge them.
    A = oEditor.GetMatchedObjectName("Via1*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL2_ModelerObjects>=2) Then' If there are more than two objects of METAL2 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL2*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via2_ModelerObjects>=2) Then' If there are more than two objects of Via2 , we merge them.
    A = oEditor.GetMatchedObjectName("Via2*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL3_ModelerObjects>=2) Then' If there are more than two objects of METAL3 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL3*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via3_ModelerObjects>=2) Then' If there are more than two objects of Via3 , we merge them.
    A = oEditor.GetMatchedObjectName("Via3*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL4_ModelerObjects>=2) Then' If there are more than two objects of METAL4 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL4*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via4_ModelerObjects>=2) Then' If there are more than two objects of Via4 , we merge them.
    A = oEditor.GetMatchedObjectName("Via4*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL5_ModelerObjects>=2) Then' If there are more than two objects of METAL5 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL5*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via5_ModelerObjects>=2) Then' If there are more than two objects of Via5 , we merge them.
    A = oEditor.GetMatchedObjectName("Via5*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL6_ModelerObjects>=2) Then' If there are more than two objects of METAL6 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL6*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via6_ModelerObjects>=2) Then' If there are more than two objects of Via6 , we merge them.
    A = oEditor.GetMatchedObjectName("Via6*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL7_ModelerObjects>=2) Then' If there are more than two objects of METAL7 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL7*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via7_ModelerObjects>=2) Then' If there are more than two objects of Via7 , we merge them.
    A = oEditor.GetMatchedObjectName("Via7*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL8_ModelerObjects>=2) Then' If there are more than two objects of METAL8 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL8*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via8_ModelerObjects>=2) Then' If there are more than two objects of Via8 , we merge them.
    A = oEditor.GetMatchedObjectName("Via8*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL9_ModelerObjects>=2) Then' If there are more than two objects of METAL9 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL9*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via9_ModelerObjects>=2) Then' If there are more than two objects of Via9 , we merge them.
    A = oEditor.GetMatchedObjectName("Via9*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL10_ModelerObjects>=2) Then' If there are more than two objects of METAL10 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL10*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

oProject.Save
If (rfvlsi_print_DIE) Then
    'Substract Vias/Metals from Deielectric
    If (rfvlsi_totoal_PO_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("PO*")
    End If    

    If (rfvlsi_totoal_CO_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("CO*")
    End If    

    If (rfvlsi_totoal_METAL1_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL1*")
    End If    

    If (rfvlsi_totoal_Via1_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via1*")
    End If    

    If (rfvlsi_totoal_METAL2_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL2*")
    End If    

    If (rfvlsi_totoal_Via2_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via2*")
    End If    

    If (rfvlsi_totoal_METAL3_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL3*")
    End If    

    If (rfvlsi_totoal_Via3_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via3*")
    End If    

    If (rfvlsi_totoal_METAL4_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL4*")
    End If    

    If (rfvlsi_totoal_Via4_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via4*")
    End If    

    If (rfvlsi_totoal_METAL5_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL5*")
    End If    

    If (rfvlsi_totoal_Via5_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via5*")
    End If    

    If (rfvlsi_totoal_METAL6_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL6*")
    End If    

    If (rfvlsi_totoal_Via6_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via6*")
    End If    

    If (rfvlsi_totoal_METAL7_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL7*")
        oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "FOX", "Tool Parts:=", Join(A,",")), Array("NAME:SubtractParameters", "KeepOriginals:=", true)
        oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "IMD_7c", "Tool Parts:=", Join(A,",")), Array("NAME:SubtractParameters", "KeepOriginals:=", true)
    End If    

    If (rfvlsi_totoal_Via7_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via7*")
        oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "FOX", "Tool Parts:=", Join(A,",")), Array("NAME:SubtractParameters", "KeepOriginals:=", true)
        oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "IMD_7c", "Tool Parts:=", Join(A,",")), Array("NAME:SubtractParameters", "KeepOriginals:=", true)
    End If    

    If (rfvlsi_totoal_METAL8_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL8*")
    End If    

    If (rfvlsi_totoal_Via8_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via8*")
    End If    

    If (rfvlsi_totoal_METAL9_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL9*")
    End If    

    If (rfvlsi_totoal_Via9_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via9*")
    End If    

    If (rfvlsi_totoal_METAL10_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL10*")
        oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "IMD_7c", "Tool Parts:=", Join(A,",")), Array("NAME:SubtractParameters", "KeepOriginals:=", true)
    End If    
    oProject.Save
End If
Set oModule = oDesign.GetModule("AnalysisSetup")
' Setup Interpolating Sweep :
oModule.InsertSetup "HfssDriven", Array("NAME:SP_Sim", "Frequency:=", "50GHz", "PortsOnly:=",  _
  false, "MaxDeltaS:=", 0.02, "UseMatrixConv:=", false, "MaximumPasses:=", 20, "MinimumPasses:=",  _
  1, "MinimumConvergedPasses:=", 1, "PercentRefinement:=", 30, "IsEnabled:=",  _
  true, "BasisOrder:=", -1, "UseIterativeSolver:=", true,"IterativeResidual:=", _
  0.0001, "DoLambdaRefine:=", true, "DoMaterialLambda:=", true, "SetLambdaTarget:=", false, "Target:=",  _
  0.3333, "UseMaxTetIncrease:=", false, "PortAccuracy:=", 2, "UseABCOnPort:=",  _
  false, "SetPortMinMaxTri:=", false, "EnableSolverDomains:=", false, "ThermalFeedback:=",  _
  false, "NoAdditionalRefinementOnImport:=", false)

oModule.InsertFrequencySweep "SP_Sim", Array("NAME:SP_Sim_Sweep", "IsEnabled:=", true, "SetupType:=",  _
  "LinearStep", "StartValue:=", Cstr(1)&"GHz", "StopValue:=", Cstr(60)&"GHz", "StepSize:=",  _
  "0.1GHz", "Type:=", "Interpolating", "SaveFields:=", false, "InterpTolerance:=",  _
  0.5, "InterpMaxSolns:=", 250, "InterpMinSolns:=", 0, "InterpMinSubranges:=", 1, "ExtrapToDC:=",  _
  false, "InterpUseS:=", true, "InterpUsePortImped:=", true, "InterpUsePropConst:=",  _
  true, "UseDerivativeConvergence:=", false, "InterpDerivTolerance:=", 0.2, "UseFullBasis:=",  _
  true)

oProject.Save ' Ready for simulation

