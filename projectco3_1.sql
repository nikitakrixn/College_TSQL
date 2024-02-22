DECLARE @pPeriod  datetime

set @pPeriod = CONVERT(datetime,'01.01.2013',104)

UPDATE  tblSalary
	SET SalarySum = SalarySum * 1.5
WHERE Period = @pPeriod and (IDEmployee IN
                          (SELECT     IDEmployee
                            FROM      tblProjectWorking
                            WHERE     Period = @pPeriod)) 
GO
