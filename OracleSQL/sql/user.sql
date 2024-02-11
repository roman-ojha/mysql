--user creation
Create USER sabin IDENTIFIED BY Test123;
--user view
select username
from dba_users
where account_status = 'OPEN';

select * from customers;
--grant session privileg to user
grant create session to sabin ;
SELECT owner, table_name FROM all_tables 
WHERE table_name = 'CUSTOMERS';
select * from  CUSTOMERS;
--view privileg to user
select * from user_tab_privs where Grantee = 'SABIN';
--grant select privileg to user on table
GRANT SELECT ON SYSTEM.CUSTOMERS TO SABIN;
revoke SELECT on SYSTEM.CUSTOMERS from SABIN;

select * from user_tab_privs where Grantee = 'SABIN';
GRANT SELECT,insert ON SYSTEM.CUSTOMERS TO SABIN;
revoke SELECT,insert on SYSTEM.CUSTOMERS from SABIN;
-- SELECT * FROM all_synonyms WHERE table_name = 'CUSTOMERS';
-- DROP SYNONYM CUST;


--select all
grant all on SYSTEM.CUSTOMERS to SABIN 
--revoke privilege

revoke ALL on SYSTEM.CUSTOMERS from SABIN;
--drop user
drop user SABIN;
-- select role
select * from dba_roles where role = 'STUDENT';
--create roles
create roles student;
--grant roles
grant select , insert ,update,delete on customers to student 
--view role
select * from user_role_privs
--view role privileg
select * from role_tab_privs where role = 'STUDENT'
--grant role to user
grant student to sabin

--set role
set role student
select * from session_roles
select * from user_role_privs where username = 'SABIN'
select * from DBA_TAB_PRIVS where GRANTEE = 'SABIN'
revoke student from sabin
drop role student 
--to find current profile of user jhon
select username,profile from dba_users where username = 'SABIN'
--find default profile
select * from dba_profiles where profile ='DEFAULT'
--create profile to set the resource limit 
create profile resource_profile LIMIT
SESSIONS_PER_USER unlimited
CPU_PER_SESSION UNLIMITED
CPU_PER_CALL 3000
connect_time 15;
--create profile to set password limit
create profile password_profile limit
failed_login_attempts 5
password_life_time 90

select * from dba_profiles where profile ='RESOURCE_PROFILE'
select * from dba_profiles where profile ='PASSWORD_PROFILE'

--create user & set profile
create user Test identified by 1234
Profile RESOURCE_PROFILE
Profile PASSWORD_PROFILE
select username,profile from dba_users where username = 'TEST'
--Alter user and set profile
alter user test profile PASSWORD_PROFILE
--check info about tablespace
select * from dba_tablespaces
select * from v$tablespace
-- check info about datafile
select * from dba_data_file
select * from v$datafile
--check info about control file
select value from v$parameter where name ='CONTROL_FILE'
select name from v$controlfile
--check info about log file 
select * from v$logfile 
select * from V$log

SELECT 
   tablespace_name, 
   file_name
FROM
   dba_data_files;

CREATE TABLESPACE test_tablespace
DATAFILE 'C:\oracleBase\oradata\HCOE_DEMO\DATAFILE\test_data.dbf' 
SIZE 1M
AUTOEXTEND ON
NEXT 1M
MAXSIZE UNLIMITED;


alter TABLESPACE test_tablespace 
drop DATAFILE 'C:\oracleBase\oradata\HCOE_DEMO\DATAFILE\test_data.dbf' ;
-- drop tablespace
drop tablespace test_tablespace;

alter TABLESPACE test_tablespace 
add DATAFILE 'C:\oracleBase\oradata\HCOE_DEMO\DATAFILE\test_1_data.dbf'
size 1M     
AUTOEXTEND ON
    NEXT 10M
    MAXSIZE UNLIMITED;