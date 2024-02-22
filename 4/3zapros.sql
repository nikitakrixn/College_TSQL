Use [Банк-63]
Go
Alter Table dbo.ФинансовыеПрдуктыКлиентов
With NOCHECK Add CONSTRAINT [ФПРКЛ_ПроверкаДат]
CHECK (ДатаВнесПослПлатежа >= ТребДатаОплаты)
Go 
Alter Table dbo.ФинансовыеПрдуктыКлиентов
CHECK CONSTRAINT [ФПРКЛ_ПроверкаДат]
Go