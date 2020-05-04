
C_POINTER:C301($ptr)
C_OBJECT:C1216($persons)
ARRAY LONGINT:C221(_ids;0)

If (btnTrace)
	TRACE:C157
End if 


Case of 
	: (Form:C1466.classic)
		QUERY:C277([Persons:3];[Persons:3]age:2>=Average:C2([Persons:3]age:2))
		
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"executedCode3")
		$ptr->:=_TabLineCode{9}
		
	: (Form:C1466.sql)
		Begin SQL
			SELECT ID FROM Persons HAVING age >= AVG(age) INTO :_ids;
		End SQL
		
		QUERY WITH ARRAY:C644([Persons:3]ID:1;_ids)
		
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"executedCode3")
		$ptr->:=_TabLineCode{14}
		
	: (Form:C1466.orda)
		$persons:=ds:C1482.Persons.query("age >= :1";ds:C1482.Persons.all().average("age"))
		USE ENTITY SELECTION:C1513($persons)
		
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"executedCode3")
		$ptr->:=_TabLineCode{15}
End case 

