ALTER TRIGGER u_Товары
	ON  dbo.Товары
	FOR INSERT,UPDATE
AS
IF UPDATE(Код_товара)
	PRINT 'ТОВАР ДОБАВЛЕН'
