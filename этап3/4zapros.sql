Create trigger DelDeti
	on dbo.����
	For delete
As
	IF EXISTS (SELECT *
	        FROM deleted)
BEGIN
   PRINT '������� ������!'
   ROLLBACK TRANSACTION
END