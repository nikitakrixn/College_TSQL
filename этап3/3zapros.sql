Create TRIGGER InsGr
	ON  dbo.группы
	FOR INSERT
AS
	PRINT 'Добавлена новая группа'