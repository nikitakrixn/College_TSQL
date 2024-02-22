Create Function KolZak()
Returns table
As
Return
(
	Select товары. од_товара, товары.наименование, Count(заказы.количество) As  оличество
	From товары inner join заказы on товары. од_товара = заказы.код_товара
	Where MONTH(заказы.дата) = '4' AND YEAR(заказы.дата) = '2017'
	GROUP BY товары. од_товара, товары.наименование
)
Go
Select *
From KolZak()