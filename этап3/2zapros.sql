Create Function KolZak()
Returns table
As
Return
(
	Select ������.���_������, ������.������������, Count(������.����������) As ����������
	From ������ inner join ������ on ������.���_������ = ������.���_������
	Where MONTH(������.����) = '4' AND YEAR(������.����) = '2017'
	GROUP BY ������.���_������, ������.������������
)
Go
Select *
From KolZak()