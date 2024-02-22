CREATE TRIGGER u_Сотрудники
	ON  dbo.Сотрудники
	FOR UPDATE
AS
IF UPDATE(Должность)
	Insert into Test (Должность)
	Select d.Должность
	From deleted d
