USE [master]
GO
/****** Object:  Database [Банк-63]    Script Date: 24.01.2018 11:52:32 ******/
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
/****** Object:  Table [dbo].[Клиенты]    Script Date: 24.01.2018 11:52:32 ******/
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
/****** Object:  Table [dbo].[ФинансовыеПрдуктыКлиентов]    Script Date: 24.01.2018 11:52:32 ******/
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
/****** Object:  Table [dbo].[Финансовыепродукты]    Script Date: 24.01.2018 11:52:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Финансовыепродукты](
	[КодПродукта] [bigint] NOT NULL,
	[НазваниеПродукта] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Финансовые продукты] PRIMARY KEY CLUSTERED 
(
	[КодПродукта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Клиенты] ([КодКлиента], [Фамилия], [ДрИнициаллы], [Имя], [Адрес], [ИдентБанкСчета], [ТекущСальдоСчёта], [ДатаОткрСчёта]) VALUES (1, N'Иванов', N'АА', N'Александр', N'Омск', N'12345          ', 10.0000, CAST(N'2018-01-23 00:00:00.000' AS DateTime))
INSERT [dbo].[ФинансовыеПрдуктыКлиентов] ([КодФПрКл], [КодКлиента], [КодФинансПрод], [Сумма], [ТребДатаОплаты], [ДатаВнесПослПлатежа]) VALUES (1, 1, 1, 500.0000, CAST(N'2018-01-24 00:00:00.000' AS DateTime), CAST(N'2018-01-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Финансовыепродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (1, N'Ссуда')
INSERT [dbo].[Финансовыепродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (2, N'Кредит')
INSERT [dbo].[Финансовыепродукты] ([КодПродукта], [НазваниеПродукта]) VALUES (3, N'Займ')
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов]  WITH CHECK ADD  CONSTRAINT [FK_Финансовые Прдукты Клиентв_Клиенты] FOREIGN KEY([КодКлиента])
REFERENCES [dbo].[Клиенты] ([КодКлиента])
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов] CHECK CONSTRAINT [FK_Финансовые Прдукты Клиентв_Клиенты]
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов]  WITH CHECK ADD  CONSTRAINT [FK_Финансовые Прдукты Клиентв_Финансовые продукты] FOREIGN KEY([КодФинансПрод])
REFERENCES [dbo].[Финансовыепродукты] ([КодПродукта])
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов] CHECK CONSTRAINT [FK_Финансовые Прдукты Клиентв_Финансовые продукты]
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов]  WITH CHECK ADD  CONSTRAINT [CK_Финансовые Прдукты Клиентв] CHECK  (([Сумма]>=(0)))
GO
ALTER TABLE [dbo].[ФинансовыеПрдуктыКлиентов] CHECK CONSTRAINT [CK_Финансовые Прдукты Клиентв]
GO
USE [master]
GO
ALTER DATABASE [Банк-63] SET  READ_WRITE 
GO
