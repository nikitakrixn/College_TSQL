Create trigger DelDeti
	on dbo.дети
	For delete
As
	IF EXISTS (SELECT *
	        FROM deleted)
BEGIN
   PRINT 'Удалять нельзя!'
   ROLLBACK TRANSACTION
END