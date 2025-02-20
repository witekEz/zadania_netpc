USE [master]
GO
/****** Object:  Database [zadanie_2]    Script Date: 09/07/2024 20:41:01 ******/
CREATE DATABASE [zadanie_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'zadanie_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\zadanie_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'zadanie_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\zadanie_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [zadanie_2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zadanie_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zadanie_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [zadanie_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [zadanie_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [zadanie_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [zadanie_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [zadanie_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [zadanie_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [zadanie_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [zadanie_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [zadanie_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [zadanie_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [zadanie_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [zadanie_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [zadanie_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [zadanie_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [zadanie_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [zadanie_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [zadanie_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [zadanie_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [zadanie_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [zadanie_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [zadanie_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [zadanie_2] SET RECOVERY FULL 
GO
ALTER DATABASE [zadanie_2] SET  MULTI_USER 
GO
ALTER DATABASE [zadanie_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [zadanie_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [zadanie_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [zadanie_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [zadanie_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [zadanie_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'zadanie_2', N'ON'
GO
ALTER DATABASE [zadanie_2] SET QUERY_STORE = ON
GO
ALTER DATABASE [zadanie_2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [zadanie_2]
GO
/****** Object:  Schema [zadanie_2]    Script Date: 09/07/2024 20:41:01 ******/
CREATE SCHEMA [zadanie_2]
GO
/****** Object:  Table [zadanie_2].[firmy]    Script Date: 09/07/2024 20:41:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [zadanie_2].[firmy](
	[Company_Id] [int] IDENTITY(11,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[President_Id] [int] NOT NULL,
 CONSTRAINT [PK_firmy_idFirmy] PRIMARY KEY CLUSTERED 
(
	[Company_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [zadanie_2].[malzenstwo]    Script Date: 09/07/2024 20:41:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [zadanie_2].[malzenstwo](
	[Marrige_Id] [int] IDENTITY(29,1) NOT NULL,
	[Husband_Id] [int] NOT NULL,
	[Wife_Id] [int] NOT NULL,
	[Weeding_Date] [date] NOT NULL,
	[Marriage_End_Date] [date] NULL,
 CONSTRAINT [PK_malzenstwo_idMalzenstwa] PRIMARY KEY CLUSTERED 
(
	[Marrige_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [zadanie_2].[osoby]    Script Date: 09/07/2024 20:41:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [zadanie_2].[osoby](
	[Person_Id] [int] IDENTITY(101,1) NOT NULL,
	[First_Name] [nvarchar](45) NOT NULL,
	[Last_Name] [nvarchar](45) NOT NULL,
	[Birth_Date] [date] NOT NULL,
	[Sex] [nvarchar](20) NOT NULL,
	[Earnings] [decimal](10, 2) NULL,
	[Mother_Id] [int] NULL,
	[Father_Id] [int] NULL,
 CONSTRAINT [PK_osoby_idOsoby] PRIMARY KEY CLUSTERED 
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [zadanie_2].[praca]    Script Date: 09/07/2024 20:41:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [zadanie_2].[praca](
	[Work_Id] [int] NOT NULL,
	[Person_Id] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Contract_Type] [nvarchar](45) NULL,
	[Contract_Start] [date] NOT NULL,
	[Contract_End] [date] NULL,
 CONSTRAINT [PK_praca_idPracy] PRIMARY KEY CLUSTERED 
(
	[Work_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [zadanie_2].[firmy] ON 

INSERT [zadanie_2].[firmy] ([Company_Id], [Name], [President_Id]) VALUES (1, N'ABC Sp. z o.o.', 3)
INSERT [zadanie_2].[firmy] ([Company_Id], [Name], [President_Id]) VALUES (2, N'BlachoTrapez S.A.', 6)
INSERT [zadanie_2].[firmy] ([Company_Id], [Name], [President_Id]) VALUES (3, N'SajgiPol', 9)
INSERT [zadanie_2].[firmy] ([Company_Id], [Name], [President_Id]) VALUES (4, N'FinCorp Ltd.', 30)
INSERT [zadanie_2].[firmy] ([Company_Id], [Name], [President_Id]) VALUES (5, N'HealthCare Inc.', 40)
INSERT [zadanie_2].[firmy] ([Company_Id], [Name], [President_Id]) VALUES (6, N'EduTech', 50)
INSERT [zadanie_2].[firmy] ([Company_Id], [Name], [President_Id]) VALUES (7, N'EcoEnergy', 60)
INSERT [zadanie_2].[firmy] ([Company_Id], [Name], [President_Id]) VALUES (8, N'AutoWorks S.A', 71)
INSERT [zadanie_2].[firmy] ([Company_Id], [Name], [President_Id]) VALUES (9, N'EnergoPol S.A', 82)
INSERT [zadanie_2].[firmy] ([Company_Id], [Name], [President_Id]) VALUES (10, N'Tarkov Inc', 83)
SET IDENTITY_INSERT [zadanie_2].[firmy] OFF
GO
SET IDENTITY_INSERT [zadanie_2].[malzenstwo] ON 

INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (1, 1, 2, CAST(N'1975-06-01' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (2, 3, 4, CAST(N'2003-07-07' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (3, 7, 8, CAST(N'2015-08-08' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (4, 9, 10, CAST(N'2010-09-09' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (5, 11, 12, CAST(N'2000-10-10' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (6, 15, 16, CAST(N'1990-11-11' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (7, 19, 20, CAST(N'2011-12-12' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (8, 21, 22, CAST(N'1985-01-01' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (9, 25, 26, CAST(N'2009-02-02' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (10, 27, 28, CAST(N'2004-03-03' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (11, 31, 32, CAST(N'2002-04-04' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (12, 35, 36, CAST(N'2001-05-05' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (13, 39, 40, CAST(N'2010-06-06' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (14, 43, 44, CAST(N'2007-07-07' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (15, 47, 48, CAST(N'2011-08-08' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (16, 51, 52, CAST(N'1980-09-09' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (17, 55, 56, CAST(N'2003-10-10' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (18, 59, 60, CAST(N'1999-11-11' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (19, 63, 64, CAST(N'2002-12-12' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (20, 67, 68, CAST(N'2008-01-01' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (21, 71, 72, CAST(N'2011-02-02' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (22, 75, 76, CAST(N'2005-03-03' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (23, 79, 80, CAST(N'2012-04-04' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (24, 83, 84, CAST(N'2010-05-05' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (25, 87, 88, CAST(N'2013-06-06' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (26, 91, 92, CAST(N'1987-07-07' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (27, 95, 96, CAST(N'2000-08-08' AS Date), NULL)
INSERT [zadanie_2].[malzenstwo] ([Marrige_Id], [Husband_Id], [Wife_Id], [Weeding_Date], [Marriage_End_Date]) VALUES (28, 99, 100, CAST(N'1995-09-09' AS Date), NULL)
SET IDENTITY_INSERT [zadanie_2].[malzenstwo] OFF
GO
SET IDENTITY_INSERT [zadanie_2].[osoby] ON 

INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (1, N'Jan', N'Kowalski', CAST(N'1950-01-01' AS Date), N'M', CAST(5000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (2, N'Anna', N'Kowalska', CAST(N'1955-05-05' AS Date), N'F', CAST(4500.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (3, N'Piotr', N'Wiśniewski', CAST(N'1980-02-02' AS Date), N'M', CAST(6000.00 AS Decimal(10, 2)), 2, 1)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (4, N'Maria', N'Wiśniewska', CAST(N'1982-03-03' AS Date), N'F', CAST(5000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (5, N'Krzysztof', N'Wiśniewski', CAST(N'2005-04-04' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 4, 3)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (6, N'Katarzyna', N'Wiśniewska', CAST(N'2008-07-07' AS Date), N'F', CAST(1500.00 AS Decimal(10, 2)), 4, 3)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (7, N'Paweł', N'Wójcik', CAST(N'1990-08-08' AS Date), N'M', CAST(4000.00 AS Decimal(10, 2)), 4, 3)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (8, N'Magdalena', N'Wójcik', CAST(N'1992-09-09' AS Date), N'F', CAST(3000.00 AS Decimal(10, 2)), 2, 1)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (9, N'Łukasz', N'Lewandowski', CAST(N'1985-10-10' AS Date), N'M', CAST(5500.00 AS Decimal(10, 2)), 7, 8)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (10, N'Karolina', N'Lewandowska', CAST(N'1987-11-11' AS Date), N'F', CAST(35000.00 AS Decimal(10, 2)), 7, 8)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (11, N'Tomasz', N'Kamiński', CAST(N'1975-12-12' AS Date), N'M', CAST(5000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (12, N'Barbara', N'Kamińska', CAST(N'1978-01-01' AS Date), N'F', CAST(4700.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (13, N'Adrian', N'Szymański', CAST(N'2000-02-02' AS Date), N'M', CAST(3000.00 AS Decimal(10, 2)), 12, 11)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (14, N'Ewa', N'Szymańska', CAST(N'2002-03-03' AS Date), N'F', CAST(2800.00 AS Decimal(10, 2)), 12, 11)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (15, N'Dawid', N'Dąbrowski', CAST(N'1970-04-04' AS Date), N'M', CAST(5200.00 AS Decimal(10, 2)), 4, 3)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (16, N'Agnieszka', N'Dąbrowska', CAST(N'1973-05-05' AS Date), N'F', CAST(4900.00 AS Decimal(10, 2)), 2, 1)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (17, N'Mateusz', N'Dąbrowski', CAST(N'1995-06-06' AS Date), N'M', CAST(2500.00 AS Decimal(10, 2)), 16, 15)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (18, N'Zuzanna', N'Dąbrowska', CAST(N'1997-07-07' AS Date), N'F', CAST(2200.00 AS Decimal(10, 2)), 16, 15)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (19, N'Marek', N'Kaczmarek', CAST(N'1988-08-08' AS Date), N'M', CAST(4000.00 AS Decimal(10, 2)), 4, 3)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (20, N'Joanna', N'Kaczmarek', CAST(N'1990-09-09' AS Date), N'F', CAST(3700.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (21, N'Jakub', N'Piotrowski', CAST(N'1960-10-10' AS Date), N'M', CAST(5500.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (22, N'Martyna', N'Piotrowska', CAST(N'1963-11-11' AS Date), N'F', CAST(5300.00 AS Decimal(10, 2)), 2, 1)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (23, N'Robert', N'Piotrowski', CAST(N'1985-12-12' AS Date), N'M', CAST(6000.00 AS Decimal(10, 2)), 22, 21)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (24, N'Alicja', N'Piotrowska', CAST(N'1987-01-01' AS Date), N'F', CAST(5800.00 AS Decimal(10, 2)), 22, 21)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (25, N'Kamil', N'Grabowski', CAST(N'1990-02-02' AS Date), N'M', CAST(5500.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (26, N'Natalia', N'Grabowska', CAST(N'1992-03-03' AS Date), N'F', CAST(5300.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (27, N'Adam', N'Nowak', CAST(N'1980-04-04' AS Date), N'M', CAST(5100.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (28, N'Dorota', N'Nowak', CAST(N'1982-05-05' AS Date), N'F', CAST(4900.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (29, N'Paweł', N'Nowak', CAST(N'2005-06-06' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 28, 27)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (30, N'Monika', N'Nowak', CAST(N'2007-07-07' AS Date), N'F', CAST(1500.00 AS Decimal(10, 2)), 28, 27)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (31, N'Michał', N'Wróbel', CAST(N'1980-08-08' AS Date), N'M', CAST(5000.00 AS Decimal(10, 2)), 28, 27)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (32, N'Sylwia', N'Wróbel', CAST(N'1983-09-09' AS Date), N'F', CAST(4800.00 AS Decimal(10, 2)), 28, 27)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (33, N'Jakub', N'Wróbel', CAST(N'2005-10-10' AS Date), N'M', CAST(2200.00 AS Decimal(10, 2)), 32, 31)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (34, N'Zofia', N'Wróbel', CAST(N'2008-11-11' AS Date), N'F', CAST(2000.00 AS Decimal(10, 2)), 32, 31)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (35, N'Tadeusz', N'Kowalczyk', CAST(N'1970-12-12' AS Date), N'M', CAST(5400.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (36, N'Edyta', N'Kowalczyk', CAST(N'1975-01-01' AS Date), N'F', CAST(5200.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (37, N'Konrad', N'Kowalczyk', CAST(N'2000-02-02' AS Date), N'M', CAST(2900.00 AS Decimal(10, 2)), 36, 35)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (38, N'Anna', N'Kowalczyk', CAST(N'2002-03-03' AS Date), N'F', CAST(2700.00 AS Decimal(10, 2)), 36, 35)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (39, N'Andrzej', N'Adamski', CAST(N'1980-04-04' AS Date), N'M', CAST(5300.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (40, N'Katarzyna', N'Adamska', CAST(N'1985-05-05' AS Date), N'F', CAST(5100.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (41, N'Łukasz', N'Adamski', CAST(N'2010-06-06' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 40, 39)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (42, N'Emilia', N'Adamska', CAST(N'2012-07-07' AS Date), N'F', CAST(1800.00 AS Decimal(10, 2)), 40, 39)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (43, N'Patryk', N'Zieliński', CAST(N'1980-08-08' AS Date), N'M', CAST(4900.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (44, N'Małgorzata', N'Zielińska', CAST(N'1983-09-09' AS Date), N'F', CAST(4700.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (45, N'Wiktor', N'Zieliński', CAST(N'2005-10-10' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 44, 43)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (46, N'Julia', N'Zielińska', CAST(N'2008-11-11' AS Date), N'F', CAST(1500.00 AS Decimal(10, 2)), 44, 43)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (47, N'Rafał', N'Woźniak', CAST(N'1985-12-12' AS Date), N'M', CAST(4800.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (48, N'Agnieszka', N'Woźniak', CAST(N'1987-01-01' AS Date), N'F', CAST(4600.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (49, N'Krzysztof', N'Woźniak', CAST(N'2010-02-02' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 44, 43)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (50, N'Martyna', N'Woźniak', CAST(N'2012-03-03' AS Date), N'F', CAST(1800.00 AS Decimal(10, 2)), 44, 43)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (51, N'Paweł', N'Kowalski', CAST(N'1960-01-01' AS Date), N'M', CAST(5500.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (52, N'Ewa', N'Kowalska', CAST(N'1962-02-02' AS Date), N'F', CAST(5300.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (53, N'Mariusz', N'Kowalski', CAST(N'1982-03-03' AS Date), N'M', CAST(6000.00 AS Decimal(10, 2)), 52, 51)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (54, N'Justyna', N'Kowalska', CAST(N'1984-04-04' AS Date), N'F', CAST(5800.00 AS Decimal(10, 2)), 52, 51)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (55, N'Jakub', N'Nowicki', CAST(N'1978-05-05' AS Date), N'M', CAST(5000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (56, N'Karolina', N'Nowicka', CAST(N'1980-06-06' AS Date), N'F', CAST(4800.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (57, N'Maciej', N'Nowicki', CAST(N'2005-07-07' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 56, 55)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (58, N'Oliwia', N'Nowicka', CAST(N'2007-08-08' AS Date), N'F', CAST(1500.00 AS Decimal(10, 2)), 56, 55)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (59, N'Mateusz', N'Kaczmarek', CAST(N'1970-09-09' AS Date), N'M', CAST(5200.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (60, N'Alicja', N'Kaczmarek', CAST(N'1972-10-10' AS Date), N'F', CAST(5000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (61, N'Patrycja', N'Kaczmarek', CAST(N'2005-11-11' AS Date), N'F', CAST(2000.00 AS Decimal(10, 2)), 60, 59)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (62, N'Marcin', N'Kaczmarek', CAST(N'2007-12-12' AS Date), N'M', CAST(1500.00 AS Decimal(10, 2)), 60, 59)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (63, N'Adam', N'Michalski', CAST(N'1978-01-01' AS Date), N'M', CAST(5100.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (64, N'Beata', N'Michalska', CAST(N'1980-02-02' AS Date), N'F', CAST(4900.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (65, N'Piotr', N'Michalski', CAST(N'2005-03-03' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 64, 63)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (66, N'Natalia', N'Michalska', CAST(N'2007-04-04' AS Date), N'F', CAST(1500.00 AS Decimal(10, 2)), 64, 63)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (67, N'Tomasz', N'Ostrowski', CAST(N'1980-05-05' AS Date), N'M', CAST(5000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (68, N'Joanna', N'Ostrowska', CAST(N'1982-06-06' AS Date), N'F', CAST(4800.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (69, N'Marcin', N'Ostrowski', CAST(N'2005-07-07' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 68, 67)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (70, N'Anna', N'Ostrowska', CAST(N'2008-08-08' AS Date), N'F', CAST(1500.00 AS Decimal(10, 2)), 68, 67)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (71, N'Andrzej', N'Górski', CAST(N'1985-09-09' AS Date), N'M', CAST(5500.00 AS Decimal(10, 2)), 68, 67)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (72, N'Katarzyna', N'Górska', CAST(N'1987-10-10' AS Date), N'F', CAST(5300.00 AS Decimal(10, 2)), 68, 67)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (73, N'Łukasz', N'Górski', CAST(N'2010-11-11' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 72, 71)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (74, N'Zofia', N'Górska', CAST(N'2012-12-12' AS Date), N'F', CAST(1800.00 AS Decimal(10, 2)), 72, 71)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (75, N'Piotr', N'Jaworski', CAST(N'1980-01-01' AS Date), N'M', CAST(4900.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (76, N'Agnieszka', N'Jaworska', CAST(N'1983-02-02' AS Date), N'F', CAST(4700.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (77, N'Tomasz', N'Jaworski', CAST(N'2005-03-03' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 76, 75)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (78, N'Emilia', N'Jaworska', CAST(N'2008-04-04' AS Date), N'F', CAST(1500.00 AS Decimal(10, 2)), 76, 75)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (79, N'Wojciech', N'Pawlak', CAST(N'1980-05-05' AS Date), N'M', CAST(5000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (80, N'Ewa', N'Pawlak', CAST(N'1982-06-06' AS Date), N'F', CAST(4800.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (81, N'Mateusz', N'Pawlak', CAST(N'2005-07-07' AS Date), N'M', CAST(2200.00 AS Decimal(10, 2)), 80, 79)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (82, N'Oliwia', N'Pawlak', CAST(N'2008-08-08' AS Date), N'F', CAST(2000.00 AS Decimal(10, 2)), 80, 79)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (83, N'Patryk', N'Sikora', CAST(N'1975-09-09' AS Date), N'M', CAST(4900.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (84, N'Małgorzata', N'Sikora', CAST(N'1978-10-10' AS Date), N'F', CAST(4700.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (85, N'Wiktor', N'Sikora', CAST(N'2005-11-11' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 84, 83)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (86, N'Julia', N'Sikora', CAST(N'2008-12-12' AS Date), N'F', CAST(1500.00 AS Decimal(10, 2)), 84, 83)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (87, N'Rafał', N'Czajkowski', CAST(N'1985-01-01' AS Date), N'M', CAST(4800.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (88, N'Agnieszka', N'Czajkowska', CAST(N'1987-02-02' AS Date), N'F', CAST(4600.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (89, N'Krzysztof', N'Czajkowski', CAST(N'2010-03-03' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 88, 87)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (90, N'Martyna', N'Czajkowska', CAST(N'2012-04-04' AS Date), N'F', CAST(1800.00 AS Decimal(10, 2)), 88, 87)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (91, N'Paweł', N'Sadowski', CAST(N'1960-05-05' AS Date), N'M', CAST(5500.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (92, N'Ewa', N'Sadowska', CAST(N'1962-06-06' AS Date), N'F', CAST(5300.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (93, N'Mariusz', N'Sadowski', CAST(N'1982-07-07' AS Date), N'M', CAST(6000.00 AS Decimal(10, 2)), 92, 91)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (94, N'Justyna', N'Sadowska', CAST(N'1984-08-08' AS Date), N'F', CAST(5800.00 AS Decimal(10, 2)), 92, 91)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (95, N'Jakub', N'Ratajczak', CAST(N'1978-09-09' AS Date), N'M', CAST(5000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (96, N'Karolina', N'Ratajczak', CAST(N'1980-10-10' AS Date), N'F', CAST(4800.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (97, N'Maciej', N'Ratajczak', CAST(N'2005-11-11' AS Date), N'M', CAST(2000.00 AS Decimal(10, 2)), 96, 95)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (98, N'Oliwia', N'Ratajczak', CAST(N'2007-12-12' AS Date), N'F', CAST(1500.00 AS Decimal(10, 2)), 96, 95)
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (99, N'Mateusz', N'Urban', CAST(N'1970-01-01' AS Date), N'M', CAST(5200.00 AS Decimal(10, 2)), NULL, NULL)
GO
INSERT [zadanie_2].[osoby] ([Person_Id], [First_Name], [Last_Name], [Birth_Date], [Sex], [Earnings], [Mother_Id], [Father_Id]) VALUES (100, N'Alicja', N'Urban', CAST(N'1972-02-02' AS Date), N'F', CAST(5000.00 AS Decimal(10, 2)), NULL, NULL)
SET IDENTITY_INSERT [zadanie_2].[osoby] OFF
GO
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (1, 1, 1, N'umowa zlecenie', CAST(N'2000-01-01' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (2, 2, 2, N'umowa zlecenie', CAST(N'2005-02-02' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (3, 3, 1, N'umowa zlecenie', CAST(N'2010-03-03' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (4, 4, 2, N'umowa zlecenie', CAST(N'2015-04-04' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (5, 5, 3, N'umowa o prace', CAST(N'2008-05-05' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (6, 6, 4, N'umowa zlecenie', CAST(N'2012-06-06' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (7, 7, 5, N'umowa o prace', CAST(N'2016-07-07' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (8, 8, 6, N'umowa zlecenie', CAST(N'2018-08-08' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (9, 9, 7, N'umowa o prace', CAST(N'2005-09-09' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (10, 10, 8, N'umowa zlecenie', CAST(N'2010-10-10' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (11, 11, 9, N'umowa zlecenie', CAST(N'2012-11-11' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (12, 12, 10, N'umowa zlecenie', CAST(N'2014-12-12' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (13, 13, 1, N'umowa o prace', CAST(N'2000-01-01' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (14, 14, 2, N'umowa zlecenie', CAST(N'2005-02-02' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (15, 15, 3, N'umowa o prace', CAST(N'2010-03-03' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (16, 16, 4, N'umowa zlecenie', CAST(N'2015-04-04' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (17, 17, 5, N'umowa zlecenie', CAST(N'2008-05-05' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (18, 18, 6, N'umowa zlecenie', CAST(N'2012-06-06' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (19, 19, 7, N'umowa o prace', CAST(N'2016-07-07' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (20, 20, 8, N'umowa zlecenie', CAST(N'2018-08-08' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (21, 21, 9, N'umowa o prace', CAST(N'2005-09-09' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (22, 22, 10, N'umowa zlecenie', CAST(N'2010-10-10' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (23, 23, 1, N'umowa o prace', CAST(N'2012-11-11' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (24, 24, 2, N'umowa zlecenie', CAST(N'2014-12-12' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (25, 25, 3, N'umowa o prace', CAST(N'2000-01-01' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (26, 26, 4, N'umowa zlecenie', CAST(N'2005-02-02' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (27, 27, 5, N'umowa o prace', CAST(N'2010-03-03' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (28, 28, 6, N'umowa zlecenie', CAST(N'2015-04-04' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (29, 29, 7, N'umowa o prace', CAST(N'2008-05-05' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (30, 30, 8, N'umowa zlecenie', CAST(N'2012-06-06' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (31, 31, 9, N'umowa o prace', CAST(N'2016-07-07' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (32, 32, 10, N'umowa zlecenie', CAST(N'2018-08-08' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (33, 33, 1, N'umowa o prace', CAST(N'2005-09-09' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (34, 34, 2, N'umowa zlecenie', CAST(N'2010-10-10' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (35, 35, 3, N'umowa zlecenie', CAST(N'2012-11-11' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (36, 36, 4, N'umowa zlecenie', CAST(N'2014-12-12' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (37, 37, 5, N'umowa zlecenie', CAST(N'2000-01-01' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (38, 38, 6, N'umowa zlecenie', CAST(N'2005-02-02' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (39, 39, 7, N'umowa o prace', CAST(N'2010-03-03' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (40, 40, 8, N'umowa zlecenie', CAST(N'2015-04-04' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (41, 41, 9, N'umowa o prace', CAST(N'2008-05-05' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (42, 42, 10, N'umowa zlecenie', CAST(N'2012-06-06' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (43, 43, 1, N'umowa o prace', CAST(N'2016-07-07' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (44, 44, 2, N'umowa zlecenie', CAST(N'2018-08-08' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (45, 45, 3, N'umowa o prace', CAST(N'2005-09-09' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (46, 46, 4, N'umowa zlecenie', CAST(N'2010-10-10' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (47, 47, 5, N'umowa o prace', CAST(N'2012-11-11' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (48, 48, 6, N'umowa zlecenie', CAST(N'2014-12-12' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (49, 49, 7, N'umowa o prace', CAST(N'2000-01-01' AS Date), NULL)
INSERT [zadanie_2].[praca] ([Work_Id], [Person_Id], [Company_Id], [Contract_Type], [Contract_Start], [Contract_End]) VALUES (50, 50, 8, N'umowa zlecenie', CAST(N'2005-02-02' AS Date), NULL)
GO
/****** Object:  Index [firmy$idFirmy_UNIQUE]    Script Date: 09/07/2024 20:41:01 ******/
ALTER TABLE [zadanie_2].[firmy] ADD  CONSTRAINT [firmy$idFirmy_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Company_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Prezes]    Script Date: 09/07/2024 20:41:01 ******/
CREATE NONCLUSTERED INDEX [Prezes] ON [zadanie_2].[firmy]
(
	[President_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [malzenstwo$idMeza]    Script Date: 09/07/2024 20:41:01 ******/
ALTER TABLE [zadanie_2].[malzenstwo] ADD  CONSTRAINT [malzenstwo$idMeza] UNIQUE NONCLUSTERED 
(
	[Husband_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [malzenstwo$idZony]    Script Date: 09/07/2024 20:41:01 ******/
ALTER TABLE [zadanie_2].[malzenstwo] ADD  CONSTRAINT [malzenstwo$idZony] UNIQUE NONCLUSTERED 
(
	[Wife_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [osoby$idDane_UNIQUE]    Script Date: 09/07/2024 20:41:01 ******/
ALTER TABLE [zadanie_2].[osoby] ADD  CONSTRAINT [osoby$idDane_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [osoby_ibfk_1]    Script Date: 09/07/2024 20:41:01 ******/
CREATE NONCLUSTERED INDEX [osoby_ibfk_1] ON [zadanie_2].[osoby]
(
	[Father_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [osoby_ibfk_2]    Script Date: 09/07/2024 20:41:01 ******/
CREATE NONCLUSTERED INDEX [osoby_ibfk_2] ON [zadanie_2].[osoby]
(
	[Mother_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idFirmy]    Script Date: 09/07/2024 20:41:01 ******/
CREATE NONCLUSTERED INDEX [idFirmy] ON [zadanie_2].[praca]
(
	[Company_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idOsoby]    Script Date: 09/07/2024 20:41:01 ******/
CREATE NONCLUSTERED INDEX [idOsoby] ON [zadanie_2].[praca]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [zadanie_2].[malzenstwo] ADD  DEFAULT (NULL) FOR [Marriage_End_Date]
GO
ALTER TABLE [zadanie_2].[osoby] ADD  DEFAULT (NULL) FOR [Earnings]
GO
ALTER TABLE [zadanie_2].[osoby] ADD  DEFAULT (NULL) FOR [Mother_Id]
GO
ALTER TABLE [zadanie_2].[osoby] ADD  DEFAULT (NULL) FOR [Father_Id]
GO
ALTER TABLE [zadanie_2].[praca] ADD  DEFAULT (NULL) FOR [Contract_Type]
GO
ALTER TABLE [zadanie_2].[praca] ADD  DEFAULT (NULL) FOR [Contract_End]
GO
ALTER TABLE [zadanie_2].[firmy]  WITH NOCHECK ADD  CONSTRAINT [firmy$firmy_ibfk_1] FOREIGN KEY([President_Id])
REFERENCES [zadanie_2].[osoby] ([Person_Id])
GO
ALTER TABLE [zadanie_2].[firmy] CHECK CONSTRAINT [firmy$firmy_ibfk_1]
GO
ALTER TABLE [zadanie_2].[malzenstwo]  WITH NOCHECK ADD  CONSTRAINT [malzenstwo$malzenstwo_ibfk_1] FOREIGN KEY([Husband_Id])
REFERENCES [zadanie_2].[osoby] ([Person_Id])
GO
ALTER TABLE [zadanie_2].[malzenstwo] CHECK CONSTRAINT [malzenstwo$malzenstwo_ibfk_1]
GO
ALTER TABLE [zadanie_2].[malzenstwo]  WITH NOCHECK ADD  CONSTRAINT [malzenstwo$malzenstwo_ibfk_2] FOREIGN KEY([Wife_Id])
REFERENCES [zadanie_2].[osoby] ([Person_Id])
GO
ALTER TABLE [zadanie_2].[malzenstwo] CHECK CONSTRAINT [malzenstwo$malzenstwo_ibfk_2]
GO
ALTER TABLE [zadanie_2].[osoby]  WITH NOCHECK ADD  CONSTRAINT [osoby$osoby_ibfk_1] FOREIGN KEY([Father_Id])
REFERENCES [zadanie_2].[osoby] ([Person_Id])
GO
ALTER TABLE [zadanie_2].[osoby] CHECK CONSTRAINT [osoby$osoby_ibfk_1]
GO
ALTER TABLE [zadanie_2].[osoby]  WITH NOCHECK ADD  CONSTRAINT [osoby$osoby_ibfk_2] FOREIGN KEY([Mother_Id])
REFERENCES [zadanie_2].[osoby] ([Person_Id])
GO
ALTER TABLE [zadanie_2].[osoby] CHECK CONSTRAINT [osoby$osoby_ibfk_2]
GO
ALTER TABLE [zadanie_2].[praca]  WITH NOCHECK ADD  CONSTRAINT [praca$praca_ibfk_1] FOREIGN KEY([Person_Id])
REFERENCES [zadanie_2].[osoby] ([Person_Id])
GO
ALTER TABLE [zadanie_2].[praca] CHECK CONSTRAINT [praca$praca_ibfk_1]
GO
ALTER TABLE [zadanie_2].[praca]  WITH NOCHECK ADD  CONSTRAINT [praca$praca_ibfk_2] FOREIGN KEY([Company_Id])
REFERENCES [zadanie_2].[firmy] ([Company_Id])
GO
ALTER TABLE [zadanie_2].[praca] CHECK CONSTRAINT [praca$praca_ibfk_2]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'zadanie_2.firmy' , @level0type=N'SCHEMA',@level0name=N'zadanie_2', @level1type=N'TABLE',@level1name=N'firmy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'zadanie_2.malzenstwo' , @level0type=N'SCHEMA',@level0name=N'zadanie_2', @level1type=N'TABLE',@level1name=N'malzenstwo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'zadanie_2.osoby' , @level0type=N'SCHEMA',@level0name=N'zadanie_2', @level1type=N'TABLE',@level1name=N'osoby'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'zadanie_2.praca' , @level0type=N'SCHEMA',@level0name=N'zadanie_2', @level1type=N'TABLE',@level1name=N'praca'
GO
USE [master]
GO
ALTER DATABASE [zadanie_2] SET  READ_WRITE 
GO
