


DECLARE @name VARCHAR(50) -- database name 
DECLARE db_cursor CURSOR FOR 
select s.name+'.'+t.name  as tablename from sys.tables t inner join sys.schemas s on t.schema_id = s.schema_id

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @name  

WHILE @@FETCH_STATUS = 0  
BEGIN  
BEGIN TRY
      EXEC('Truncate table ' + @name) 
	  print(@name)
	  FETCH NEXT FROM db_cursor INTO @name  
END TRY
BEGIN CATCH
print(@name)
	  FETCH NEXT FROM db_cursor INTO @name 
END CATCH
END 

CLOSE db_cursor  
DEALLOCATE db_cursor 