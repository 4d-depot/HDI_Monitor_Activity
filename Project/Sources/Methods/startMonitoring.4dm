//%attributes = {"invisible":true}

C_REAL:C285($1;$duration)
C_LONGINT:C283($2;$source)

$duration:=$1
$source:=$2


If ((Application type:C494=4D Remote mode:K5:5) & (Form:C1466.monitorOnServer=True:C214))
	
	startMonitoringOnServer ($duration;$source)
	
Else 
	
	START MONITORING ACTIVITY:C1712($duration;$source)
	
End if 