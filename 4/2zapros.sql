-- =========================================
-- Create table template
-- =========================================
USE [Ѕанк-63]
GO

IF OBJECT_ID('dbo.‘инансовыеќперации лиентов', 'U') IS NOT NULL
  DROP TABLE dbo.‘инансовыеќперации лиентов
GO

CREATE TABLE dbo.‘инансовыеќперации лиентов
(
	 одќперации bigint IDENTITY(1,1) NOT NULL, 
	 од лиента bigint NOT NULL, 
	“ипќперации int NOT NULL, 
	ƒатаќпераци datetime NOT NULL, 
	—умма Numeric(18,5) NOT NULL, 
	 од‘инансогоѕродукта л bigint NULL, 
    CONSTRAINT PK_ одќперации PRIMARY KEY ( одќперации)
)
GO
