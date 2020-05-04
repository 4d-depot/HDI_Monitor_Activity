//%attributes = {"invisible":true}


If ((Application type:C494=4D Remote mode:K5:5) & (Form:C1466.monitorOnServer=True:C214))
	
	stopMonitoringOnServer 
	
Else 
	STOP MONITORING ACTIVITY:C1721
	
End if 