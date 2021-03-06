USE [master]
GO

-- Variable initialization
DECLARE @CurrentErrLogCount INT,
		@SetNewErrLogCountValue INT = 12 /* Max we can set is 99 error logs */

-- Check, at present, how many error logs are there
EXEC dbo.xp_instance_regread 
							N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer'
							, N'NumErrorLogs'
							, @CurrentErrLogCount OUTPUT
SELECT @CurrentErrLogCount AS NumErrorLogs

-- Reconfigure the number of error log values
EXEC dbo.xp_instance_regwrite 
							N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer'
							, N'NumErrorLogs'
							, REG_DWORD
							, @SetNewErrLogCountValue

-- Newly set value should be displayed now!!
EXEC dbo.xp_instance_regread 
							N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer'
							, N'NumErrorLogs'
							, @CurrentErrLogCount OUTPUT
SELECT @CurrentErrLogCount AS Validate_NumErrorLogs
