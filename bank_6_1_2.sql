USE [master]
GO
/****** Object:  Database [Банк-63]    Script Date: 09.03.2018 12:59:19 ******/
CREATE DATABASE [Банк-63]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Банк-63', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Банк-63.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Банк-63_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Банк-63_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Банк-63] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Банк-63].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Банк-63] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Банк-63] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Банк-63] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Банк-63] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Банк-63] SET ARITHABORT OFF 
GO
ALTER DATABASE [Банк-63] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Банк-63] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Банк-63] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Банк-63] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Банк-63] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Банк-63] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Банк-63] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Банк-63] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Банк-63] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Банк-63] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Банк-63] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Банк-63] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Банк-63] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Банк-63] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Банк-63] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Банк-63] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Банк-63] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Банк-63] SET RECOVERY FULL 
GO
ALTER DATABASE [Банк-63] SET  MULTI_USER 
GO
ALTER DATABASE [Банк-63] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Банк-63] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Банк-63] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Банк-63] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Банк-63] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Банк-63', N'ON'
GO
USE [Банк-63]
GO
/****** Object:  Table [dbo].[БалансыКлиентов]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[БалансыКлиентов](
	[КодКлиента] [bigint] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[ТекущСальдоСчёта] [money] NOT NULL,
 CONSTRAINT [PK_БалансыКлиентов] PRIMARY KEY CLUSTERED 
(
	[КодКлиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[КодКлиента] [bigint] NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[ДрИнициаллы] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
	[ИдентБанкСчета] [nchar](15) NOT NULL,
	[ТекущСальдоСчёта] [money] NOT NULL,
	[ДатаОткрСчёта] [datetime] NOT NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[КодКлиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ТипыОпераций]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТипыОпераций](
	[КодТипа] [int] IDENTITY(1,1) NOT NULL,
	[ОписаниеОперации] [nvarchar](50) NOT NULL,
	[ТипКредитаДебета] [bit] NOT NULL,
	[ВлияниеОперацийНаБаланс] [bit] NOT NULL,
 CONSTRAINT [PK_ТипыОпераций] PRIMARY KEY CLUSTERED 
(
	[КодТипа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ФинансовыеОперацииКлиентов]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ФинансовыеОперацииКлиентов](
	[КодОперации] [bigint] IDENTITY(1,1) NOT NULL,
	[КодКлиента] [bigint] NOT NULL,
	[ТипОперации] [int] NOT NULL,
	[ДатаОперации] [datetime] NOT NULL CONSTRAINT [ФОпКЛ_ДатаОпер]  DEFAULT (getdate()),
	[Сумма] [numeric](18, 5) NOT NULL,
	[КодФинансогоПродуктаКл] [bigint] NULL,
 CONSTRAINT [PK_КодОперации] PRIMARY KEY CLUSTERED 
(
	[КодОперации] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ФинансовыеПрдуктыКлиентов]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ФинансовыеПрдуктыКлиентов](
	[КодФПрКл] [bigint] IDENTITY(1,1) NOT NULL,
	[КодКлиента] [bigint] NOT NULL,
	[КодФинансПрод] [bigint] NOT NULL,
	[Сумма] [money] NOT NULL,
	[ЧастотаПлатежа] [nchar](10) NULL,
	[ТребДатаОплаты] [datetime] NOT NULL,
	[ДатаВнесПослПлатежа] [datetime] NULL,
 CONSTRAINT [PK_Финансовые Прдукты Клиентв] PRIMARY KEY CLUSTERED 
(
	[КодФПрКл] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ФинансовыеПродукты]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ФинансовыеПродукты](
	[КодПродукта] [bigint] IDENTITY(1,1) NOT NULL,
	[НазваниеПродукта] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Финансовые продукты] PRIMARY KEY CLUSTERED 
(
	[КодПродукта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[КоличТранза]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[КоличТранза]
AS
Select	dbo.Клиенты.КодКлиента,dbo.Клиенты.Фамилия,dbo.Клиенты.Имя,
		COUNT(dbo.ФинансовыеОперацииКлиентов.КодОперации) AS КолТранзакций
FROM	(dbo.Клиенты INNER JOIN dbo.ФинансовыеОперацииКлиентов ON dbo.Клиенты.КодКлиента = dbo.ФинансовыеОперацииКлиентов.КодКлиента) 
		INNER JOIN dbo.ТипыОпераций ON dbo.ФинансовыеОперацииКлиентов.ТипОперации = dbo.ТипыОпераций.КодТипа
Group by dbo.Клиенты.КодКлиента,dbo.Клиенты.Фамилия,dbo.Клиенты.Имя



GO
/****** Object:  View [dbo].[РейтингКлиентов]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[РейтингКлиентов]
AS
Select	dbo.Клиенты.КодКлиента,dbo.Клиенты.Фамилия,dbo.Клиенты.Имя,
		COUNT(dbo.ФинансовыеПрдуктыКлиентов.КодФинансПрод) AS КолФинансУслуг
FROM	(dbo.Клиенты INNER JOIN dbo.ФинансовыеПрдуктыКлиентов ON dbo.Клиенты.КодКлиента = dbo.ФинансовыеПрдуктыКлиентов.КодКлиента) 
		INNER JOIN dbo.ФинансовыеПродукты ON dbo.ФинансовыеПрдуктыКлиентов.КодФинансПрод = dbo.ФинансовыеПродукты.КодПродукта
Group by dbo.Клиенты.КодКлиента,dbo.Клиенты.Фамилия,dbo.Клиенты.Имя


GO
/****** Object:  View [dbo].[РейтингФинансПродукт]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[РейтингФинансПродукт]
AS
Select dbo.ФинансовыеПродукты.НазваниеПродукта,
		COUNT(dbo.Клиенты.КодКлиента) AS КолКлиентов
FROM	(dbo.Клиенты INNER JOIN dbo.ФинансовыеПрдуктыКлиентов ON dbo.Клиенты.КодКлиента = dbo.ФинансовыеПрдуктыКлиентов.КодКлиента) 
		INNER JOIN dbo.ФинансовыеПродукты ON dbo.ФинансовыеПрдуктыКлиентов.КодФинансПрод = dbo.ФинансовыеПродукты.КодПродукта
Group by dbo.ФинансовыеПродукты.НазваниеПродукта

GO
/****** Object:  View [dbo].[СписокКлИмБолееОднФинаПроду]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[СписокКлИмБолееОднФинаПроду]
AS
Select	dbo.Клиенты.КодКлиента,dbo.Клиенты.Фамилия,dbo.Клиенты.Имя,
		(SELECT COUNT(*) FROM ФинансовыеПрдуктыКлиентов WHERE КодФинансПрод = 2)
		 AS КолФинансУслуг
FROM	(dbo.Клиенты INNER JOIN dbo.ФинансовыеПрдуктыКлиентов ON dbo.Клиенты.КодКлиента = dbo.ФинансовыеПрдуктыКлиентов.КодКлиента) 
Group by dbo.Клиенты.КодКлиента,dbo.Клиенты.Фамилия,dbo.Клиенты.Имя
GO
/****** Object:  View [dbo].[СписокКлНеИмеюТранз]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[СписокКлНеИмеюТранз]
AS
Select	dbo.Клиенты.КодКлиента,dbo.Клиенты.Фамилия,dbo.Клиенты.Имя
		
FROM	dbo.Клиенты 
Where dbo.Клиенты.КодКлиента NOT IN (SELECT DISTINCT КодКлиента FROm dbo.ФинансовыеОперацииКлиентов)
GO
/****** Object:  View [dbo].[СписоктекущКлиентов]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[СписоктекущКлиентов]
AS
Select	dbo.Клиенты.Фамилия + ' ' + dbo.Клиенты.Имя AS Фио, 
		dbo.ТипыОпераций.ОписаниеОперации, 
		dbo.ФинансовыеОперацииКлиентов.ДатаОперации, 
		dbo.ФинансовыеОперацииКлиентов.Сумма
FROM	(dbo.Клиенты INNER JOIN dbo.ФинансовыеОперацииКлиентов ON dbo.Клиенты.КодКлиента = dbo.ФинансовыеОперацииКлиентов.КодКлиента) 
		INNER JOIN dbo.ТипыОпераций ON dbo.ФинансовыеОперацииКлиентов.ТипОперации = dbo.ТипыОпераций.КодТипа
Where	(DATEPART(mm, dbo.ФинансовыеОперацииКлиентов.ДатаОперации) = DATEPART(mm, getdate()))
		AND (DATEPART(yyyy,dbo.ФинансовыеОперацииКлиентов.ДатаОперации) = DATEPART(yyyy, getdate()))


GO
/****** Object:  View [dbo].[ФинансПродКлиент]    Script Date: 09.03.2018 12:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[ФинансПродКлиент]
AS
Select	dbo.Клиенты.Фамилия + ' ' + dbo.Клиенты.Имя AS Фио,
		dbo.ФинансовыеПродукты.НазваниеПродукта,
		dbo.ФинансовыеПрдуктыКлиентов.Сумма
FROM	(dbo.Клиенты INNER JOIN dbo.ФинансовыеПрдуктыКлиентов ON dbo.Клиенты.КодКлиента = dbo.ФинансовыеПрдуктыКлиентов.КодКлиента) 
		INNER JOIN dbo.ФинансовыеПродукты ON dbo.ФинансовыеПрдуктыКлиентов.КодФинансПрод = dbo.ФинансовыеПродукты.КодПродукта


GO
SET IDENTITY_INSERT [dbo].[БалансыКлиентов] ON 

INSERT [dbo].[БалансыКлиентов] ([КодКлиента], [Фамилия], [Имя], [ТекущСальдоСчёта]) VALUES (1, N'Иванов', N'Иван', 212.0000)
INSERT [dbo].[БалансыКлиентов] ([КодКлиента], [Фамилия], [Имя], [ТекущСальдоСчёта]) VALUES (2, N'Петров', N'Петя', 12345.0000)
INSERT [dbo].[БалансыКлиентов] ([КодКлиента], [Фамилия], [Имя], [ТекущСальдоСчёта]) VALUES (3, N'Кузнецов', N'Александр', 572.0000)
SET IDENTITY_INSERT [dbo].[БалансыКлиентов] OFF
INSERT [dbo].[Клиенты] ([КодКлиента], [Фамилия], [ДрИнициаллы], [Имя], [Адрес], [ИдентБанкСчета], [ТекущСальдоСчёта], [ДатаОткрСчёта]) VALUES (2, N'Петров', N'ПП', N'Петя', N'Омск', N'12345          ', 12345.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Клиенты] ([КодКлиента], [Фамилия], [ДрИнициаллы], [Имя], [Адрес], [ИдентБанкСчета], [ТекущСальдоСчёта], [ДатаОткрСчёта]) VALUES (4, N'Юрьевич', N'АА', N'Павел', N'Омск', N'123            ', 0.0000, CAST(N'2018-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Клиенты] ([КодКлиента], [Фамилия], [ДрИнициаллы], [Имя], [Адрес], [ИдентБанкСчета], [ТекущСальдоСчёта], [ДатаОткрСчёта]) VALUES (5, N'Савельев', N'ТП', N'Даниил', N'Омск', N'67980          ', 0.0000, CAST(N'2018-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Клиенты] ([КодКлиента], [Фамилия], [ДрИнициаллы], [Имя], [Адрес], [ИдентБанкСчета], [ТекущСальдоСчёта], [ДатаОткрСчёта]) VALUES (6, N'Атюшов', N'АА', N'Петя', N'Омск', N'132123         ', 123.0000, CAST(N'2018-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Клиенты] ([КодКлиента], [Фамилия], [ДрИнициаллы], [Имя], [Адрес], [ИдентБанкСчета], [ТекущСальдоСчёта], [ДатаОткрСчёта]) VALUES (7, N'Привет', N'АА', N'Андрей', N'Омск', N'123            ', 123.0000, CAST(N'2018-02-03 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ТипыОпераций] ON 

INSERT [dbo].[ТипыОпераций] ([КодТипа], [ОписаниеОперации], [ТипКредитаДебета], [ВлияниеОперацийНаБаланс]) VALUES (2, N'Ввод', 1, 1)
INSERT [dbo].[ТипыОпераций] ([КодТипа], [ОписаниеОперации], [ТипКредитаДебета], [ВлияниеОперацийНаБаланс]) VALUES (4, N'Вывод', 1, 1)
INSERT [dbo].[ТипыОпераций] ([КодТипа], [ОписаниеОперации], [ТипКредитаДебета], [ВлияниеОперацийНаБаланс]) VALUES (5, N'Депозит', 1, 1)
INSERT [dbo].[ТипыОпераций] ([КодТипа], [ОписаниеОперации], [ТипКредитаДебета], [ВлияниеОперацийНаБаланс]) VALUES (6, N'Снятие', 0, 1)
INSERT [dbo].[ТипыОпераций] ([КодТипа], [ОписаниеОперации], [ТипКредитаДебета], [ВлияниеОперацийНаБаланс]) VALUES (7, N'ПокупкаАкций', 1, 0)
SET IDENTITY_INSERT [dbo].[ТипыОпераций] OFF
SET IDENTITY_INSERT [dbo].[ФинансовыеОперацииКлиентов] ON 

INSERT [dbo].[ФинансовыеОперацииКлиентов] ([КодОперации], [КодКлиента], [ТипОперации], [ДатаОперации], [Сумма], [КодФинансогоПродуктаКл]) VALUES (18, 2, 4, CAST(N'2018-02-03 00:00:00.000' AS DateTime), CAST(1000.00000 AS Numeric(18, 5)), NULL)
INSERT [dbo].[ФинансовыеОперацииКлиентов] ([КодОперации], [КодКлиента], [ТипОперации], [ДатаОперации], [Сумма], [КодФинансогоПродуктаКл]) VALUES (19, 2, 6, CAST(N'2018-02-03 00:00:00.000' AS DateTime), CAST(400.00000 AS Numeric(18, 5)), NULL)
INSERT [dbo].[ФинансовыеОперацииКлиентов] ([КодОперации], [КодКлиента], [ТипОперации], [ДатаОперации], [Сумма], [КодФинансогоПродуктаКл]) VALUES (20, 4, 5, CAST(N'2018-02-02 12:32:32.897' AS DateTime), CAST(500.00000 AS Numeric(18, 5)), NULL)
INSERT [dbo].[ФинансовыеОперацииКлиентов] ([КодОперации], [КодКлиента], [ТипОперации], [ДатаОперации], [Сумма], [КодФинансогоПродуктаКл]) VALUES (23, 5, 2, CAST(N'2018-02-03 00:00:00.000' AS DateTime), CAST(123123123.00000 AS Numeric(18, 5)), NULL)
SET IDENTITY_INSERT [dbo].[ФинансовыеОперацииКлиентов] OFF
SET IDENTITY_INSERT [dbo].[ФинансовыеПрдуктыКлиентов] ON 

INSERT [dbo].[ФинансовыеПрдуктыКлиентов] ([КодФПрКл], [КодКлиента], [КодФинансПрод], [Сумма], [ЧастотаПлатежа], [ТребДатаОплаты], [ДатаВнесПослПлатежа]) VALUES (1, 2, 2, 8000.0000, NULL, CAST(N'2016-02-01 00:00:00.000' AS DateTime), CAST(N'2016-02-11 00:00:00.000' AS DateTime))
INSERT [dbo].[ФинансовыеПрдуктыКлиентов] ([КодФПрКл], [КодКлиента], [КодФинансПрод], [Сумма], [ЧастотаПлатежа], [ТребДатаОплаты], [ДатаВнесПослПлатежа]) VALUES (2, 4, 4, 2000.0000, NULL, CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2015-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[ФинансовыеПрдуктыКлиентов] ([КодФПрКл], [КодКлиента], [КодФинансПрод], [Сумма], [ЧастотаПлатежа], [ТребДатаОплаты], [ДатаВнесПослПлатежа]) VALUES (16, 2, 3, 22222.0000, NULL, CAST(N'2016-02-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ФинансовыеПрдуктыКлиентов] ([КодФПрКл], [КодКлиента], [КодФинансПрод], [Сумма], [ЧастотаПлатежа], [ТребДатаОплаты], [ДатаВнесПослПлатежа]) VALUES (17, 4, 2, 123213.0000, NULL, CAST(N'2017-01-02 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ФинансовыеПрдуктыКлиентов] ([КодФПрКл], [КодКлиента], [КодФинансПрод], [Сумма], [ЧастотаПлатежа], [ТребДатаОплаты], [ДатаВнесПослПлатежа]) VALUES (21, 5, 4, 4123.0000, NULL, CAST(N'2016-01-02 00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ФинансовыеПрдуктыКлиентов] OFF
SET IDENTITY_INSERT [dbo].[ФинансовыеПродукты] ON 

INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (1, N'Ссуда')
INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (2, N'Кредит')
INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (3, N'Займ')
INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (4, N'ИпотекаЖилищ')
INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (5, N'ДогАвтоСтрах')
INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (6, N'ИпотекаЖилищ')
INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (7, N'ДогАвтоСтрах')
SET IDENTITY_INSERT [dbo].[ФинансовыеПродукты] OFF
ALTER TABLE [dbo].[ФинансовыеОперацииКлиентов]  WITH CHECK ADD  CONSTRAINT [FK_ФинансовыеОперацииКлиентов_Клиенты] FOREIGN KEY([КодКлиента])
REFERENCES [dbo].[Клиенты] ([КодКлиента])
GO
ALTER TABLE [dbo].[ФинансовыеОперацииКлиентов] CHECK CONSTRAINT [FK_ФинансовыеОперацииКлиентов_Клиенты]
GO
ALTER TABLE [dbo].[ФинансовыеОперацииКлиентов]  WITH CHECK ADD  CONSTRAINT [FK_ФинансовыеОперацииКлиентов_ТипыОпераций] FOREIGN KEY([ТипОперации])
REFERENCES [dbo].[ТипыОпераций] ([КодТипа])
GO
ALTER TABLE [dbo].[ФинансовыеОперацииКлиентов] CHECK CONSTRAINT [FK_ФинансовыеОперацииКлиентов_ТипыОпераций]
GO
ALTER TABLE [dbo].[ФинансовыеОперацииКлиентов]  WITH CHECK ADD  CONSTRAINT [FK_ФинансовыеОперацииКлиентов_ФинансовыеПрдуктыКлиентов] FOREIGN KEY([КодФинансогоПродуктаКл])
REFERENCES [dbo].[ФинансовыеПрдуктыКлиентов] ([КодФПрКл])
GO
ALTER TABLE [dbo].[ФинансовыеОперацииКлиентов] CHECK CONSTRAINT [FK_ФинансовыеОперацииКлиентов_ФинансовыеПрдуктыКлиентов]
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов]  WITH CHECK ADD  CONSTRAINT [FK_ФинансовыеПрдуктыКлиентов_Клиенты] FOREIGN KEY([КодКлиента])
REFERENCES [dbo].[Клиенты] ([КодКлиента])
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов] CHECK CONSTRAINT [FK_ФинансовыеПрдуктыКлиентов_Клиенты]
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов]  WITH CHECK ADD  CONSTRAINT [FK_ФинансовыеПрдуктыКлиентов_ФинансовыеПродукты] FOREIGN KEY([КодФинансПрод])
REFERENCES [dbo].[ФинансовыеПродукты] ([КодПродукта])
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов] CHECK CONSTRAINT [FK_ФинансовыеПрдуктыКлиентов_ФинансовыеПродукты]
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов]  WITH CHECK ADD  CONSTRAINT [CK_Финансовые Прдукты Клиентв] CHECK  (([Сумма]>=(0)))
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов] CHECK CONSTRAINT [CK_Финансовые Прдукты Клиентв]
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов]  WITH NOCHECK ADD  CONSTRAINT [ФПРКЛ_ПроверкаДат] CHECK  (([ДатаВнесПослПлатежа]>=[ТребДатаОплаты]))
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов] CHECK CONSTRAINT [ФПРКЛ_ПроверкаДат]
GO
USE [master]
GO
ALTER DATABASE [Банк-63] SET  READ_WRITE 
GO
