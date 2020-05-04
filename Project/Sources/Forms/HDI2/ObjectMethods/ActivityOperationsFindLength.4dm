
C_POINTER:C301($ptr)
C_OBJECT:C1216($persons)
ARRAY LONGINT:C221(_ids;0)


If (btnTrace)
	TRACE:C157
End if 


Case of 
	: (Form:C1466.classic)
		QUERY BY FORMULA:C48([Persons:3];Length:C16([Persons:3]firstname:7+"-"+[Persons:3]lastname:3)>=16)
		
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"executedCode3")
		$ptr->:=_TabLineCode{16}
		
	: (Form:C1466.sql)
		Begin SQL
			SELECT ID FROM Persons HAVING LENGTH (CONCAT(CONCAT(Persons.firstname,'-'), Persons.lastname))  >= 16 INTO :_ids;
		End SQL
		
		QUERY WITH ARRAY:C644([Persons:3]ID:1;_ids)
		
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"executedCode3")
		$ptr->:=_TabLineCode{17}
		
	: (Form:C1466.orda)
		$persons:=ds:C1482.Persons.query(Formula:C1597(Length:C16(This:C1470.firstname+"-"+This:C1470.lastname)>=16))
		USE ENTITY SELECTION:C1513($persons)
		
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"executedCode3")
		$ptr->:=_TabLineCode{18}
		
End case 


