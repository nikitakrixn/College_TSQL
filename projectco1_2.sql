/* ��������� ����� ������������� � ��������������� �� 5 ��������� */

UPDATE  tblEmployee
	SET HourlyRate = HourlyRate * 1.05
WHERE  (IDJob in (SELECT IDJob FROM tblJob WHERE Job='�������������' Or Chief=1))        