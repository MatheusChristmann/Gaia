@echo off

set x=%DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4%
echo %x%
set date=%x%
echo %date%

   set PGUSER=gaiadba
   set BACKUP_FILE=C:\Backup\gaiadbBackup_%date%.backup
   echo backup file name is %BACKUP_FILE%
   SET PGPASSWORD=@gaiadba2022@
   echo on
   "C:\Program Files\PostgreSQL\14\bin\pg_dump.exe" -h localhost -p 5432 -U gaiadba -C -F p  -v -f %BACKUP_FILE% gaiadb
pause