-- =========================================
-- Create table template
-- =========================================
USE [����-63]
GO

IF OBJECT_ID('dbo.��������������������������', 'U') IS NOT NULL
  DROP TABLE dbo.��������������������������
GO

CREATE TABLE dbo.��������������������������
(
	����������� bigint IDENTITY(1,1) NOT NULL, 
	���������� bigint NOT NULL, 
	����������� int NOT NULL, 
	����������� datetime NOT NULL, 
	����� Numeric(18,5) NOT NULL, 
	���������������������� bigint NULL, 
    CONSTRAINT PK_����������� PRIMARY KEY (�����������)
)
GO
