USE [master]
GO
/****** Object:  Database [Банк-63]    Script Date: 26.01.2018 13:04:59 ******/
CREATE DATABASE [Банк-63]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Банк-63', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\Банк-63.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Банк-63_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\Банк-63_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Клиенты]    Script Date: 26.01.2018 13:04:59 ******/
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
/****** Object:  Table [dbo].[ТипыОпераций]    Script Date: 26.01.2018 13:04:59 ******/
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
/****** Object:  Table [dbo].[ФинансовыеОперацииКлиентов]    Script Date: 26.01.2018 13:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ФинансовыеОперацииКлиентов](
	[КодОперации] [bigint] IDENTITY(1,1) NOT NULL,
	[КодКлиента] [bigint] NOT NULL,
	[ТипОперации] [int] NOT NULL,
	[ДатаОпераци] [datetime] NOT NULL,
	[Сумма] [numeric](18, 5) NOT NULL,
	[КодФинансогоПродуктаКл] [bigint] NULL,
 CONSTRAINT [PK_КодОперации] PRIMARY KEY CLUSTERED 
(
	[КодОперации] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ФинансовыеПрдуктыКлиентов]    Script Date: 26.01.2018 13:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ФинансовыеПрдуктыКлиентов](
	[КодФПрКл] [bigint] NOT NULL,
	[КодКлиента] [bigint] NOT NULL,
	[КодФинансПрод] [bigint] NOT NULL,
	[Сумма] [money] NOT NULL,
	[ТребДатаОплаты] [datetime] NOT NULL,
	[ДатаВнесПослПлатежа] [datetime] NOT NULL,
 CONSTRAINT [PK_Финансовые Прдукты Клиентв] PRIMARY KEY CLUSTERED 
(
	[КодФПрКл] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ФинансовыеПродукты]    Script Date: 26.01.2018 13:04:59 ******/
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
INSERT [dbo].[Клиенты] ([КодКлиента], [Фамилия], [ДрИнициаллы], [Имя], [Адрес], [ИдентБанкСчета], [ТекущСальдоСчёта], [ДатаОткрСчёта]) VALUES (1, N'Иванов', N'ИИ', N'Иван', N'Омск', N'76123          ', 1234.0000, CAST(N'2018-01-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Клиенты] ([КодКлиента], [Фамилия], [ДрИнициаллы], [Имя], [Адрес], [ИдентБанкСчета], [ТекущСальдоСчёта], [ДатаОткрСчёта]) VALUES (2, N'Петров', N'ПС', N'Саня', N'Омск', N'76124          ', 7891.0000, CAST(N'2018-01-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Клиенты] ([КодКлиента], [Фамилия], [ДрИнициаллы], [Имя], [Адрес], [ИдентБанкСчета], [ТекущСальдоСчёта], [ДатаОткрСчёта]) VALUES (3, N'Сидиров', N'СА', N'Андрей', N'Омск', N'76125          ', 98234.0000, CAST(N'2018-01-23 00:00:00.000' AS DateTime))
INSERT [dbo].[ФинансовыеПрдуктыКлиентов] ([КодФПрКл], [КодКлиента], [КодФинансПрод], [Сумма], [ТребДатаОплаты], [ДатаВнесПослПлатежа]) VALUES (1, 1, 1, 132.0000, CAST(N'2014-01-21 00:00:00.000' AS DateTime), CAST(N'2038-03-21 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ФинансовыеПродукты] ON 

INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (1, N'Ссуда')
INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (2, N'Кредит')
INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (3, N'Займ')
INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (4, N'ИпотекаЖилищ')
INSERT [dbo].[ФинансовыеПродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (5, N'ДогАвтоСтрах')
SET IDENTITY_INSERT [dbo].[ФинансовыеПродукты] OFF
ALTER TABLE [dbo].[ФинансовыеОперацииКлиентов] ADD  CONSTRAINT [ФОпКЛ_ДатаОпер]  DEFAULT (getdate()) FOR [ДатаОпераци]
GO
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
ALTER TABLE [dbo].[ФинансовыеОперацииКлиентов]  WITH CHECK ADD  CONSTRAINT [FK_ФинансовыеОперацииКлиентов_ФинансовыеПрдуктыКлиентов] FOREIGN KEY([КодКлиента])
REFERENCES [dbo].[ФинансовыеПрдуктыКлиентов] ([КодФПрКл])
GO
ALTER TABLE [dbo].[ФинансовыеОперацииКлиентов] CHECK CONSTRAINT [FK_ФинансовыеОперацииКлиентов_ФинансовыеПрдуктыКлиентов]
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов]  WITH CHECK ADD  CONSTRAINT [FK_Финансовые Прдукты Клиентв_Клиенты] FOREIGN KEY([КодКлиента])
REFERENCES [dbo].[Клиенты] ([КодКлиента])
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов] CHECK CONSTRAINT [FK_Финансовые Прдукты Клиентв_Клиенты]
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов]  WITH CHECK ADD  CONSTRAINT [FK_Финансовые Прдукты Клиентв_Финансовые продукты] FOREIGN KEY([КодФинансПрод])
REFERENCES [dbo].[ФинансовыеПродукты] ([КодПродукта])
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов] CHECK CONSTRAINT [FK_Финансовые Прдукты Клиентв_Финансовые продукты]
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
