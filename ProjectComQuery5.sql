/* ѕредставление отображает информацию сотрудников которые работают над проектом */
USE [ProjectsCompany]
GO

CREATE VIEW [dbo].[vwEmployeeProjectWorking]
AS
SELECT     dbo.tblProject.ProjectName, dbo.tblEmployee.SurName, dbo.tblEmployee.Name, dbo.tblEmployee.Fathername, dbo.tblJob.Job
FROM         dbo.tblProjectWorking INNER JOIN
                      dbo.tblEmployee ON dbo.tblProjectWorking.IDEmployee = dbo.tblEmployee.IDEmployee INNER JOIN
                      dbo.tblJob ON dbo.tblEmployee.IDJob = dbo.tblJob.IDJob INNER JOIN
                      dbo.tblProject ON dbo.tblProjectWorking.IDProject = dbo.tblProject.IDProject

GO

/* ѕредставление отображает информацию о заработной плате сотрудникам, вид начеслени€ и сумму по периодам */

CREATE VIEW [dbo].[vwEmployeeSalary]
AS
SELECT     dbo.tblSalary.Period, dbo.tblSalary.SalarySum, dbo.tblEmployee.SurName, dbo.tblEmployee.Name, dbo.tblEmployee.Fathername, dbo.tblKindCalculation.KindCalculationName
FROM         dbo.tblEmployee INNER JOIN
                      dbo.tblSalary ON dbo.tblEmployee.IDEmployee = dbo.tblSalary.IDEmployee INNER JOIN
                      dbo.tblKindCalculation ON dbo.tblSalary.IDKindCalculation = dbo.tblKindCalculation.IDKindCalculation

GO

