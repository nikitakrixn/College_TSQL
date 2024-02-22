Alter Function KolTov()
Returns Table
AS
Return
(
	Select товары.наименование, sum(заказы.количество) as  оличество
	From товары inner join заказы on товары. од_товара = заказы.код_товара
	Where товары. од_товара = 17
	Group by товары.наименование
)
Go
Select *
From KolTov()