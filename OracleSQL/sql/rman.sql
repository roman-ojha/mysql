rman target/
backup database;
shutdown immediate;
startup mount;
backup database tag 'test';
list backup;
ALTER DATABASE OPEN;