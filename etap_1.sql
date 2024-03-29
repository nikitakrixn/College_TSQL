USE [master]
GO
/****** Object:  Database [Компания_Астра2]    Script Date: 11.05.2018 9:38:53 ******/
CREATE DATABASE [Компания_Астра2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Компания_Астра2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\Компания_Астра2.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Компания_Астра2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\Компания_Астра2_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Компания_Астра2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Компания_Астра2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Компания_Астра2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Компания_Астра2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Компания_Астра2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Компания_Астра2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Компания_Астра2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Компания_Астра2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Компания_Астра2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Компания_Астра2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Компания_Астра2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Компания_Астра2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Компания_Астра2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Компания_Астра2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Компания_Астра2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Компания_Астра2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Компания_Астра2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Компания_Астра2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Компания_Астра2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Компания_Астра2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Компания_Астра2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Компания_Астра2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Компания_Астра2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Компания_Астра2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Компания_Астра2] SET RECOVERY FULL 
GO
ALTER DATABASE [Компания_Астра2] SET  MULTI_USER 
GO
ALTER DATABASE [Компания_Астра2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Компания_Астра2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Компания_Астра2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Компания_Астра2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Компания_Астра2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Компания_Астра2', N'ON'
GO
USE [Компания_Астра2]
GO
/****** Object:  Table [dbo].[Должности]    Script Date: 11.05.2018 9:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должности](
	[id_должности] [bigint] IDENTITY(1,1) NOT NULL,
	[Должность] [nvarchar](40) NOT NULL,
	[Руководитель] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_должности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 11.05.2018 9:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[id_сотрудника] [bigint] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](60) NOT NULL,
	[Имя] [nvarchar](60) NOT NULL,
	[Отчество] [nvarchar](60) NOT NULL,
	[ДатаРождения] [date] NOT NULL,
	[Пол] [char](1) NOT NULL,
	[Адрес] [nvarchar](255) NOT NULL,
	[FK_должность] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Должности] ON 

INSERT [dbo].[Должности] ([id_должности], [Должность], [Руководитель]) VALUES (1, N'Генеральный директор', 1)
INSERT [dbo].[Должности] ([id_должности], [Должность], [Руководитель]) VALUES (2, N'Начальник отдела снабжения', 1)
INSERT [dbo].[Должности] ([id_должности], [Должность], [Руководитель]) VALUES (3, N'Продавец', 0)
INSERT [dbo].[Должности] ([id_должности], [Должность], [Руководитель]) VALUES (4, N'Кассир', 0)
SET IDENTITY_INSERT [dbo].[Должности] OFF
SET IDENTITY_INSERT [dbo].[Сотрудники] ON 

INSERT [dbo].[Сотрудники] ([id_сотрудника], [Фамилия], [Имя], [Отчество], [ДатаРождения], [Пол], [Адрес], [FK_должность]) VALUES (1, N'Иванов', N'Иван', N'Иванович', CAST(N'1970-05-20' AS Date), N'М', N'Ленина 10', 1)
INSERT [dbo].[Сотрудники] ([id_сотрудника], [Фамилия], [Имя], [Отчество], [ДатаРождения], [Пол], [Адрес], [FK_должность]) VALUES (2, N'Петров', N'Петр', N'Петрович', CAST(N'1969-10-15' AS Date), N'М', N'Мира 8', 2)
INSERT [dbo].[Сотрудники] ([id_сотрудника], [Фамилия], [Имя], [Отчество], [ДатаРождения], [Пол], [Адрес], [FK_должность]) VALUES (3, N'Смирнова', N'Наталья', N'Львовна', CAST(N'1999-09-02' AS Date), N'Ж', N'Жукова 7', 3)
INSERT [dbo].[Сотрудники] ([id_сотрудника], [Фамилия], [Имя], [Отчество], [ДатаРождения], [Пол], [Адрес], [FK_должность]) VALUES (4, N'Федорова', N'Ксения', N'Викторовна', CAST(N'1985-06-10' AS Date), N'Ж', N'Маркса 6', 4)
SET IDENTITY_INSERT [dbo].[Сотрудники] OFF
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_должность] FOREIGN KEY([FK_должность])
REFERENCES [dbo].[Должности] ([id_должности])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_должность]
GO
USE [master]
GO
ALTER DATABASE [Компания_Астра2] SET  READ_WRITE 
GO
