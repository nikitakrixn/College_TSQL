ALTER Trigger UpTov
	on dbo.������
	After UPDATE
AS
	Begin
		INSERT INTO dbo.���������������(���_������,������������,������,�������,���,����,����������,����_���������) 
		Select d.���_������, d.������������, d.������, d.�������, d.���, d.����, d.����������, GETDATE()
		from deleted d
		Print '����� ������!'
	End
