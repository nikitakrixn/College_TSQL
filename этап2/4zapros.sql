UPDATE dbo.телефоны
SET тип = '2'
Where (сотрудник in (SELECT [Код_сотрудника] from dbo.сотрудники Where [фамилия] = 'Долгих'))