USE [master]
GO
/****** Object:  Database [Library]    Script Date: 19.07.2018 11:28:29 ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Library.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Library_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Library] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Library]
GO
/****** Object:  User [teacher]    Script Date: 19.07.2018 11:28:29 ******/
CREATE USER [teacher] FOR LOGIN [teacher] WITH DEFAULT_SCHEMA=[db_datareader]
GO
/****** Object:  User [librarian]    Script Date: 19.07.2018 11:28:29 ******/
CREATE USER [librarian] FOR LOGIN [librarian] WITH DEFAULT_SCHEMA=[db_datareader]
GO
/****** Object:  User [lib_admin]    Script Date: 19.07.2018 11:28:29 ******/
CREATE USER [lib_admin] FOR LOGIN [lib_admin] WITH DEFAULT_SCHEMA=[db_ddladmin]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 19.07.2018 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 19.07.2018 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_author] [int] NULL,
	[id_category] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 19.07.2018 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Deleted_books]    Script Date: 19.07.2018 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deleted_books](
	[deleted_id] [int] NULL,
	[deleted_name] [nvarchar](50) NULL,
	[deleted_id_author] [int] NULL,
	[deleted_id_category] [int] NULL,
	[deleted_quantity] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Issued_books]    Script Date: 19.07.2018 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issued_books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_book] [int] NULL,
	[id_reader] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reader]    Script Date: 19.07.2018 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](50) NULL,
	[quantity_of_books] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Returned_books]    Script Date: 19.07.2018 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Returned_books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_book] [int] NULL,
	[id_reader] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Book_readers]    Script Date: 19.07.2018 11:28:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Book_readers] as
select r.fname, b.id_book, COUNT(id_book) cnt 
from Returned_books b, Reader r 
where r.id = b.id_reader
group by fname, id_book

GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([id_author])
REFERENCES [dbo].[Authors] ([id])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Issued_books]  WITH CHECK ADD FOREIGN KEY([id_book])
REFERENCES [dbo].[Books] ([id])
GO
ALTER TABLE [dbo].[Issued_books]  WITH CHECK ADD FOREIGN KEY([id_reader])
REFERENCES [dbo].[Reader] ([id])
GO
ALTER TABLE [dbo].[Returned_books]  WITH CHECK ADD FOREIGN KEY([id_book])
REFERENCES [dbo].[Books] ([id])
GO
ALTER TABLE [dbo].[Returned_books]  WITH CHECK ADD FOREIGN KEY([id_reader])
REFERENCES [dbo].[Reader] ([id])
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
