ALTER Trigger UpTov
	on dbo.товары
	After UPDATE
AS
	Begin
		INSERT INTO dbo.ТоварыИзменения(Код_товара,наименование,группа,единица,вес,цена,количество,дата_изменения) 
		Select d.Код_товара, d.наименование, d.группа, d.единица, d.вес, d.цена, d.количество, GETDATE()
		from deleted d
		Print 'Товар изменён!'
	End
