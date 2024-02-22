CREATE TABLE [dbo].[Сотрудники2](
	[id_сотрудника] [bigint] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](60) NOT NULL,
	[Имя] [nvarchar](60) NOT NULL,
	[Отчество] [nvarchar](60) NOT NULL,
	[ДатаРождения] [date] NOT NULL,
	[Пол] [char](1) NOT NULL,
	[Адрес] [nvarchar](255) NOT NULL,
	PRIMARY KEY CLUSTERED ([id_сотрудника] ASC))