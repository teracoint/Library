USE [master]
GO
/****** Object:  Database [Library]    Script Date: 04/01/2023 7:53:42 PM ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Library_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 100
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
ALTER DATABASE [Library] SET  DISABLE_BROKER 
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
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Library] SET QUERY_STORE = OFF
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Date] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books_Borrow]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books_Borrow](
	[ID] [int] NOT NULL,
	[Borrow_ID] [int] NULL,
	[Book_ID] [int] NULL,
	[Start_Date] [nvarchar](50) NULL,
	[End_Date] [nvarchar](50) NULL,
	[Notes] [nvarchar](250) NULL,
 CONSTRAINT [PK_Books_Borrow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books_Data]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books_Data](
	[ID] [int] NOT NULL,
	[Book_Name] [nvarchar](250) NULL,
	[Cat_ID] [int] NULL,
	[Author_ID] [int] NULL,
	[Country_ID] [int] NULL,
	[Dar_ID] [int] NULL,
	[SubCat] [nvarchar](250) NULL,
	[Date] [nvarchar](50) NULL,
	[PagesNumber] [int] NULL,
	[Place_ID] [int] NULL,
	[Book_Statu] [nvarchar](250) NULL,
	[Book_Price] [real] NULL,
	[Notes] [nvarchar](250) NULL,
 CONSTRAINT [PK_Books_Data] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrow]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[Order_ID] [int] NOT NULL,
	[Book_ID] [int] NULL,
	[Borrow_ID] [int] NULL,
	[Start_Date] [nvarchar](50) NULL,
	[End_Date] [nvarchar](50) NULL,
	[Notes] [nvarchar](250) NULL,
 CONSTRAINT [PK_Borrow] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrowers]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrowers](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Notes] [nvarchar](250) NULL,
 CONSTRAINT [PK_Borrowers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dar_Nashr]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dar_Nashr](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_Dar_Nashr] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Places]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Places] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books_Borrow]  WITH CHECK ADD  CONSTRAINT [FK_Books_Borrow_Books_Data] FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Books_Data] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books_Borrow] CHECK CONSTRAINT [FK_Books_Borrow_Books_Data]
GO
ALTER TABLE [dbo].[Books_Borrow]  WITH CHECK ADD  CONSTRAINT [FK_Books_Borrow_Borrowers] FOREIGN KEY([Borrow_ID])
REFERENCES [dbo].[Borrowers] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books_Borrow] CHECK CONSTRAINT [FK_Books_Borrow_Borrowers]
GO
ALTER TABLE [dbo].[Books_Data]  WITH CHECK ADD  CONSTRAINT [FK_Books_Data_Author] FOREIGN KEY([Author_ID])
REFERENCES [dbo].[Author] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books_Data] CHECK CONSTRAINT [FK_Books_Data_Author]
GO
ALTER TABLE [dbo].[Books_Data]  WITH CHECK ADD  CONSTRAINT [FK_Books_Data_Category] FOREIGN KEY([Cat_ID])
REFERENCES [dbo].[Category] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books_Data] CHECK CONSTRAINT [FK_Books_Data_Category]
GO
ALTER TABLE [dbo].[Books_Data]  WITH CHECK ADD  CONSTRAINT [FK_Books_Data_Country] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Country] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books_Data] CHECK CONSTRAINT [FK_Books_Data_Country]
GO
ALTER TABLE [dbo].[Books_Data]  WITH CHECK ADD  CONSTRAINT [FK_Books_Data_Dar_Nashr] FOREIGN KEY([Dar_ID])
REFERENCES [dbo].[Dar_Nashr] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books_Data] CHECK CONSTRAINT [FK_Books_Data_Dar_Nashr]
GO
ALTER TABLE [dbo].[Books_Data]  WITH CHECK ADD  CONSTRAINT [FK_Books_Data_Places] FOREIGN KEY([Place_ID])
REFERENCES [dbo].[Places] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books_Data] CHECK CONSTRAINT [FK_Books_Data_Places]
GO
/****** Object:  StoredProcedure [dbo].[authorDelete]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[authorDelete] @id int 
AS

delete from Author where ID=@id

GO
/****** Object:  StoredProcedure [dbo].[authorDeleteAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[authorDeleteAll]  
AS

delete from Author 

GO
/****** Object:  StoredProcedure [dbo].[AuthoresInsert]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[AuthoresInsert] @id int ,@name nvarchar(250) ,@date nvarchar(50) ,@countryID int 
AS

insert into Author values (@id ,@name , @date ,@countryID)

GO
/****** Object:  StoredProcedure [dbo].[AuthoresUpdate]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[AuthoresUpdate] @id int ,@name nvarchar(250) ,@date nvarchar(50) ,@countryID int 
AS

update  Author set  Name=@name , Date=@date ,CountryID=@countryID where ID=@id

GO
/****** Object:  StoredProcedure [dbo].[authorGetAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[categoryGetAll]    Script Date: 2022/10/20 13:55:08 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO


create PROCEDURE [dbo].[authorGetAll] 
AS

select ID as 'الرقم' ,Name as 'إسم المؤلف', Date as 'التاريخ' , CountryID as 'إسم الدولة' from Author
GO
/****** Object:  StoredProcedure [dbo].[authorGetAllCountryID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[authorGetAllCountryID] 
AS

select * from Author
GO
/****** Object:  StoredProcedure [dbo].[authorGetLastRow]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[authorGetLastRow] 
AS

select count(ID) from Author
GO
/****** Object:  StoredProcedure [dbo].[authorMaxID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[authorMaxID] 
AS

select max(ID) from Author
GO
/****** Object:  StoredProcedure [dbo].[bookDataGetAllCountryID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookDataGetAllCountryID] 
AS

select * from Books_Data
GO
/****** Object:  StoredProcedure [dbo].[bookDataGetAllID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookDataGetAllID] 
AS

select * from Books_Data
GO
/****** Object:  StoredProcedure [dbo].[bookDataGetLastRow]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookDataGetLastRow] 
AS

select count(ID) from Books_Data
GO
/****** Object:  StoredProcedure [dbo].[bookDataInsert]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookDataInsert] @id int ,@book_name nvarchar(250) ,@cat_ID int ,@author_ID int 
,@country_ID int  ,@dar_NashrID int  ,@sub_Cat nvarchar (250) ,@date nvarchar (250) ,@page_Number int  ,
@place_ID int ,@book_Statu nvarchar (250) ,@book_Price real ,@notes nvarchar (250)
AS

insert into Books_Data values (@id ,@book_name , @cat_ID ,@author_ID ,@country_ID ,@dar_NashrID,@sub_Cat,@date,@page_Number,@place_ID,@book_Statu,@book_Price,@notes)

GO
/****** Object:  StoredProcedure [dbo].[bookDataUpdate]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookDataUpdate] @id int ,@book_name nvarchar(250) ,@cat_ID int ,@author_ID int 
,@country_ID int  ,@dar_NashrID int  ,@sub_Cat nvarchar (250) ,@date nvarchar (250) ,@page_Number int  ,
@place_ID int ,@book_Statu nvarchar (250) ,@book_Price real ,@notes nvarchar (250)
AS

update  Books_Data set Book_Name=@book_name , Cat_ID=@cat_ID ,Author_ID=@author_ID ,Country_ID=@country_ID, Dar_ID=@dar_NashrID,SubCat=@sub_Cat,Date=@date,PagesNumber=@page_Number,Place_ID=@place_ID,Book_Statu=@book_Statu,Book_Price=@book_Price,Notes=@notes where ID= @id 

GO
/****** Object:  StoredProcedure [dbo].[bookDelete]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookDelete] @id int 
AS

delete from Books_Data where ID=@id

GO
/****** Object:  StoredProcedure [dbo].[bookDeleteAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[bookDeleteAll]
AS

delete from Books_Data 

GO
/****** Object:  StoredProcedure [dbo].[bookPlaceDelete]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookPlaceDelete] @id int 
AS

delete from Places where ID=@id

GO
/****** Object:  StoredProcedure [dbo].[bookPlaceDeleteAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookPlaceDeleteAll] 
AS

delete from Places 

GO
/****** Object:  StoredProcedure [dbo].[bookPlaceGetAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookPlaceGetAll] 
AS

select ID as 'رقم المكان' ,Name as 'اسم المكان' from Places
GO
/****** Object:  StoredProcedure [dbo].[bookPlaceGetLastRow]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookPlaceGetLastRow] 
AS

select count(ID) from Category
GO
/****** Object:  StoredProcedure [dbo].[bookPlaceInsert]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookPlaceInsert] @id int ,@name nvarchar(250)
AS

insert into Places values (@id ,@name)

GO
/****** Object:  StoredProcedure [dbo].[bookPlaceMaxID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookPlaceMaxID] 
AS

select max(ID) from Places
GO
/****** Object:  StoredProcedure [dbo].[bookPlaceUpdate]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[bookPlaceUpdate] @id int ,@name nvarchar(250)
AS

update Places set  Name=@name where ID=@id
GO
/****** Object:  StoredProcedure [dbo].[booksDataGetAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[booksDataGetAll] 
AS

select * from Books_Data
GO
/****** Object:  StoredProcedure [dbo].[booksGetAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[booksGetAll] 
AS

SELECT [Books_Data].[ID]  as 'رقم الكتاب'
      ,[Book_Name] as 'اسم الكتاب'
      ,Category.Name as 'التصنيف'
      ,Author.Name as 'المؤلف' 
      ,Country.Name as 'الدولة'
      ,Dar_Nashr.Name as 'دار النشر' 
      ,[SubCat] as 'التصنيف الفرعى'
      ,[Books_Data].[Date] as 'تاريخ النشر'
      ,[PagesNumber] as 'عدد الصفحات'
      ,Places.Name as 'مكان الكتاب'
      ,[Book_Statu] as 'حالة الكتاب'
      ,[Book_Price] as 'سعر الكتاب'
      ,[Notes] as 'ملاحظات'
  FROM [dbo].[Books_Data] ,Category,Author,Country,Dar_Nashr,Places where Category.ID=[Books_Data].Cat_ID and Author.ID=[Books_Data].Author_ID and Country.ID=[Books_Data].Country_ID and Dar_Nashr.ID=[Books_Data].Dar_ID and Places.ID=[Books_Data].Place_ID
GO
/****** Object:  StoredProcedure [dbo].[booksGetAllByCat]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[booksGetAllByCat]   @catID int
AS

SELECT [Books_Data].[ID]  as 'رقم الكتاب'
      ,[Book_Name] as 'اسم الكتاب'
      ,Category.Name as 'التصنيف'
      ,Author.Name as 'المؤلف' 
      ,Country.Name as 'الدولة'
      ,Dar_Nashr.Name as 'دار النشر' 
      ,[SubCat] as 'التصنيف الفرعى'
      ,[Books_Data].[Date] as 'تاريخ النشر'
      ,[PagesNumber] as 'عدد الصفحات'
      ,Places.Name as 'مكان الكتاب'
      ,[Book_Statu] as 'حالة الكتاب'
      ,[Book_Price] as 'سعر الكتاب'
      ,[Notes] as 'ملاحظات'
  FROM [dbo].[Books_Data] ,Category,Author,Country,Dar_Nashr,Places where Category.ID=[Books_Data].Cat_ID and Author.ID=[Books_Data].Author_ID and Country.ID=[Books_Data].Country_ID and Dar_Nashr.ID=[Books_Data].Dar_ID and Places.ID=[Books_Data].Place_ID and [Books_Data].Cat_ID=@catID
GO
/****** Object:  StoredProcedure [dbo].[booksGetAllByID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[booksGetAllByID]   @id int
AS

SELECT [Books_Data].[ID]  as 'رقم الكتاب'
      ,[Book_Name] as 'اسم الكتاب'
      ,Category.Name as 'التصنيف'
      ,Author.Name as 'المؤلف' 
      ,Country.Name as 'الدولة'
      ,Dar_Nashr.Name as 'دار النشر' 
      ,[SubCat] as 'التصنيف الفرعى'
      ,[Books_Data].[Date] as 'تاريخ النشر'
      ,[PagesNumber] as 'عدد الصفحات'
      ,Places.Name as 'مكان الكتاب'
      ,[Book_Statu] as 'حالة الكتاب'
      ,[Book_Price] as 'سعر الكتاب'
      ,[Notes] as 'ملاحظات'
  FROM [dbo].[Books_Data] ,Category,Author,Country,Dar_Nashr,Places where Category.ID=[Books_Data].Cat_ID and Author.ID=[Books_Data].Author_ID and Country.ID=[Books_Data].Country_ID and Dar_Nashr.ID=[Books_Data].Dar_ID and Places.ID=[Books_Data].Place_ID and [Books_Data].[ID]=@id
GO
/****** Object:  StoredProcedure [dbo].[booksMaxID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[booksMaxID] 
AS

select max(ID) from Books_Data
GO
/****** Object:  StoredProcedure [dbo].[borroweDelete]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[borroweDelete] @id int 
AS

delete from Borrowers where ID=@id

GO
/****** Object:  StoredProcedure [dbo].[borroweDeleteAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[borroweDeleteAll]
AS

delete from Borrowers 

GO
/****** Object:  StoredProcedure [dbo].[borrowerGetAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[borrowerGetAll] 
AS

select * from Borrowers
GO
/****** Object:  StoredProcedure [dbo].[borrowerInsert]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[borrowerInsert] @id int ,@name nvarchar(250),@address nvarchar(250) ,@phone nvarchar(250) ,@notes nvarchar(250)
AS

insert into Borrowers values (@id ,@name,@phone,@address ,@notes)

GO
/****** Object:  StoredProcedure [dbo].[borrowersGetLastRow]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[borrowersGetLastRow] 
AS

select count(ID) from Borrowers
GO
/****** Object:  StoredProcedure [dbo].[borrowersMaxID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[borrowersMaxID] 
AS

select max(ID) from Borrowers
GO
/****** Object:  StoredProcedure [dbo].[borrowerUpdate]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[borrowerUpdate] @id int ,@name nvarchar(250),@address nvarchar(250) ,@phone nvarchar(250) ,@notes nvarchar(250)
AS

update  Borrowers set Name=@name,Phone=@phone,Address=@address ,Notes=@notes where ID=@id

GO
/****** Object:  StoredProcedure [dbo].[borrowGetAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[borrowGetAll] 
AS

select * from Borrowers
GO
/****** Object:  StoredProcedure [dbo].[borrowGetMaxID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[borrowGetMaxID] 
AS

select max(Order_ID) from Borrow
GO
/****** Object:  StoredProcedure [dbo].[cardMaxID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[cardMaxID] 
AS

select max(ID) from Data_Card
GO
/****** Object:  StoredProcedure [dbo].[categoryDelete]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[categoryDelete] @id int 
AS

delete from Category where ID=@id
GO
/****** Object:  StoredProcedure [dbo].[categoryDeleteAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[categoryDeleteAll] 
AS

delete from Category
GO
/****** Object:  StoredProcedure [dbo].[categoryGetAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[categoryGetAll] 
AS

select ID as 'رقم التصنيف' ,Name as 'اسم التصنيف' from Category
GO
/****** Object:  StoredProcedure [dbo].[categoryGetLastRow]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[categoryGetLastRow] 
AS

select count(ID) from Category
GO
/****** Object:  StoredProcedure [dbo].[categoryInsert]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[categoryInsert] @id int ,@name nvarchar(250)
AS

insert into Category values (@id ,@name)

GO
/****** Object:  StoredProcedure [dbo].[categoryMaxID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[categoryMaxID] 
AS

select max(ID) from Category
GO
/****** Object:  StoredProcedure [dbo].[categoryUpdate]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[categoryUpdate] @id int ,@name nvarchar(250)
AS

update Category set  Name=@name where ID=@id
GO
/****** Object:  StoredProcedure [dbo].[countryDelete]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[countryDelete] @id int 
AS

delete from Country where ID=@id

GO
/****** Object:  StoredProcedure [dbo].[countryDeleteAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[countryDeleteAll] 
AS

delete from Country 

GO
/****** Object:  StoredProcedure [dbo].[countryGetAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[countryGetAll] 
AS

select ID as 'رقم الدولة' ,Name as 'اسم الدولة' from Country
GO
/****** Object:  StoredProcedure [dbo].[countryGetLastRow]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[countryGetLastRow] 
AS

select count(ID) from Country
GO
/****** Object:  StoredProcedure [dbo].[countryInsert]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[countryInsert] @id int ,@name nvarchar(250)
AS

insert into Country values (@id ,@name)

GO
/****** Object:  StoredProcedure [dbo].[countryMaxID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[countryMaxID] 
AS

select max(ID) from Country
GO
/****** Object:  StoredProcedure [dbo].[countryUpdate]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[countryUpdate] @id int ,@name nvarchar(250)
AS

update Country set  Name=@name where ID=@id
GO
/****** Object:  StoredProcedure [dbo].[darNashrauthorGetLastRow]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[darNashrauthorGetLastRow] 
AS

select count(ID) from Dar_Nashr
GO
/****** Object:  StoredProcedure [dbo].[DarnashrDelete]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[DarnashrDelete] @id int 
AS

delete from Dar_Nashr where ID=@id

GO
/****** Object:  StoredProcedure [dbo].[DarnashrDeleteAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[DarnashrDeleteAll]
AS

delete from Dar_Nashr

GO
/****** Object:  StoredProcedure [dbo].[DarNashrGetAll]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[DarNashrGetAll] 
AS

select Dar_Nashr.ID as 'رقم الدار',Dar_Nashr.Name as 'اسم الدار',Country.Name as 'الدولة' from Dar_Nashr,Country where Dar_Nashr.CountryID=Country.ID
GO
/****** Object:  StoredProcedure [dbo].[DarNashrGetAllID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DarNashrGetAllID] 
AS

select * from Dar_Nashr 
GO
/****** Object:  StoredProcedure [dbo].[DarNashrInsert]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[DarNashrInsert] @id int ,@name nvarchar(250) ,@countryID int 
AS

insert into Dar_Nashr values (@id ,@name ,@countryID)

GO
/****** Object:  StoredProcedure [dbo].[DarnashrMaxID]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[DarnashrMaxID] 
AS

select max(ID) from Dar_Nashr
GO
/****** Object:  StoredProcedure [dbo].[DarnashrUpdate]    Script Date: 04/01/2023 7:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[DarnashrUpdate] @id int ,@name nvarchar(250),@countryID int 
AS

update  Dar_Nashr set  Name=@name ,CountryID=@countryID where ID=@id

GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
