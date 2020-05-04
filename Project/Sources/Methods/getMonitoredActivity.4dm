//%attributes = {"invisible":true}


If ((Application type:C494=4D Remote mode:K5:5) & (Form:C1466.monitorOnServer=True:C214))
	
	Form:C1466.activities:=getMonitoredActivityOnServer 
	
Else 
	
	Form:C1466.activities:=Get Monitored Activity:C1713().orderBy("startTime")
	
End if 