Alter Function KolTov()
Returns Table
AS
Return
(
	Select ������.������������, sum(������.����������) as ����������
	From ������ inner join ������ on ������.���_������ = ������.���_������
	Where ������.���_������ = 17
	Group by ������.������������
)
Go
Select *
From KolTov()