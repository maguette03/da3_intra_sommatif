USE [da3_intra_sommatif]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Fuels]') AND type in (N'U'))
ALTER TABLE [dbo].[Fuels] DROP CONSTRAINT IF EXISTS [DF_Fuels_DateCreated]
GO
/****** Object:  Table [dbo].[Fuels]    Script Date: 21/10/2024 08:21:28 ******/
DROP TABLE IF EXISTS [dbo].[Fuels]
GO
USE [master]
GO
/****** Object:  Database [da3_intra_sommatif]    Script Date: 21/10/2024 08:21:28 ******/
DROP DATABASE IF EXISTS [da3_intra_sommatif]
GO
/****** Object:  Database [da3_intra_sommatif]    Script Date: 21/10/2024 08:21:28 ******/
CREATE DATABASE [da3_intra_sommatif]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'da3_intra_sommatif', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022DEV\MSSQL\DATA\da3_intra_sommatif.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'da3_intra_sommatif_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022DEV\MSSQL\DATA\da3_intra_sommatif_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [da3_intra_sommatif] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [da3_intra_sommatif].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [da3_intra_sommatif] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET ARITHABORT OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [da3_intra_sommatif] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [da3_intra_sommatif] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET  DISABLE_BROKER 
GO
ALTER DATABASE [da3_intra_sommatif] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [da3_intra_sommatif] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET RECOVERY FULL 
GO
ALTER DATABASE [da3_intra_sommatif] SET  MULTI_USER 
GO
ALTER DATABASE [da3_intra_sommatif] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [da3_intra_sommatif] SET DB_CHAINING OFF 
GO
ALTER DATABASE [da3_intra_sommatif] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [da3_intra_sommatif] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [da3_intra_sommatif] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [da3_intra_sommatif] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'da3_intra_sommatif', N'ON'
GO
ALTER DATABASE [da3_intra_sommatif] SET QUERY_STORE = ON
GO
ALTER DATABASE [da3_intra_sommatif] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [da3_intra_sommatif]
GO
/****** Object:  Table [dbo].[Fuels]    Script Date: 21/10/2024 08:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fuels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[UsageDescription] [nvarchar](255) NOT NULL,
	[JoulesPerkg] [bigint] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Fuels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fuels] ON 

INSERT [dbo].[Fuels] ([Id], [Name], [UsageDescription], [JoulesPerkg], [DateCreated]) VALUES (1, N'Essence', N'Propulsion', 460000000, CAST(N'2024-10-21T08:10:07.9633333' AS DateTime2))
INSERT [dbo].[Fuels] ([Id], [Name], [UsageDescription], [JoulesPerkg], [DateCreated]) VALUES (2, N'Uranium235', N'Electricite', 3900000000000, CAST(N'2024-10-21T08:11:49.2500000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Fuels] OFF
GO
ALTER TABLE [dbo].[Fuels] ADD  CONSTRAINT [DF_Fuels_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
USE [master]
GO
ALTER DATABASE [da3_intra_sommatif] SET  READ_WRITE 
GO
