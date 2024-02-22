/* Представление отображает информацию о заработной плате руководящих сотрудников по периодам  */


ALTER VIEW [dbo].[vwEmployeeSalaryItog]
AS
SELECT     dbo.tblEmployee.SurName, dbo.tblEmployee.Name, dbo.tblEmployee.Fathername, dbo.tblSalary.Period, SUM(dbo.tblSalary.SalarySum) AS SalarySumItog
FROM         dbo.tblEmployee INNER JOIN
                      dbo.tblSalary ON dbo.tblEmployee.IDEmployee = dbo.tblSalary.IDEmployee INNER JOIN
					  dbo.tblJob ON dbo.tblEmployee.IDJob = dbo.tblJob.IDJob AND dbo.tblJob.Chief=1
GROUP BY dbo.tblEmployee.SurName, dbo.tblEmployee.Name, dbo.tblEmployee.Fathername, dbo.tblSalary.Period

GO