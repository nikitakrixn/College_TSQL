INSERT INTO ST_Study
	([FirstName]
          ,[LastName]
           ,[DateFrom]
           ,[DateTo]
           ,[GroupId])

SELECT [FirstName]
           ,[LastName]
           ,[DateFrom]
           ,[DateTo]
           ,[GroupId]
FROM [education].[dbo].[Student]