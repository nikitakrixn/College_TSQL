Alter Table [dbo].[Сотрудники2]
Add Constraint FK_Должность_Сотрудники 
Foreign Key (Должность) references Должность2(id_должности);