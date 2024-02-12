Set SERVEROUTPUT ON
Declare
    message varchar2(150):= 'Hello, World';
Begin 
    dbms_output.put_line(message);
end;
/


DECLARE 
   a number(3) := 100; 
BEGIN 
   -- check the boolean condition using if statement  
   IF( a < 20 ) THEN 
      -- if condition is true then print the following   
      dbms_output.put_line('a is less than 20 ' ); 
   ELSE 
      dbms_output.put_line('a is not less than 20 ' ); 
   END IF; 
   dbms_output.put_line('value of a is : ' || a); 
END; 
/

DECLARE
	x int;
BEGIN
	x := &x;
	if mod(x,2) = 0 then
		dbms_output.put_line('Even Number');
	else
		dbms_output.put_line('Odd Number');
	end if;
END;

/* 
LOOP
	sequence of statements
END LOOP;

*/

set serveroutput on;

DECLARE
	i int;
BEGIN
	i := 1;
	LOOP
		if i>10 then
			exit;
		end if;
		dbms_output.put_line(i);
		i := i+1;
	END LOOP;
END;

/*

WHILE <test_condition> LOOP
	<action>
END LOOP;
*/

set serveroutput on;

DECLARE
	num int:=1;
BEGIN
	while(num <= 10) LOOP
		dbms_output.put_line(''|| num);
		num := num+2;
	END LOOP;
END;

/*
FOR counter_variable IN start_value..end_value LOOP
	statement to be executed
END LOOP;
*/

set serveroutput on;
DECLARE
	i number(2);
BEGIN
	FOR i IN 1..10 LOOP
		dbms_output.put_line(i);
	END LOOP;
END;
