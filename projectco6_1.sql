CREATE VIEW [dbo].[vwEmployeeSalaryPeriod]
AS
SELECT dbo.tblSalary.Period, dbo.tblEmployee.SurName, dbo.tblEmployee.Name, dbo.tblEmployee.Fathername, dbo.tblJob.Job, SUM(dbo.tblSalary.SalarySum) AS SalarySumItog
FROM         dbo.tblEmployee INNER JOIN
                      dbo.tblSalary ON dbo.tblEmployee.IDEmployee = dbo.tblSalary.IDEmployee INNER JOIN
					  dbo.tblJob ON dbo.tblEmployee.IDJob = dbo.tblJob.IDJob
GROUP BY dbo.tblSalary.Period, dbo.tblEmployee.SurName, dbo.tblEmployee.Name, dbo.tblEmployee.Fathername, dbo.tblJob.Job
GO