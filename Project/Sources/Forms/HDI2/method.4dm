
C_REAL:C285(duration)


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(_Descriptions; 0)
		ARRAY TEXT:C222(_TabLineCode; 0)
		ARRAY TEXT:C222(_TabTitles; 0)
		
		READ ONLY:C145([INFOS:2])
		
		QUERY:C277([INFOS:2]; [INFOS:2]pageNumber:2; "<="; 9)
		ORDER BY:C49([INFOS:2]; [INFOS:2]pageNumber:2; >)
		SELECTION TO ARRAY:C260([INFOS:2]Description:4; _Descriptions)
		
		QUERY:C277([INFOS:2]; [INFOS:2]pageNumber:2; "<="; 9)
		ORDER BY:C49([INFOS:2]; [INFOS:2]pageNumber:2; >)
		SELECTION TO ARRAY:C260([INFOS:2]TabTitle:3; _TabTitles)
		
		QUERY:C277([INFOS:2]; [INFOS:2]pageNumber:2; ">="; 10)
		ORDER BY:C49([INFOS:2]; [INFOS:2]pageNumber:2; >)
		SELECTION TO ARRAY:C260([INFOS:2]Description:4; _TabLineCode)
		
		Form:C1466.persons:=ds:C1482.Persons.all()
		
		duration:=0.001
		
		viewTrace
		manageTexts
		RW
		
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		OBJECT SET ENABLED:C1123(*; "ActivityLanguage@"; False:C215)
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "executedCode1")
		$ptr->:=""
		
		Form:C1466.duration:=duration
		Form:C1466.activities:=Null:C1517
		Form:C1466.age:=20
		
		STOP MONITORING ACTIVITY:C1721
		
		OBJECT SET ENABLED:C1123(*; "Start2"; False:C215)
		OBJECT SET ENABLED:C1123(*; "MonitorNetworkOnServer"; False:C215)
		OBJECT SET ENABLED:C1123(*; "MonitorDataOnServer"; False:C215)
		
		If (Application type:C494=4D Remote mode:K5:5)
			OBJECT SET ENABLED:C1123(*; "Start2"; True:C214)
			OBJECT SET ENABLED:C1123(*; "MonitorNetworkOnServer"; True:C214)
			OBJECT SET ENABLED:C1123(*; "MonitorDataOnServer"; True:C214)
			STOP MONITORING ACTIVITY:C1721
			stopMonitoringOnServer()
		End if 
		
		Form:C1466.monitorOnServer:=False:C215
		
		OBJECT SET ENABLED:C1123(*; "ActivityNetwork@"; False:C215)
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "executedCode2")
		$ptr->:=""
		
		OBJECT SET ENABLED:C1123(*; "ActivityOperations@"; False:C215)
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "executedCode3")
		$ptr->:=""
		
		If (FORM Get current page:C276=4)
			ALL RECORDS:C47([Persons:3])
		End if 
		
		Form:C1466.classic:=True:C214
		Form:C1466.sql:=False:C215
		Form:C1466.orda:=False:C215
		Form:C1466.viewOtherInfoOpened:=False:C215
		
		viewTrace
		manageTexts
		
		
End case 

btnTrace:=False:C215