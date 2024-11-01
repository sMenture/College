USE [master]
GO
/****** Object:  Database [ЗаявкиНаРемонтКажаров]    Script Date: 01.10.2024 9:23:29 ******/
CREATE DATABASE [ЗаявкиНаРемонтКажаров]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ЗаявкиНаРемонтКажаров', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL\MSSQL\DATA\ЗаявкиНаРемонтКажаров.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ЗаявкиНаРемонтКажаров_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL\MSSQL\DATA\ЗаявкиНаРемонтКажаров_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ЗаявкиНаРемонтКажаров].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET ARITHABORT OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET RECOVERY FULL 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET  MULTI_USER 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ЗаявкиНаРемонтКажаров', N'ON'
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET QUERY_STORE = ON
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ЗаявкиНаРемонтКажаров]
GO
/****** Object:  Table [dbo].[Детали]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Детали](
	[ДеталиID] [int] IDENTITY(1,1) NOT NULL,
	[НазваниеДетали] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ДеталиID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЖурналИзменений]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЖурналИзменений](
	[ЖурналID] [int] IDENTITY(1,1) NOT NULL,
	[НомерЗаявки] [int] NOT NULL,
	[Операция] [nvarchar](300) NOT NULL,
	[Создан] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ЖурналID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Запчасти]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Запчасти](
	[ЗапчастьID] [int] IDENTITY(1,1) NOT NULL,
	[ОбъектID] [int] NOT NULL,
	[Количество] [int] NOT NULL,
	[ДетальID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ЗапчастьID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявки]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки](
	[ЗаявкаID] [int] IDENTITY(1,1) NOT NULL,
	[НомерЗаявки] [int] NOT NULL,
	[КлиентID] [int] NOT NULL,
	[МастерID] [int] NULL,
	[СтатусID] [int] NOT NULL,
	[ДатаНачала] [date] NOT NULL,
	[ДатаОкончания] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ЗаявкаID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЛогиныПароли]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЛогиныПароли](
	[ПользовательID] [int] NOT NULL,
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ПользовательID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[МоделиОбъектов]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[МоделиОбъектов](
	[МодельID] [int] IDENTITY(1,1) NOT NULL,
	[НазваниеМодели] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[МодельID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Объекты]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Объекты](
	[ОбъектID] [int] IDENTITY(1,1) NOT NULL,
	[НомерЗаявки] [int] NOT NULL,
	[ТипID] [int] NOT NULL,
	[МодельID] [int] NOT NULL,
	[Описание] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ОбъектID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[ПользовательID] [int] IDENTITY(1,1) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NULL,
	[НомерТелефона] [nvarchar](20) NOT NULL,
	[РольID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ПользовательID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[РольID] [int] IDENTITY(1,1) NOT NULL,
	[НазваниеРоли] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[РольID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статусы]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статусы](
	[СтатусID] [int] IDENTITY(1,1) NOT NULL,
	[НазваниеСтатуса] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[СтатусID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТипыОбъектов]    Script Date: 01.10.2024 9:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТипыОбъектов](
	[ТипID] [int] IDENTITY(1,1) NOT NULL,
	[НазваниеТипа] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ТипID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Детали] ON 

INSERT [dbo].[Детали] ([ДеталиID], [НазваниеДетали]) VALUES (1, N'Термопаста')
SET IDENTITY_INSERT [dbo].[Детали] OFF
GO
SET IDENTITY_INSERT [dbo].[ЖурналИзменений] ON 

INSERT [dbo].[ЖурналИзменений] ([ЖурналID], [НомерЗаявки], [Операция], [Создан]) VALUES (7, 1, N'Заявка добавлена ', CAST(N'2024-09-26T17:53:26.130' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([ЖурналID], [НомерЗаявки], [Операция], [Создан]) VALUES (8, 1, N'Заявка добавлена ', CAST(N'2024-09-26T18:54:59.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[ЖурналИзменений] OFF
GO
SET IDENTITY_INSERT [dbo].[Запчасти] ON 

INSERT [dbo].[Запчасти] ([ЗапчастьID], [ОбъектID], [Количество], [ДетальID]) VALUES (1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Запчасти] OFF
GO
SET IDENTITY_INSERT [dbo].[Заявки] ON 

INSERT [dbo].[Заявки] ([ЗаявкаID], [НомерЗаявки], [КлиентID], [МастерID], [СтатусID], [ДатаНачала], [ДатаОкончания]) VALUES (1, 1, 7, 2, 2, CAST(N'2023-06-06' AS Date), NULL)
INSERT [dbo].[Заявки] ([ЗаявкаID], [НомерЗаявки], [КлиентID], [МастерID], [СтатусID], [ДатаНачала], [ДатаОкончания]) VALUES (2, 2, 8, 3, 2, CAST(N'2023-05-05' AS Date), NULL)
INSERT [dbo].[Заявки] ([ЗаявкаID], [НомерЗаявки], [КлиентID], [МастерID], [СтатусID], [ДатаНачала], [ДатаОкончания]) VALUES (3, 3, 9, 3, 3, CAST(N'2022-07-07' AS Date), CAST(N'2023-01-01' AS Date))
INSERT [dbo].[Заявки] ([ЗаявкаID], [НомерЗаявки], [КлиентID], [МастерID], [СтатусID], [ДатаНачала], [ДатаОкончания]) VALUES (4, 4, 8, NULL, 1, CAST(N'2023-08-02' AS Date), NULL)
INSERT [dbo].[Заявки] ([ЗаявкаID], [НомерЗаявки], [КлиентID], [МастерID], [СтатусID], [ДатаНачала], [ДатаОкончания]) VALUES (5, 5, 9, NULL, 1, CAST(N'2023-08-02' AS Date), NULL)
INSERT [dbo].[Заявки] ([ЗаявкаID], [НомерЗаявки], [КлиентID], [МастерID], [СтатусID], [ДатаНачала], [ДатаОкончания]) VALUES (7, 1, 1, 3, 2, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date))
INSERT [dbo].[Заявки] ([ЗаявкаID], [НомерЗаявки], [КлиентID], [МастерID], [СтатусID], [ДатаНачала], [ДатаОкончания]) VALUES (8, 1, 6, 2, 1, CAST(N'2024-09-06' AS Date), CAST(N'1900-01-01' AS Date))
INSERT [dbo].[Заявки] ([ЗаявкаID], [НомерЗаявки], [КлиентID], [МастерID], [СтатусID], [ДатаНачала], [ДатаОкончания]) VALUES (12, 6, 7, NULL, 2, CAST(N'2023-08-02' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Заявки] OFF
GO
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (1, N'login1', N'pass1')
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (2, N'login2', N'pass2')
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (3, N'login3', N'pass3')
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (4, N'login4', N'pass4')
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (5, N'login5', N'pass5')
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (6, N'login11', N'pass11')
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (7, N'login12', N'pass12')
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (8, N'login13', N'pass13')
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (9, N'login14', N'pass14')
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (10, N'login15', N'pass15')
INSERT [dbo].[ЛогиныПароли] ([ПользовательID], [Логин], [Пароль]) VALUES (11, N'л', N'п')
GO
SET IDENTITY_INSERT [dbo].[МоделиОбъектов] ON 

INSERT [dbo].[МоделиОбъектов] ([МодельID], [НазваниеМодели]) VALUES (1, N'DEXP Aquilon O286')
INSERT [dbo].[МоделиОбъектов] ([МодельID], [НазваниеМодели]) VALUES (2, N'DEXP Atlas H388')
INSERT [dbo].[МоделиОбъектов] ([МодельID], [НазваниеМодели]) VALUES (3, N'MSI GF76 Katana 11UC-879XRU черный')
INSERT [dbo].[МоделиОбъектов] ([МодельID], [НазваниеМодели]) VALUES (4, N'MSI Modern 15 B12M-211RU черный')
INSERT [dbo].[МоделиОбъектов] ([МодельID], [НазваниеМодели]) VALUES (5, N'HP LaserJet Pro M404dn')
SET IDENTITY_INSERT [dbo].[МоделиОбъектов] OFF
GO
SET IDENTITY_INSERT [dbo].[Объекты] ON 

INSERT [dbo].[Объекты] ([ОбъектID], [НомерЗаявки], [ТипID], [МодельID], [Описание]) VALUES (1, 1, 1, 1, N'Перестал работать')
INSERT [dbo].[Объекты] ([ОбъектID], [НомерЗаявки], [ТипID], [МодельID], [Описание]) VALUES (2, 2, 1, 2, N'Перестал работать')
INSERT [dbo].[Объекты] ([ОбъектID], [НомерЗаявки], [ТипID], [МодельID], [Описание]) VALUES (3, 3, 2, 3, N'Выключается')
INSERT [dbo].[Объекты] ([ОбъектID], [НомерЗаявки], [ТипID], [МодельID], [Описание]) VALUES (4, 4, 2, 4, N'Выключается')
INSERT [dbo].[Объекты] ([ОбъектID], [НомерЗаявки], [ТипID], [МодельID], [Описание]) VALUES (5, 5, 3, 5, N'Перестал работать')
SET IDENTITY_INSERT [dbo].[Объекты] OFF
GO
SET IDENTITY_INSERT [dbo].[Пользователи] ON 

INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (1, N'Носов  ', N'Иван', N'Михайлович', N'89210563128', 4)
INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (2, N'Ильин ч ', N'Михайлович', N'Андреевич', N'89535078985', 2)
INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (3, N'Никифоров  ', N'Иван', N'Дмитриевич', N'89210673849', 2)
INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (4, N'Елисеев  ', N'Михайлович', N'Леонидович', N'89990563748', 3)
INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (5, N'Титов  ', N'Сергей', N'Кириллович', N'89994563847', 3)
INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (6, N'Григорьев  ', N'Семён', N'Викторович', N'89219567849', 1)
INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (7, N'Сорокин  ', N'Дмитрий', N'Ильич', N'89219567841', 1)
INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (8, N'Белоусов  ', N'Егор', N'Ярославович', N'89219567842', 1)
INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (9, N'Суслов  ', N'Михаил', N'Александрович', N'89219567843', 1)
INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (10, N'Васильев  ', N'Вячеслав', N'Александрович', N'89219567844', 2)
INSERT [dbo].[Пользователи] ([ПользовательID], [Имя], [Фамилия], [Отчество], [НомерТелефона], [РольID]) VALUES (11, N'и', N'ф', N'о', N'12', 1)
SET IDENTITY_INSERT [dbo].[Пользователи] OFF
GO
SET IDENTITY_INSERT [dbo].[Роли] ON 

INSERT [dbo].[Роли] ([РольID], [НазваниеРоли]) VALUES (1, N'Клиент')
INSERT [dbo].[Роли] ([РольID], [НазваниеРоли]) VALUES (2, N'Мастер')
INSERT [dbo].[Роли] ([РольID], [НазваниеРоли]) VALUES (3, N'Оператор')
INSERT [dbo].[Роли] ([РольID], [НазваниеРоли]) VALUES (4, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Роли] OFF
GO
SET IDENTITY_INSERT [dbo].[Статусы] ON 

INSERT [dbo].[Статусы] ([СтатусID], [НазваниеСтатуса]) VALUES (1, N'Новая заявка')
INSERT [dbo].[Статусы] ([СтатусID], [НазваниеСтатуса]) VALUES (2, N'В процессе ремонта')
INSERT [dbo].[Статусы] ([СтатусID], [НазваниеСтатуса]) VALUES (3, N'Заверешно')
SET IDENTITY_INSERT [dbo].[Статусы] OFF
GO
SET IDENTITY_INSERT [dbo].[ТипыОбъектов] ON 

INSERT [dbo].[ТипыОбъектов] ([ТипID], [НазваниеТипа]) VALUES (1, N'Компьютер')
INSERT [dbo].[ТипыОбъектов] ([ТипID], [НазваниеТипа]) VALUES (2, N'Ноутбук')
INSERT [dbo].[ТипыОбъектов] ([ТипID], [НазваниеТипа]) VALUES (3, N'Принтер')
SET IDENTITY_INSERT [dbo].[ТипыОбъектов] OFF
GO
ALTER TABLE [dbo].[ЖурналИзменений] ADD  DEFAULT (getdate()) FOR [Создан]
GO
ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD FOREIGN KEY([ДетальID])
REFERENCES [dbo].[Детали] ([ДеталиID])
GO
ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD FOREIGN KEY([ОбъектID])
REFERENCES [dbo].[Объекты] ([ОбъектID])
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD FOREIGN KEY([КлиентID])
REFERENCES [dbo].[Пользователи] ([ПользовательID])
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD FOREIGN KEY([МастерID])
REFERENCES [dbo].[Пользователи] ([ПользовательID])
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD FOREIGN KEY([СтатусID])
REFERENCES [dbo].[Статусы] ([СтатусID])
GO
ALTER TABLE [dbo].[ЛогиныПароли]  WITH CHECK ADD FOREIGN KEY([ПользовательID])
REFERENCES [dbo].[Пользователи] ([ПользовательID])
GO
ALTER TABLE [dbo].[Объекты]  WITH CHECK ADD FOREIGN KEY([МодельID])
REFERENCES [dbo].[МоделиОбъектов] ([МодельID])
GO
ALTER TABLE [dbo].[Объекты]  WITH CHECK ADD FOREIGN KEY([НомерЗаявки])
REFERENCES [dbo].[Заявки] ([ЗаявкаID])
GO
ALTER TABLE [dbo].[Объекты]  WITH CHECK ADD FOREIGN KEY([ТипID])
REFERENCES [dbo].[ТипыОбъектов] ([ТипID])
GO
ALTER TABLE [dbo].[Пользователи]  WITH CHECK ADD FOREIGN KEY([РольID])
REFERENCES [dbo].[Роли] ([РольID])
GO
USE [master]
GO
ALTER DATABASE [ЗаявкиНаРемонтКажаров] SET  READ_WRITE 
GO
