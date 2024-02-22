CREATE TABLE [dbo].[КлиентыМесяца](
	[Код_клиента] int IDENTITY(1,1) NOT NULL,
	[Название] nvarchar(50) NOT NULL,
	CONSTRAINT [PK_КлиентыМесяца] PRIMARY KEY CLUSTERED (Код_клиента))
Go
