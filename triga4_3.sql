Create Trigger u_Клиенты
	on dbo.Клиенты
	AFTER DELETE
AS
	Begin
		INSERT INTO dbo.Test1(Номер_записи, Действие) VALUES (default,'Удалена категория')
		SELECT d.код_клиента
		FROM deleted d
		PRINT 'Удалена 1 запись из таблицы'
	END