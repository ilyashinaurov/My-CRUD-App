USE [master]
GO
/****** Object:  Database [TransportCompany]    Script Date: 14.04.2022 9:42:34 ******/
CREATE DATABASE [TransportCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TransportCompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TransportCompany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TransportCompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TransportCompany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TransportCompany] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TransportCompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TransportCompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TransportCompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TransportCompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TransportCompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TransportCompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [TransportCompany] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TransportCompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TransportCompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TransportCompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TransportCompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TransportCompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TransportCompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TransportCompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TransportCompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TransportCompany] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TransportCompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TransportCompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TransportCompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TransportCompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TransportCompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TransportCompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TransportCompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TransportCompany] SET RECOVERY FULL 
GO
ALTER DATABASE [TransportCompany] SET  MULTI_USER 
GO
ALTER DATABASE [TransportCompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TransportCompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TransportCompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TransportCompany] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TransportCompany] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TransportCompany] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TransportCompany', N'ON'
GO
ALTER DATABASE [TransportCompany] SET QUERY_STORE = OFF
GO
USE [TransportCompany]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[КодКлиента] [int] NOT NULL,
	[КодМаршрута] [int] NOT NULL,
	[КодВодителя] [int] NOT NULL,
	[КодТС] [int] NOT NULL,
	[КодЗаказа] [int] NOT NULL,
	[ДатаНачала] [date] NOT NULL,
	[Дата] [date] NOT NULL,
	[ДатаОкончания] [date] NOT NULL,
 CONSTRAINT [XPKЗаказ] PRIMARY KEY CLUSTERED 
(
	[КодЗаказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТС]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТС](
	[КодТС] [int] NOT NULL,
	[Госномер] [nchar](10) NOT NULL,
	[КодПрицепа] [int] NOT NULL,
	[КодМоделиТС] [int] NOT NULL,
 CONSTRAINT [XPKТС] PRIMARY KEY CLUSTERED 
(
	[КодТС] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[МодельТС]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[МодельТС](
	[КодМоделиТС] [int] NOT NULL,
	[Марка] [nchar](25) NOT NULL,
	[Модель] [nchar](25) NOT NULL,
	[ТипДвигателя] [nchar](15) NOT NULL,
	[Расход] [float] NOT NULL,
 CONSTRAINT [XPKМодельТС] PRIMARY KEY CLUSTERED 
(
	[КодМоделиТС] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Маршрут]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Маршрут](
	[КодМаршрута] [int] NOT NULL,
	[ПунктОтправления] [nchar](100) NOT NULL,
	[ПунктНазначения] [nchar](100) NOT NULL,
	[Длина] [float] NOT NULL,
 CONSTRAINT [XPKМаршрут] PRIMARY KEY CLUSTERED 
(
	[КодМаршрута] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[РасходВсехТС]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[РасходВсехТС] (Номер, Расход, ДатаНачала, ДатаКонца) AS
SELECT ТС.Госномер, (Маршрут.Длина/100) * МодельТС.Расход, Заказ.ДатаНачала, Заказ.ДатаОкончания FROM ТС 
INNER JOIN МодельТС ON ТС.КодМоделиТС = МодельТС.КодМоделиТС
INNER JOIN Заказ ON ТС.КодТС = Заказ.КодТС 
INNER JOIN Маршрут ON Заказ.КодМаршрута = Маршрут.КодМаршрута

GO
/****** Object:  Table [dbo].[testa]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testa](
	[КодВодителя] [int] NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
	[ДатаРождения] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Водитель]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Водитель](
	[КодВодителя] [int] NOT NULL,
	[Имя] [nchar](25) NOT NULL,
	[Фамилия] [nchar](25) NOT NULL,
	[Отчество] [nchar](25) NOT NULL,
	[ДатаРождения] [date] NOT NULL,
 CONSTRAINT [XPKВодитель] PRIMARY KEY CLUSTERED 
(
	[КодВодителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиент](
	[КодКлиента] [int] NOT NULL,
	[Имя] [nchar](20) NOT NULL,
	[Фамилия] [nchar](20) NOT NULL,
	[Отчество] [nchar](20) NOT NULL,
	[РасчетныйСчет] [bigint] NOT NULL,
	[Скидка] [int] NOT NULL,
 CONSTRAINT [XPKКлиент] PRIMARY KEY CLUSTERED 
(
	[КодКлиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[МодельПрицепа]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[МодельПрицепа](
	[КодМоделиПрицепа] [int] NOT NULL,
	[Объем] [float] NOT NULL,
	[Грузоподъемность] [float] NOT NULL,
	[Модель] [nchar](25) NOT NULL,
	[Марка] [nchar](25) NOT NULL,
 CONSTRAINT [XPKМодельПрицепа] PRIMARY KEY CLUSTERED 
(
	[КодМоделиПрицепа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[КодПользователя] [int] NOT NULL,
	[Логин] [nchar](20) NULL,
	[Пароль] [nchar](100) NULL,
	[Тип] [int] NULL,
 CONSTRAINT [XPKПользователь] PRIMARY KEY CLUSTERED 
(
	[КодПользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Прицеп]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Прицеп](
	[Госномер] [nchar](25) NOT NULL,
	[КодПрицепа] [int] NOT NULL,
	[КодМоделиПрицепа] [int] NOT NULL,
 CONSTRAINT [XPKПрицеп] PRIMARY KEY CLUSTERED 
(
	[КодПрицепа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [R_10] FOREIGN KEY([КодМаршрута])
REFERENCES [dbo].[Маршрут] ([КодМаршрута])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [R_10]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([КодВодителя])
REFERENCES [dbo].[Водитель] ([КодВодителя])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [R_11]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([КодТС])
REFERENCES [dbo].[ТС] ([КодТС])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [R_12]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [R_9] FOREIGN KEY([КодКлиента])
REFERENCES [dbo].[Клиент] ([КодКлиента])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [R_9]
GO
ALTER TABLE [dbo].[Прицеп]  WITH CHECK ADD  CONSTRAINT [R_40] FOREIGN KEY([КодМоделиПрицепа])
REFERENCES [dbo].[МодельПрицепа] ([КодМоделиПрицепа])
GO
ALTER TABLE [dbo].[Прицеп] CHECK CONSTRAINT [R_40]
GO
ALTER TABLE [dbo].[ТС]  WITH CHECK ADD  CONSTRAINT [R_41] FOREIGN KEY([КодПрицепа])
REFERENCES [dbo].[Прицеп] ([КодПрицепа])
GO
ALTER TABLE [dbo].[ТС] CHECK CONSTRAINT [R_41]
GO
ALTER TABLE [dbo].[ТС]  WITH CHECK ADD  CONSTRAINT [R_42] FOREIGN KEY([КодМоделиТС])
REFERENCES [dbo].[МодельТС] ([КодМоделиТС])
GO
ALTER TABLE [dbo].[ТС] CHECK CONSTRAINT [R_42]
GO
/****** Object:  StoredProcedure [dbo].[ИспользованиеТС]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ИспользованиеТС]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ТС.Госномер, Заказ.ДатаНачала AS НачалоЗаказа, Заказ.ДатаОкончания AS КонецЗаказа FROM ТС
	INNER JOIN Заказ on Заказ.КодТС = ТС.КодТС
	GROUP BY ТС.Госномер, Заказ.ДатаНачала, Заказ.ДатаОкончания
END
GO
/****** Object:  StoredProcedure [dbo].[ОбщийПробегТС]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ОбщийПробегТС]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ТС.Госномер, SUM(Маршрут.Длина ) AS Пробег FROM ТС 
	INNER JOIN МодельТС ON ТС.КодМоделиТС = МодельТС.КодМоделиТС
	INNER JOIN Заказ ON ТС.КодТС = Заказ.КодТС 
	INNER JOIN Маршрут ON Заказ.КодМаршрута = Маршрут.КодМаршрута 
	GROUP BY Госномер
END
GO
/****** Object:  StoredProcedure [dbo].[ПробегТСПериод]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ПробегТСПериод]
	-- Add the parameters for the stored procedure here
	@ДатаНачала date,
	@ДатаКонца date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ТС.Госномер, SUM(Маршрут.Длина ) AS Пробег FROM ТС 
	INNER JOIN МодельТС ON ТС.КодМоделиТС = МодельТС.КодМоделиТС
	INNER JOIN Заказ ON ТС.КодТС = Заказ.КодТС 
	INNER JOIN Маршрут ON Заказ.КодМаршрута = Маршрут.КодМаршрута WHERE Заказ.ДатаОкончания BETWEEN @ДатаНачала AND @ДатаКонца
	GROUP BY Госномер
END
GO
/****** Object:  StoredProcedure [dbo].[РасходТС2Период]    Script Date: 14.04.2022 9:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[РасходТС2Период]
	-- Add the parameters for the stored procedure here
	@ДатаНачала date,
	@ДатаКонца date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ТС.Госномер, SUM(  (Маршрут.Длина/100)* МодельТС.Расход) AS Расход FROM ТС 
	INNER JOIN МодельТС ON ТС.КодМоделиТС = МодельТС.КодМоделиТС
	INNER JOIN Заказ ON ТС.КодТС = Заказ.КодТС 
	INNER JOIN Маршрут ON Заказ.КодМаршрута = Маршрут.КодМаршрута WHERE Заказ.ДатаОкончания BETWEEN @ДатаНачала AND @ДатаКонца
	GROUP BY Госномер
END
GO
USE [master]
GO
ALTER DATABASE [TransportCompany] SET  READ_WRITE 
GO
