/* ѕредставление отображает информацию о фактической трудоемкости (количество потраченных часов) проектов 
 по периодам  */

ALTER VIEW [dbo].[vwProjectWorking]
AS
SELECT      dbo.tblProject.ProjectName, dbo.tblProjectWorking.Period, SUM(dbo.tblProjectWorking.Hours) AS Hours
FROM         dbo.tblCustomer INNER JOIN
                      dbo.tblProject ON dbo.tblCustomer.IDCustomer = dbo.tblProject.IDCustomer INNER JOIN
                      dbo.tblProjectWorking ON dbo.tblProject.IDProject = dbo.tblProjectWorking.IDProject
GROUP BY dbo.tblProject.ProjectName, dbo.tblProjectWorking.Period
GO