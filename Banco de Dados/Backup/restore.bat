@echo off
   set PGUSER=gaiadba
   SET PGPASSWORD=@gaiadba2022@
   echo on
    "C:\Program Files\PostgreSQL\14\bin\psql.exe" -h localhost -p 5432 -d gaiadb -U gaiadba -f C:\Backup\gaiadbBackup_20-11-2022.backup
pause