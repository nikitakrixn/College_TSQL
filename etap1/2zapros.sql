CREATE TABLE [dbo].[Должности2](
	[id_должности] [bigint] IDENTITY(1,1) NOT NULL,
	[Должность] [nvarchar](40) NOT NULL,
	[Руководитель] [bit] NOT NULL,
PRIMARY KEY CLUSTERED ([id_должности] ASC))