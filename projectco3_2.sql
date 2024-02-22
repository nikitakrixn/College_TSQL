UPDATE  tblEmployee
	SET HourlyRate = 132
WHERE (IDEmployee in (SELECT     IDEmployee
						FROM      tblProjectWorking
						WHERE     IDProject = '1042106200'))