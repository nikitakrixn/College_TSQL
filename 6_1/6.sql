Alter view —писок лЌе»мею“ранз
AS
Select	dbo. лиенты. од лиента,dbo. лиенты.‘амили€,dbo. лиенты.»м€
		
FROM	dbo. лиенты 
Where dbo. лиенты. од лиента NOT IN (SELECT DISTINCT  од лиента FROm dbo.‘инансовыеќперации лиентов)