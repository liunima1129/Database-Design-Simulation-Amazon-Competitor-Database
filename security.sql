--Give myself the highest permission in both server and database
create login YuhanLiu 
with password = 'yliu335',
default_database = AmazonCompetitorDatabase;
go
alter server role sysadmin add MEMBER YuhanLiu
go
create user YuhanLiu for login YuhanLiu 
with default_schema=dbo;
go
alter role db_owner add MEMBER YuhanLiu
