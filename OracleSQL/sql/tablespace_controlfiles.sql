-- view all tablespace
Select tablespace_name, status, contents
from dba_tablespaces;

-- view all tablespace details
Select df.file_name, ts.tablespace_name, ts.block_size 
from dba_data_files df
inner join dba_tablespaces ts on df.tablespace_name = ts. tablespace_name
where ts.tablespace_name='USERS';

-- view tablespace usage 
select username, tablespace_name ,max_bytes
from dba_ts_quotas
where tablespace_name='USERS';

-- view free space in tablespace
select tablespace_name , bytes
from dba_free_space
where tablespace_name='USERS';

-- create tablespace
CREATE TABLESPACE test_tablespace
DATAFILE 'C:\oracleBase\oradata\HCOE_DEMO\DATAFILE\test_data.dbf' 
SIZE 1M
AUTOEXTEND ON
NEXT 10M
MAXSIZE UNLIMITED;
;

-- drop datafiles
alter TABLESPACE test_tablespace 
drop DATAFILE 'C:\oracleBase\oradata\HCOE_DEMO\DATAFILE\test_1_data.dbf' ;
-- drop tablespace
drop tablespace test_tablespace;

-- view datafiles
select tablespace_name, file_id, file_name, bytes, status 
from dba_data_files;

-- adding datafiles

alter TABLESPACE test_tablespace 
add DATAFILE 'C:\oracleBase\oradata\HCOE_DEMO\DATAFILE\test_1_data.dbf'
size 1M     
AUTOEXTEND ON
    NEXT 10M
    MAXSIZE UNLIMITED;
;

SHOW PARAMETER control_files;

show parameter spfile;

select * from v$database;
select name from v$controlfile;
show PARAMETER v$controlfile;
ALTER DATABASE BACKUP CONTROLFILE TO TRACE AS 'D:\\trace_cf.txt';

select * from persons;

select * from v$controlfile;
SELECT STATUS FROM V$CONTROLFILE;

select * from v$log; -- provides information about the redo log groups and their status.
select * from v$logfile; -- lists the individual redo log file members
select * from V$LOG_HISTORY; -- displays historical information about redo log switches
SELECT VALUE FROM V$PARAMETER WHERE NAME = 'control_files'; 

SELECT GROUP#, THREAD#, SEQUENCE#, BYTES, MEMBERS,STATUS
FROM V$LOG
WHERE STATUS = 'CURRENT';

SELECT GROUP#, MEMBER
FROM V$LOGFILE
WHERE GROUP# = 1;
