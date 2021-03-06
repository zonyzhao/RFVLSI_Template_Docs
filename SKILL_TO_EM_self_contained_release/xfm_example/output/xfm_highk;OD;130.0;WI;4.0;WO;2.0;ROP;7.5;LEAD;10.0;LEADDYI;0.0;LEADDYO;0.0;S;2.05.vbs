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

oProject.InsertDesign "HFSS","xfm_highk", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("xfm_highk")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oProject.SaveAs "C:\Users\Wang\Documents\GitHub\ANTLR4\self_contained_release\xfm_example\output\xfm_highk;OD;130.0;WI;4.0;WO;2.0;ROP;7.5;LEAD;10.0;LEADDYI;0.0;LEADDYO;0.0;S;2.05", true

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
rfvlsi_em_sim_piority = 2
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

Function roundtogrid(Number)
	roundtogrid=Round(Number/rfvlsi_maskgrid)*rfvlsi_maskgrid
End Function

''Drawing output functions:
Sub CMetalRect(strORIENT, iMetalIndex, fOriginX, fOriginY, fWidth, fLength, iNumX, iNumY, fSpaceX, fSpaceY)			
	For iXCreateBox=0 To (iNumX-1) 
		For iYCreateBox=0 To (iNumY-1)		
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
If (rfvlsi_em_sim_piority>=priority) Then
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
    If rfvlsi_em_sim_piority>= priority Then
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
    If (rfvlsi_em_sim_piority>=priority) Then
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
	Select Case orient1
      Case rfvlsi_ORIENT_R0
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR0By(orient2)
      Case rfvlsi_ORIENT_R90
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR90By(orient2)
      Case rfvlsi_ORIENT_R180
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR180By(orient2)
      Case rfvlsi_ORIENT_R270
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR270By(orient2)
      Case rfvlsi_ORIENT_MX
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMXBy(orient2)
      Case rfvlsi_ORIENT_MXR90
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMXR90By(orient2)
      Case rfvlsi_ORIENT_MY
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMYBy(orient2)
	  Case Else
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMYR90By(orient2)
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
		rfvlsi_newOriginY=offsetY-originY
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

Function ViaWidthVec(m)
	Select Case m
		Case (1)
			returnVal = 0.09
		Case 0, 1, 2, 3, 4, 5
			returnVal = 0.1
		Case 6, 7
			returnVal = 0.36
		Case true
			returnVal = 3.0
	End Select
	ViaWidthVec = returnVal
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
		Case (1)
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
		Case (1)
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
		Case (1), 0, 1, 2, 3, 4, 5
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
Sub rfvlsiHFSS_Create_vias(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, Length, Width, TOP_ME, BTM_ME, bPP, conservative, x_cut, y_cut)
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
Sub rfvlsiHFSS_Create_vias_diagonal(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, Length, Width, TOP_ME, BTM_ME)
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

strCellName = "base_ind_under"
strViewName = "layout"
Sub rfvlsiHFSS_Create_base_ind_under(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, W, WX, S, TOP_ME, BTM_ME, NT, INDDMY, INDDMYP, dummy)
	' No output for: techfile_lib=techGetTechLibName(pcCellView~>lib), but is internally processed.
	' No output for: techFileID=techGetTechFile(ddGetObj(techfile_lib)), but is internally processed.

	If ((BTM_ME)=(TOP_ME)) Then
		BTM_ME_CHOSEN = (TOP_ME)-(1)
	Else
		BTM_ME_CHOSEN = BTM_ME
	End If

	P = (W)+(S)
	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		((BTM_ME_CHOSEN)-(1)), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, (-(W)), rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, (-(W)), rfvlsi_ORIENT_R0), _ 
		(WX)-(0), ((NT)*(P))-((-(W))), 1, 1, 1.0, 1.0	
		

	' No output for: masterv=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((NT)*(P))-(W), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((NT)*(P))-(W), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		W, WX, TOP_ME, BTM_ME_CHOSEN, True, True, False, False
	'( instv = )part is not translated, due to rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((NT)*(P))-(W), rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, (-(W)), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, (-(W)), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		W, WX, TOP_ME, BTM_ME_CHOSEN, True, True, False, False
	'( instv2 = )part is not translated, due to rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, (-(W)), rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.

	If (dummy) Then
		' Not using MetalVec/ViaVec, thus ignored in translation
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_ind_diag"
Sub rfvlsiHFSS_Create_base_ind_diag(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, W, S, MET)
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

strCellName = "base_xfm_lead"
Sub rfvlsiHFSS_Create_base_xfm_lead(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, L, W, WD, PINTXT, PINP, TOP_ME, BTM_ME, DUMMYL, DUMMYP, dummy)
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		W, L, atoi(TOP_ME), atoi(BTM_ME), True, True, False, False

	If (dummy) Then
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' dbCreateLabel is skipped in translation output, and not processed at all.
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_xfm_lead_pair"
Sub rfvlsiHFSS_Create_base_xfm_lead_pair(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, W, OPENING, LEAD, TOP_ME, LEAD_ME, dummy, P1TXT, N1TXT)
	' No output for: m_lead=dbOpenCellViewByType(pcCellView~>lib"base_xfm_lead""layout"), but is internally processed.
	' No output for: m_vias=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	TM = atoi(TOP_ME)
	LM = atoi(LEAD_ME)
	rfvlsiHFSS_Create_base_xfm_lead rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, OPENING, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, OPENING, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		LEAD, W, 1.0, P1TXT, "dummy1", LEAD_ME, LEAD_ME, "RFVLSI", "drawing", dummy
	rfvlsiHFSS_Create_base_xfm_lead rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OPENING)))-(W), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OPENING)))-(W), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		LEAD, W, 1.0, N1TXT, "dummy1", LEAD_ME, LEAD_ME, "RFVLSI", "drawing", dummy

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

strCellName = "base_balun_half"
Sub rfvlsiHFSS_Create_base_balun_half(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, W, W_INC, S, B_TK, A_TK, LOP, ROP, en_dmy, en_NTN, align_left)
	pi = 3.141592
	P = (S)+(W)
	WW = (W)+(W_INC)
	C = ceiltogrid(((W)*(tan((pi)/(8))))+(0.005))
	CA = roundtogrid((C)/(2))
	CB = (C)-(CA)
	CI = (roundtogrid((WW)*(tan((pi)/(8)))))-(C)
	DIV = (2)+(sqrt(2))
	A = (roundtogrid((OD)/(DIV)))-(A_TK)
	B = ((OD)-((2)*(A)))-(B_TK)
	BA = floortogrid(((B)/(2))-(0.005))
	BB = (B)-(BA)
	PA = roundtogrid((P)/(2))
	PB = (P)-(PA)
	rfvlsiHFSS_Create_base_xfm_half rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, S, B_TK, A_TK, LOP, ROP, 9, 8, en_dmy, True, True

	If ((NOT (en_NTN))) Then
		' dbCreateLabel is skipped in translation output, and not processed at all.
	Else
		' Not using MetalVec/ViaVec, thus ignored in translation
	End If


	If (en_dmy) Then
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
		' Not using MetalVec/ViaVec, thus ignored in translation
	End If


	If (align_left) Then
		rfvlsiHFSS_Create_base_xfm_body rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			OD, WW, LOP, ROP, 8
	Else
		rfvlsiHFSS_Create_base_xfm_body rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (-(W_INC)), 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (-(W_INC)), 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			(OD)+((2)*(W_INC)), WW, LOP, ROP, 8
	End If

	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)-(W), ROP, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)-(W), ROP, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(BA)-(ROP), W, 9, 8, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, LOP, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, LOP, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(BA)-(LOP), W, 9, 8, True, True, False, False
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_balun_halfud"
Sub rfvlsiHFSS_Create_base_balun_halfud(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, W, W_INC, S, LOP, ROP, LEADDYI, LEADDYO, en_dmy, align_left)
	rfvlsiHFSS_Create_base_balun_half rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, W_INC, S, 0.0, 0.0, (LOP)+(LEADDYI), (ROP)+(LEADDYO), en_dmy, True, align_left
	rfvlsiHFSS_Create_base_balun_half rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		OD, W, W_INC, S, 0.0, 0.0, (LOP)-(LEADDYI), (ROP)-(LEADDYO), en_dmy, True, align_left
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_xfm_cross"
Sub rfvlsiHFSS_Create_base_xfm_cross(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, WI, WO, S, TOP_ME, BTM_ME, dummy, viat, viad, top)
	pi = 3.141592
	C = ceiltogrid(((WO)*(tan((pi)/(8))))+(0.005))
	C2 = ceiltogrid((C)/(sqrt(2)))
	OOCH = (((WO)+(S))+((WI)/(2)))-(C2)

	If ((((2)*(S))+(WI))<=((2.0)*(sqrt(2.0)))) Then
		OOCHD = ceiltogrid(((2.01)*(sqrt(2.0)))-(WI))
	Else
		OOCHD = 0.0
	End If

	' No output for: masterxdiag=dbOpenCellViewByType(pcCellView~>lib"base_ind_diag""layout"), but is internally processed.

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

strCellName = "base_xfm_highk_pri"
Sub rfvlsiHFSS_Create_base_xfm_highk_pri(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, WI, WO, M8_S, S, B_TK, LEADDYI, LEADDYO, A_TK, ROP, LOP, en_dmy, en_NTN, text)
	PI = (WI)+(S)
	PO = (WO)+(S)
	' No output for: master=dbOpenCellViewByType(pcCellView~>lib"base_balun_halfud""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_balun_halfud rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, WO, 1.5, S, ((LOP)+(M8_S))+(WI), ROP, LEADDYI, LEADDYO, en_dmy, True
	rfvlsiHFSS_Create_base_balun_halfud rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((WO)+(WI))+((2)*(S)), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((WO)+(WI))+((2)*(S)), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(OD)-((2)*(((PI)+(PO)))), WO, 1.5, S, ((LOP)+(M8_S))+(WI), (WI)+(M8_S), LEADDYI, LEADDYO, False, False
	' No output for: masterc=dbOpenCellViewByType(pcCellView~>lib"base_xfm_cross""layout"), but is internally processed.
	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		(8), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, (((-(LOP)))-(WI))-(M8_S), rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, (((-(LOP)))-(WI))-(M8_S), rfvlsi_ORIENT_R0), _ 
		(WO)-(0), (((((-(WI)))/(2))-(WO))-(S))-((((-(LOP)))-(WI))-(M8_S)), 1, 1, 1.0, 1.0	
		

	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		(8), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, (((WI)/(2))+(WO))+(S), rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, (((WI)/(2))+(WO))+(S), rfvlsi_ORIENT_R0), _ 
		(WO)-(0), (((LOP)+(WI))+(M8_S))-((((WI)/(2))+(WO))+(S)), 1, 1, 1.0, 1.0	
		

	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		(8), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (PO)+(PI), (((WI)/(2))+(WO))+(S), rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (PO)+(PI), (((WI)/(2))+(WO))+(S), rfvlsi_ORIENT_R0), _ 
		(((PO)+(PI))+(WO))-((PO)+(PI)), (((LOP)+(WI))+(M8_S))-((((WI)/(2))+(WO))+(S)), 1, 1, 1.0, 1.0	
		

	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		(8), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (PO)+(PI), (((-(LOP)))-(WI))-(M8_S), rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (PO)+(PI), (((-(LOP)))-(WI))-(M8_S), rfvlsi_ORIENT_R0), _ 
		(((PO)+(PI))+(WO))-((PO)+(PI)), (((((-(WI)))/(2))-(WO))-(S))-((((-(LOP)))-(WI))-(M8_S)), 1, 1, 1.0, 1.0	
		

	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		(8), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((OD)-(PI))-(PO))-(WO), (-(ROP)), rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((OD)-(PI))-(PO))-(WO), (-(ROP)), rfvlsi_ORIENT_R0), _ 
		(((OD)-(PI))-(PO))-((((OD)-(PI))-(PO))-(WO)), (ROP)-((-(ROP))), 1, 1, 1.0, 1.0	
		

	rfvlsiHFSS_Create_base_xfm_cross rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		WI, WO, S, 9, 9, True, True, True, True
	rfvlsiHFSS_Create_base_xfm_cross rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((2)*(WO))+((2)*(S)))+(WI), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((2)*(WO))+((2)*(S)))+(WI), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		WI, WO, S, 9, 8, True, True, True, False
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_xfm_dmy"
Sub rfvlsiHFSS_Create_base_xfm_dmy(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, layer, purpose)
	pi = 3.141592
	DIV = (2)+(sqrt(2))
	A = roundtogrid((OD)/(DIV))
	B = (OD)-((2)*(A))
	BA = roundtogrid((B)/(2))
	BB = (B)-(BA)
	' Not using MetalVec/ViaVec, thus ignored in translation
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_xfm_body"
Sub rfvlsiHFSS_Create_base_xfm_body(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, W, LOP, ROP, MET)
	pi = 3.141592
	C = ceiltogrid(((W)*(tan((pi)/(8))))+(0.005))
	DIV = (2)+(sqrt(2))
	A = roundtogrid((OD)/(DIV))
	B = (OD)-((2)*(A))
	BA = floortogrid(((B)/(2))-(0.005))
	BB = (B)-(BA)
	CMetalPolygon ((MET)-(1)), _
		rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
		Array(_
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , LOP , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , LOP , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (A)+(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((OD)-(A))-(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-(W) , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-(W) , ROP , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OD , ROP , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OD , BA , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-(A) , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, A , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0)), _
		Array(_
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , LOP , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , LOP , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (A)+(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((OD)-(A))-(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-(W) , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-(W) , ROP , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OD , ROP , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OD , BA , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)-(A) , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, A , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0)) 

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_xfm_half"
Sub rfvlsiHFSS_Create_base_xfm_half(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, W, S, B_TK, A_TK, LOP, ROP, TOP_ME, BTM_ME, en_dmy, via_to_next, via_diag)
	pi = 3.141592
	P = (S)+(W)
	C = ceiltogrid(((W)*(tan((pi)/(8))))+(0.005))
	DIV = (2)+(sqrt(2))
	A = (roundtogrid((OD)/(DIV)))-(A_TK)
	B = ((OD)-((2)*(A)))-(B_TK)
	BA = floortogrid(((B)/(2))-(0.005))
	BB = (B)-(BA)
	PA = roundtogrid((P)/(2))
	PB = (P)-(PA)
	' No output for: masterx=dbOpenCellViewByType(pcCellView~>lib"base_xfm_body""layout"), but is internally processed.
	' No output for: masterv=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	' No output for: mastervd=dbOpenCellViewByType(pcCellView~>lib"vias_diagonal""layout"), but is internally processed.

	For i = (BTM_ME) to (TOP_ME)
		rfvlsiHFSS_Create_base_xfm_body rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			OD, W, LOP, ROP, i
	Next


	If (via_to_next) Then
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)-(W), ROP, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)-(W), ROP, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			(BA)-(ROP), W, TOP_ME, BTM_ME, True, True, False, False
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, A, ((BA)+(A))-(W), rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, A, ((BA)+(A))-(W), rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			W, B, TOP_ME, BTM_ME, True, True, False, False
	End If


	If (en_dmy) Then
		rfvlsiHFSS_Create_base_xfm_dmy rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			OD, "RFVLSI", "drawing"
	End If


	If (via_diag) Then
		rfvlsiHFSS_Create_vias_diagonal rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, BA, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, BA, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((A)-(C))-(W), (W)+(C), TOP_ME, BTM_ME
		rfvlsiHFSS_Create_vias_diagonal rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, BA, rfvlsi_ORIENT_MY), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, BA, rfvlsi_ORIENT_MY), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
			((A)-(C))-(W), (W)+(C), TOP_ME, BTM_ME
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_xfm_halfud"
Sub rfvlsiHFSS_Create_base_xfm_halfud(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, W, S, B_TK, A_TK, LOP, ROP, LEADDYI, LEADDYO, en_dmy, TOP_ME, BTM_ME, via_to_next, via_diag)
	' No output for: mhalf=dbOpenCellViewByType(pcCellView~>lib"base_xfm_half""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_xfm_half rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, S, B_TK, A_TK, (LOP)+(LEADDYI), (ROP)+(LEADDYO), TOP_ME, BTM_ME, en_dmy, via_to_next, via_diag
	rfvlsiHFSS_Create_base_xfm_half rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		OD, W, S, B_TK, A_TK, (LOP)-(LEADDYI), (ROP)-(LEADDYO), TOP_ME, BTM_ME, en_dmy, via_to_next, via_diag
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_balun_sec"
Sub rfvlsiHFSS_Create_base_balun_sec(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, WI, WO, S, CW, B_TK, LEADDYI, LEADDYO, A_TK, DIV, LOP, dummy, DUMMYL)
	pi = 3.141592
	P = (S)+(WI)
	C = roundtogrid((WI)*(tan((pi)/(8))))
	A = (roundtogrid((OD)/(DIV)))-(A_TK)
	B = ((OD)-((2)*(A)))-(B_TK)
	BA = roundtogrid((B)/(2))
	BB = (B)-(BA)
	' No output for: master=dbOpenCellViewByType(pcCellView~>lib"base_xfm_halfud""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_xfm_halfud rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, WI, S, B_TK, A_TK, LOP, 0.0, LEADDYI, LEADDYO, True, "9", "9", True, True
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "xfm_highk"
Sub rfvlsiHFSS_Create_xfm_highk(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, WI, WO, ROP, LEAD, LEADDYI, LEADDYO, S, en_dmy, en_NTN, balun_str)
	PI = (WI)+(S)
	PO = (WO)+(S)
	M8_S = 3.0
	pi = 3.141592
	C = roundtogrid((WO)*(tan((pi)/(8))))
	C2 = roundtogrid((C)/(sqrt(2)))
	LOP = ((((WO)+((WI)/(2)))+(S))+(C2))+(M8_S)
	' No output for: masterp=dbOpenCellViewByType(pcCellView~>lib"base_xfm_highk_pri""layout"), but is internally processed.
	' No output for: masters=dbOpenCellViewByType(pcCellView~>lib"base_balun_sec""layout"), but is internally processed.
	' No output for: masterL=dbOpenCellViewByType(pcCellView~>lib"base_xfm_lead""layout"), but is internally processed.
	' No output for: masterUD=dbOpenCellViewByType(pcCellView~>lib"base_ind_under""layout"), but is internally processed.
	' No output for: m_lead_pair=dbOpenCellViewByType(pcCellView~>lib"base_xfm_lead_pair""layout"), but is internally processed.

	If (en_dmy) Then
		' dbCreateLabel is skipped in translation output, and not processed at all.
	End If

	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	rfvlsiHFSS_Create_base_xfm_highk_pri rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, WI, WO, 3.0, S, 0.0, LEADDYI, LEADDYO, 0.0, ROP, LOP, True, en_NTN, balun_str
	rfvlsiHFSS_Create_base_balun_sec rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, PO, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, PO, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(OD)-((2)*(PO)), WI, WO, S, 20.0, 0.0, LEADDYI, LEADDYO, 0.0, 3.414, LOP, True, "RFVLSI"
	rfvlsiHFSS_Create_base_ind_under rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, PO, LOP, rfvlsi_ORIENT_R90), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, PO, LOP, rfvlsi_ORIENT_R90), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R90),_
		WI, WI, ((2)*(S))+(WO), "9", "8", 1, "RFVLSI", "drawing", True
	rfvlsiHFSS_Create_base_ind_under rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, PO, ((-(LOP)))-(WI), rfvlsi_ORIENT_R90), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, PO, ((-(LOP)))-(WI), rfvlsi_ORIENT_R90), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R90),_
		WI, WI, ((2)*(S))+(WO), "9", "8", 1, "RFVLSI", "drawing", True
	rfvlsiHFSS_Create_base_xfm_lead_pair rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (-(S)), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (-(S)), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		WI, LOP, LEAD, "9", "9", en_dmy, "P1", "N1"
	rfvlsiHFSS_Create_base_xfm_lead_pair rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		WO, ROP, LEAD, "9", "9", en_dmy, "P2", "N2"
	' No output for: masterVias=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	'Creating Dummy Structure for EM simulation.  This part will not be used in PCell, but only in EM Simulation
	If (rfvlsi_em_sim_piority>=1) Then
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), ((-(OD))), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), ((-(OD))), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(2)*(OD), 10.0, 1, 1, True, True, False, False
	End If

	'Creating Dummy Structure for EM simulation.  This part will not be used in PCell, but only in EM Simulation
	If (rfvlsi_em_sim_piority>=1) Then
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)+(LEAD)), ((-(OD))), rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)+(LEAD)), ((-(OD))), rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		(2)*(OD), 10.0, 1, 1, True, True, False, False
	End If

	'Creating Dummy Structure for EM simulation.  This part will not be used in PCell, but only in EM Simulation
	If (rfvlsi_em_sim_piority>=1) Then
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), ((OD)-(10.0)), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), ((OD)-(10.0)), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		10.0, (((OD)+((2)*(LEAD)))+(S)), 1, 1, True, True, False, False
	End If

	'Creating Dummy Structure for EM simulation.  This part will not be used in PCell, but only in EM Simulation
	If (rfvlsi_em_sim_piority>=1) Then
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), (((-(OD)))+(10.0)), rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(LEAD)))-(S)), (((-(OD)))+(10.0)), rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		10.0, (((OD)+((2)*(LEAD)))+(S)), 1, 1, True, True, False, False
	End If

	'Adding a vertical lumped port.
	CVport "port1",((-(LEAD)))-(S),LOP,((-(LEAD)))-(S),(LOP)+(WI),((LOP)+(WI))-(LOP),"X",0,8,1
	'Adding a vertical lumped port.
	CVport "port2",((-(LEAD)))-(S),(-(LOP)),((-(LEAD)))-(S),((-(LOP)))-(WI),(((-(LOP)))-(WI))-((-(LOP))),"X",0,8,1
	'Adding a vertical lumped port.
	CVport "port3",(OD)+(LEAD),ROP,(OD)+(LEAD),(ROP)+(WO),((ROP)+(WO))-(ROP),"X",0,8,1
	'Adding a vertical lumped port.
	CVport "port4",(OD)+(LEAD),(-(ROP)),(OD)+(LEAD),((-(ROP)))-(WO),(((-(ROP)))-(WO))-((-(ROP))),"X",0,8,1
	'Create a radiation boundary
	CBoundary (((-(0.5)))*(OD))-(10.0),((-(OD)))-(10.0),(-(300.0)),((2)*(OD))+(20.0),((2)*(OD))+(20.0),600.0, 1

	rfvlsi_print_DIE=True
	CDielectric "Substrate", 11.9, 1, 1.0, (((-(0.5)))*(OD))-(5.0), ((-(OD)))-(5.0), -250000.0, ((2)*(OD))+(10.0), ((2)*(OD))+(10.0), 250000.0, 1
	CDielectric "FOX", 3.28174467495264, 1, 0.0, (((-(0.5)))*(OD))-(5.0), ((-(OD)))-(5.0), 0.0, ((2)*(OD))+(10.0), ((2)*(OD))+(10.0), 3140.0, 1
	CDielectric "IMD_7c", 4.491322366879034, 1, 0.0, (((-(0.5)))*(OD))-(5.0), ((-(OD)))-(5.0), 3140.0, ((2)*(OD))+(10.0), ((2)*(OD))+(10.0), 7435.0, 1
	oProject.Save


End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "xfm_highk_ct"
Sub rfvlsiHFSS_Create_xfm_highk_ct(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, OD, WI, WO, LOP, ROP, LEAD, LEADDYI, LEADDYO, S, en_dmy, en_NTN, balun_str)
	rfvlsiHFSS_Create_xfm_highk rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, WI, WO, ROP, LEAD, LEADDYI, LEADDYO, S, en_dmy, en_NTN, balun_str
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' Not using MetalVec/ViaVec, thus ignored in translation
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "vias_port_test"
Sub rfvlsiHFSS_Create_vias_port_test(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, Length, Width)
	' No output for: masterVias=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		100.0, Width, 9, 9, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		100.0, Width, 3, 1, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 100.0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 100.0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		Width, 100.0, 9, 9, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 100.0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 100.0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		Width, 100.0, 3, 1, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 100.0, 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 100.0, 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		100.0, Width, 9, 9, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 100.0, 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 100.0, 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		100.0, Width, 3, 1, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 20.0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 20.0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		10.0, 60.0, 9, 1, True, True, False, False
	'Adding a vertical lumped port.
	CVport "port1",0,0,Width,0,(Width)-(0),"Y",0,8,1
	'Adding a vertical lumped port.
	CVport "port2",(100.0)-(Width),0,100.0,0,(100.0)-((100.0)-(Width)),"Y",0,8,1
	'Create a radiation boundary
	CBoundary (-(10.0)),(-(10.0)),(-(300.0)),120,120,600.0, 1

	rfvlsi_print_DIE=True
	CDielectric "Substrate", 11.9, 1, 1.0, (-(10.0)), (-(10.0)), -250000.0, 120, 120, 250000.0, 1
	CDielectric "FOX", 3.28174467495264, 1, 0.0, (-(10.0)), (-(10.0)), 0.0, 120, 120, 3140.0, 1
	CDielectric "IMD_7c", 4.491322366879034, 1, 0.0, (-(10.0)), (-(10.0)), 3140.0, 120, 120, 7435.0, 1
	oProject.Save


End Sub
'Generating topcell
rfvlsiHFSS_Create_xfm_highk 0.0, 0.0, rfvlsi_ORIENT_R0, 130.0, 4.0, 2.0, 7.5, 10.0, 0.0, 0.0, 2.05, True, True, "xfm_highk" 
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
  true, "BasisOrder:=", 1, "UseIterativeSolver:=", false, "DoLambdaRefine:=",  _
  true, "DoMaterialLambda:=", true, "SetLambdaTarget:=", false, "Target:=",  _
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

