Create Trigger u_�������
	on dbo.�������
	AFTER DELETE
AS
	Begin
		INSERT INTO dbo.Test1(�����_������, ��������) VALUES (default,'������� ���������')
		SELECT d.���_�������
		FROM deleted d
		PRINT '������� 1 ������ �� �������'
	END