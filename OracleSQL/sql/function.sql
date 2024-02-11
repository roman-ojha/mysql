/*
CREATE [OR REPLACE] FUNCTION function_name
   (parameter1 datatype1, parameter2 datatype2, ..., parametern datatypen)
RETURN return_datatype
IS
   -- Declarations (optional)
   variable1 datatype1;
   variable2 datatype2;
   -- ...

BEGIN
   -- Body of the function
   -- SQL statements or PL/SQL logic here
   -- Use parameters and variables as needed

   RETURN return_value; -- Specify the value to be returned

END function_name;
/

*/

CREATE OR REPLACE FUNCTION concat_names(p_first_name VARCHAR2, 
p_last_name VARCHAR2)
RETURN VARCHAR2
IS
    v_full_name VARCHAR2(100);
BEGIN
    v_full_name := p_first_name || ' ' || p_last_name;
    RETURN v_full_name;
END concat_names;
/
SELECT concat_names(first_name, last_name) AS full_name
FROM customers;
drop function concat_names;

select * FROM customers;
drop PROCEDURE welcome_msg;
CREATE OR REPLACE PROCEDURE welcome_msg (p_name IN VARCHAR2) 
IS
BEGIN
dbms_output.put_line ('Welcome '|| p_name);
END;
/
SET SERVEROUTPUT ON;

EXEC welcome_msg ('Nepal');

select * from customers;

CREATE OR REPLACE PROCEDURE GetCustomerDetailsByFirstName
   (p_first_name IN VARCHAR2)
IS
   v_customer_id customers.customers_id%TYPE;
   v_customer_first_name customers.first_name%TYPE;
   v_customer_last_name customers.last_name%TYPE;
   v_country customers.country%TYPE;
BEGIN
   -- Attempt to retrieve customer details
   BEGIN
      SELECT customers_id, first_name, last_name, country
      INTO v_customer_id, v_customer_first_name, v_customer_last_name, 
      v_country
      FROM customers
      WHERE first_name = p_first_name;

      -- Output customer details
      DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
      DBMS_OUTPUT.PUT_LINE('Customer first Name: ' || v_customer_first_name);
      DBMS_OUTPUT.PUT_LINE('Customer Last Name: ' || v_customer_last_name);
      DBMS_OUTPUT.PUT_LINE('Country: ' || v_country);
   EXCEPTION
      -- Handle the case where no records are found
      WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('No customer found with the provided first name.');
   END;
END GetCustomerDetailsByFirstName;
/
select * from customers;
SET SERVEROUTPUT ON;
EXEC GetCustomerDetailsByFirstName('Rosanaa');
drop procedure GetCustomerDetailsByFirstName;


-- Package Specification
CREATE OR REPLACE PACKAGE EmployeePackage AS
   PROCEDURE InsertEmployee(emp_id NUMBER, emp_name VARCHAR2);
   FUNCTION GetEmployeeCount RETURN NUMBER;
END EmployeePackage;
/
drop PACKAGE EmployeePackage;
-- Package Body
CREATE OR REPLACE PACKAGE BODY EmployeePackage AS
   total_employees NUMBER := 0;

   PROCEDURE InsertEmployee(emp_id NUMBER, emp_name VARCHAR2) IS
   BEGIN
      -- Implementation to insert an employee
      total_employees := total_employees + 1;
   END InsertEmployee;

   FUNCTION GetEmployeeCount RETURN NUMBER IS
   BEGIN
      -- Implementation to retrieve employee count
      RETURN total_employees;
   END GetEmployeeCount;
END EmployeePackage;
/

DECLARE
   emp_count NUMBER;
BEGIN
   EmployeePackage.InsertEmployee(2, 'John Doe');
   emp_count := EmployeePackage.GetEmployeeCount;
   DBMS_OUTPUT.PUT_LINE('Total Employees: ' || emp_count);
END;
/
