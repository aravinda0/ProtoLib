USE [master]
GO
/****** Object:  Database [ProtoLib]    Script Date: 06/07/2011 20:57:25 ******/
CREATE DATABASE [ProtoLib] ON  PRIMARY 
( NAME = N'ProtoLib', FILENAME = N'C:\ProtoLib.mdf' , SIZE = 2688KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProtoLib_log', FILENAME = N'C:\ProtoLib_log.ldf' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProtoLib] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProtoLib].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProtoLib] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ProtoLib] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ProtoLib] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ProtoLib] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ProtoLib] SET ARITHABORT OFF
GO
ALTER DATABASE [ProtoLib] SET AUTO_CLOSE ON
GO
ALTER DATABASE [ProtoLib] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ProtoLib] SET AUTO_SHRINK ON
GO
ALTER DATABASE [ProtoLib] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ProtoLib] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ProtoLib] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ProtoLib] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ProtoLib] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ProtoLib] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ProtoLib] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ProtoLib] SET  DISABLE_BROKER
GO
ALTER DATABASE [ProtoLib] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ProtoLib] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ProtoLib] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ProtoLib] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ProtoLib] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ProtoLib] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ProtoLib] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ProtoLib] SET  READ_WRITE
GO
ALTER DATABASE [ProtoLib] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ProtoLib] SET  MULTI_USER
GO
ALTER DATABASE [ProtoLib] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ProtoLib] SET DB_CHAINING OFF
GO
USE [ProtoLib]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] IDENTITY(100,1) NOT NULL,
	[FirstName] [varchar](200) NOT NULL,
	[MiddleName] [varchar](200) NULL,
	[LastName] [varchar](200) NOT NULL,
	[DateOfBirth] [date] NULL,
	[DateOfDeath] [date] NULL,
	[Nationality] [varchar](100) NULL,
	[AuthorImage] [varchar](600) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Authors] ON
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [DateOfDeath], [Nationality], [AuthorImage]) VALUES (0, N'___NULL___', NULL, N'___NULL___', NULL, NULL, NULL, NULL)
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [DateOfDeath], [Nationality], [AuthorImage]) VALUES (100, N'Aravinda', NULL, N'Rao', CAST(0xF1110B00 AS Date), NULL, N'Indian', NULL)
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [DateOfDeath], [Nationality], [AuthorImage]) VALUES (101, N'Orson', N'Scott', N'Card', CAST(0x2FDA0A00 AS Date), NULL, N'British', NULL)
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [DateOfDeath], [Nationality], [AuthorImage]) VALUES (102, N'Robert', NULL, N'Jordan', CAST(0x1AE10A00 AS Date), CAST(0xDA330B00 AS Date), N'American', NULL)
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [DateOfDeath], [Nationality], [AuthorImage]) VALUES (103, N'Robert', NULL, N'Ludlum', CAST(0xD6D20A00 AS Date), NULL, N'Armenian', NULL)
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [DateOfDeath], [Nationality], [AuthorImage]) VALUES (104, N'Pinky', N'C.', N'Booyah', CAST(0xE0110B00 AS Date), NULL, N'Canadian', NULL)
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [DateOfDeath], [Nationality], [AuthorImage]) VALUES (105, N'Licker', N'Ish', N'Cake', CAST(0xE3110B00 AS Date), CAST(0x4F320B00 AS Date), N'Bolivian', NULL)
SET IDENTITY_INSERT [dbo].[Authors] OFF
/****** Object:  Table [dbo].[Subjects]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] IDENTITY(100,1) NOT NULL,
	[Name] [varchar](300) NOT NULL,
	[ParentSubjectID] [int] NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookStatus]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookStatus](
	[StatusID] [int] IDENTITY(100,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_BookStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BookStatus] ON
INSERT [dbo].[BookStatus] ([StatusID], [Name]) VALUES (100, N'checked out')
INSERT [dbo].[BookStatus] ([StatusID], [Name]) VALUES (101, N'on shelf')
INSERT [dbo].[BookStatus] ([StatusID], [Name]) VALUES (102, N'on hold')
INSERT [dbo].[BookStatus] ([StatusID], [Name]) VALUES (103, N'lost')
INSERT [dbo].[BookStatus] ([StatusID], [Name]) VALUES (104, N'in transit to shelf')
SET IDENTITY_INSERT [dbo].[BookStatus] OFF
/****** Object:  Table [dbo].[Cities]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(100,1) NOT NULL,
	[City] [varchar](200) NOT NULL,
	[StateOrProvince] [varchar](200) NULL,
	[Country] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON
INSERT [dbo].[Cities] ([CityID], [City], [StateOrProvince], [Country]) VALUES (100, N'Delhi', N'Delhi', N'India')
INSERT [dbo].[Cities] ([CityID], [City], [StateOrProvince], [Country]) VALUES (101, N'Mumbai', N'Maharashtra', N'India')
INSERT [dbo].[Cities] ([CityID], [City], [StateOrProvince], [Country]) VALUES (102, N'New York', N'New York', N'USA')
INSERT [dbo].[Cities] ([CityID], [City], [StateOrProvince], [Country]) VALUES (103, N'London', N'London', N'UK')
INSERT [dbo].[Cities] ([CityID], [City], [StateOrProvince], [Country]) VALUES (104, N'Doha', NULL, N'Qatar')
SET IDENTITY_INSERT [dbo].[Cities] OFF
/****** Object:  Table [dbo].[Categories]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(100,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (100, N'science')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (101, N'compilers')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (102, N'cosmology')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (103, N'operating systems')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (104, N'fantasy')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (105, N'black magic')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (106, N'artificial intelligence')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (107, N'history')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (108, N'computer graphics')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (109, N'chemistry')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (110, N'physics')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (111, N'animals')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (112, N'computer networking')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (113, N'poetry')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (114, N'painting')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (115, N'programming')
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Table [dbo].[Contacts]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactID] [int] IDENTITY(100,1) NOT NULL,
	[AddLine1] [varchar](500) NULL,
	[AddLine2] [varchar](500) NULL,
	[AddLine3] [varchar](500) NULL,
	[CityID] [int] NULL,
	[Pin] [varchar](20) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Website] [varchar](100) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON
INSERT [dbo].[Contacts] ([ContactID], [AddLine1], [AddLine2], [AddLine3], [CityID], [Pin], [Phone1], [Phone2], [Email], [Website]) VALUES (100, N'200', N'Palm street', N'Residue', 100, N'2012001', N'234234', N'323349', N'jizz@orl.com', N'www.ooml.com')
INSERT [dbo].[Contacts] ([ContactID], [AddLine1], [AddLine2], [AddLine3], [CityID], [Pin], [Phone1], [Phone2], [Email], [Website]) VALUES (101, N'33', N'good ford', N'noida', 101, N'323131', N'234312', N'1241341', N'lol@yahoo.com', N'www.boomer.com')
INSERT [dbo].[Contacts] ([ContactID], [AddLine1], [AddLine2], [AddLine3], [CityID], [Pin], [Phone1], [Phone2], [Email], [Website]) VALUES (102, N'raster', N'populus', N'good', 101, N'22342', N'234234', N'3423234', N'monster@gmail.com', NULL)
INSERT [dbo].[Contacts] ([ContactID], [AddLine1], [AddLine2], [AddLine3], [CityID], [Pin], [Phone1], [Phone2], [Email], [Website]) VALUES (103, N'ribbon', N'pakoda', N'great', 103, N'234233', N'112341', N'3242323', N'googleit@hotmail.com', N'www.sinister.com')
INSERT [dbo].[Contacts] ([ContactID], [AddLine1], [AddLine2], [AddLine3], [CityID], [Pin], [Phone1], [Phone2], [Email], [Website]) VALUES (104, NULL, NULL, NULL, 104, NULL, N'234234', NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([ContactID], [AddLine1], [AddLine2], [AddLine3], [CityID], [Pin], [Phone1], [Phone2], [Email], [Website]) VALUES (105, NULL, NULL, NULL, 104, NULL, N'234234', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
/****** Object:  Table [dbo].[Branches]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchID] [int] IDENTITY(100,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[ContactID] [int] NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Branches] ON
INSERT [dbo].[Branches] ([BranchID], [Name], [ContactID]) VALUES (100, N'Blue Branch', 100)
INSERT [dbo].[Branches] ([BranchID], [Name], [ContactID]) VALUES (101, N'Pink', 101)
INSERT [dbo].[Branches] ([BranchID], [Name], [ContactID]) VALUES (102, N'Orange', 102)
INSERT [dbo].[Branches] ([BranchID], [Name], [ContactID]) VALUES (103, N'Violet', 103)
SET IDENTITY_INSERT [dbo].[Branches] OFF
/****** Object:  Table [dbo].[Publishers]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherID] [int] IDENTITY(100,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[ContactID] [int] NOT NULL,
	[PublisherLogo] [varchar](600) NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Publishers] ON
INSERT [dbo].[Publishers] ([PublisherID], [Name], [ContactID], [PublisherLogo]) VALUES (0, N'___NULL___', 100, NULL)
INSERT [dbo].[Publishers] ([PublisherID], [Name], [ContactID], [PublisherLogo]) VALUES (100, N'Apress', 100, NULL)
INSERT [dbo].[Publishers] ([PublisherID], [Name], [ContactID], [PublisherLogo]) VALUES (101, N'Wrox', 101, NULL)
INSERT [dbo].[Publishers] ([PublisherID], [Name], [ContactID], [PublisherLogo]) VALUES (102, N'OReilly', 102, NULL)
INSERT [dbo].[Publishers] ([PublisherID], [Name], [ContactID], [PublisherLogo]) VALUES (103, N'Pearson', 103, NULL)
SET IDENTITY_INSERT [dbo].[Publishers] OFF
/****** Object:  Table [dbo].[Members]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Members](
	[MemberID] [int] IDENTITY(100,1) NOT NULL,
	[ContactID] [int] NULL,
	[FirstName] [varchar](200) NOT NULL,
	[MiddleName] [varchar](200) NULL,
	[LastName] [varchar](200) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [varchar](20) NULL,
	[JoinDate] [date] NOT NULL,
	[Portrait] [varchar](600) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON
INSERT [dbo].[Members] ([MemberID], [ContactID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [Gender], [JoinDate], [Portrait]) VALUES (100, 101, N'Ace', N'Or', N'Dude', CAST(0xF1110B00 AS Date), N'male', CAST(0x8A320B00 AS Date), NULL)
INSERT [dbo].[Members] ([MemberID], [ContactID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [Gender], [JoinDate], [Portrait]) VALUES (101, 100, N'Rina', NULL, N'Rose', CAST(0xE0110B00 AS Date), N'female', CAST(0xE0110B00 AS Date), NULL)
INSERT [dbo].[Members] ([MemberID], [ContactID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [Gender], [JoinDate], [Portrait]) VALUES (102, 102, N'Joos', N'The', N'Bomb', CAST(0xFEC50A00 AS Date), N'male', CAST(0xBB220B00 AS Date), NULL)
INSERT [dbo].[Members] ([MemberID], [ContactID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [Gender], [JoinDate], [Portrait]) VALUES (103, 103, N'Death', N'Break', N'Skullo', CAST(0x12130B00 AS Date), N'male', CAST(0x9A220B00 AS Date), NULL)
INSERT [dbo].[Members] ([MemberID], [ContactID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [Gender], [JoinDate], [Portrait]) VALUES (104, 100, N'Rini', NULL, N'Goo', CAST(0x30210B00 AS Date), N'female', CAST(0x95250B00 AS Date), NULL)
INSERT [dbo].[Members] ([MemberID], [ContactID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [Gender], [JoinDate], [Portrait]) VALUES (105, 104, N'Slooth', NULL, N'jooth', NULL, N'male', CAST(0x00000000 AS Date), NULL)
INSERT [dbo].[Members] ([MemberID], [ContactID], [FirstName], [MiddleName], [LastName], [DateOfBirth], [Gender], [JoinDate], [Portrait]) VALUES (106, 105, N'Slooth', NULL, N'jooth', NULL, N'male', CAST(0x00000000 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Members] OFF
/****** Object:  Table [dbo].[StaffAccounts]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffAccounts](
	[AccountID] [int] IDENTITY(100,1) NOT NULL,
	[UserName] [varchar](200) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[MemberID] [int] NOT NULL,
	[ClearanceLevel] [int] NOT NULL,
 CONSTRAINT [PK_StaffAccounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StaffAccounts] ON
INSERT [dbo].[StaffAccounts] ([AccountID], [UserName], [Password], [MemberID], [ClearanceLevel]) VALUES (102, N'ace', N'ace', 100, 1000)
SET IDENTITY_INSERT [dbo].[StaffAccounts] OFF
/****** Object:  Table [dbo].[BookInfo]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookInfo](
	[BookInfoID] [int] IDENTITY(100,1) NOT NULL,
	[ISBN13] [varchar](15) NULL,
	[ISBN10] [varchar](15) NULL,
	[Title] [varchar](500) NOT NULL,
	[TitleLong] [varchar](1000) NULL,
	[PublisherID] [int] NULL,
	[EditionNumber] [int] NULL,
	[EditionName] [varchar](300) NULL,
	[Printing] [int] NULL,
	[Language] [varchar](200) NULL,
	[CoverImage] [varchar](300) NULL,
	[DatePublished] [date] NULL,
	[AmazonLink] [varchar](1000) NULL,
	[Summary] [varchar](max) NULL,
	[Notes] [varchar](max) NULL,
 CONSTRAINT [PK_BookInfo_1] PRIMARY KEY CLUSTERED 
(
	[BookInfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_isbn10_notnull] ON [dbo].[BookInfo] 
(
	[ISBN10] ASC
)
WHERE ([ISBN10] IS NOT NULL)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_isbn13_notnull] ON [dbo].[BookInfo] 
(
	[ISBN13] ASC
)
WHERE ([ISBN13] IS NOT NULL)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookInfo] ON
INSERT [dbo].[BookInfo] ([BookInfoID], [ISBN13], [ISBN10], [Title], [TitleLong], [PublisherID], [EditionNumber], [EditionName], [Printing], [Language], [CoverImage], [DatePublished], [AmazonLink], [Summary], [Notes]) VALUES (122, NULL, NULL, N'dddd', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BookInfo] ([BookInfoID], [ISBN13], [ISBN10], [Title], [TitleLong], [PublisherID], [EditionNumber], [EditionName], [Printing], [Language], [CoverImage], [DatePublished], [AmazonLink], [Summary], [Notes]) VALUES (123, NULL, NULL, N'Dummy book', NULL, 0, 2, N'Super ed', 3, N'French', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BookInfo] ([BookInfoID], [ISBN13], [ISBN10], [Title], [TitleLong], [PublisherID], [EditionNumber], [EditionName], [Printing], [Language], [CoverImage], [DatePublished], [AmazonLink], [Summary], [Notes]) VALUES (124, NULL, NULL, N'Okali dokali mang', NULL, 0, 3, N'Wghoa!', 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BookInfo] ([BookInfoID], [ISBN13], [ISBN10], [Title], [TitleLong], [PublisherID], [EditionNumber], [EditionName], [Printing], [Language], [CoverImage], [DatePublished], [AmazonLink], [Summary], [Notes]) VALUES (125, N'123', N'24', N'Ziggeh!', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BookInfo] ([BookInfoID], [ISBN13], [ISBN10], [Title], [TitleLong], [PublisherID], [EditionNumber], [EditionName], [Printing], [Language], [CoverImage], [DatePublished], [AmazonLink], [Summary], [Notes]) VALUES (126, NULL, NULL, N'Labyrintha', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BookInfo] OFF
/****** Object:  Table [dbo].[BooksBySubject]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksBySubject](
	[BookInfoID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
 CONSTRAINT [PK_BooksBySubject] PRIMARY KEY CLUSTERED 
(
	[BookInfoID] ASC,
	[SubjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksByCategory]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksByCategory](
	[BookInfoID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_BooksByCategory] PRIMARY KEY CLUSTERED 
(
	[BookInfoID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksByAuthor]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksByAuthor](
	[BookInfoID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
 CONSTRAINT [PK_BooksByAuthor] PRIMARY KEY CLUSTERED 
(
	[BookInfoID] ASC,
	[AuthorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookPhysicalInfo]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookPhysicalInfo](
	[BookInfoID] [int] NOT NULL,
	[Pages] [int] NULL,
	[Height] [float] NULL,
	[Width] [float] NULL,
	[Thickness] [float] NULL,
	[Weight] [float] NULL,
 CONSTRAINT [PK_BookPhysicalInfo] PRIMARY KEY CLUSTERED 
(
	[BookInfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BookPhysicalInfo] ([BookInfoID], [Pages], [Height], [Width], [Thickness], [Weight]) VALUES (122, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BookPhysicalInfo] ([BookInfoID], [Pages], [Height], [Width], [Thickness], [Weight]) VALUES (123, 33, NULL, NULL, NULL, NULL)
INSERT [dbo].[BookPhysicalInfo] ([BookInfoID], [Pages], [Height], [Width], [Thickness], [Weight]) VALUES (124, 23, 3, NULL, NULL, NULL)
INSERT [dbo].[BookPhysicalInfo] ([BookInfoID], [Pages], [Height], [Width], [Thickness], [Weight]) VALUES (125, NULL, 3, 5, 6, NULL)
INSERT [dbo].[BookPhysicalInfo] ([BookInfoID], [Pages], [Height], [Width], [Thickness], [Weight]) VALUES (126, 4, NULL, 5, NULL, NULL)
/****** Object:  Table [dbo].[LibraryBooks]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LibraryBooks](
	[BookID] [int] IDENTITY(100,1) NOT NULL,
	[BookInfoID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Price] [int] NULL,
	[ObtainedFrom] [varchar](200) NULL,
	[BranchID] [int] NOT NULL,
 CONSTRAINT [PK_LibraryBooks] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountPrefs]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountPrefs](
	[AccountID] [int] NOT NULL,
	[CacheSize] [int] NOT NULL,
	[SearchResultsPageSize] [int] NOT NULL,
	[FullScreenMode] [varchar](20) NOT NULL,
 CONSTRAINT [PK_AccountPrefs] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AccountPrefs] ([AccountID], [CacheSize], [SearchResultsPageSize], [FullScreenMode]) VALUES (102, 5, 20, N'true')
/****** Object:  Table [dbo].[Transactions]    Script Date: 06/07/2011 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(100,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[CheckedOutOn] [datetime] NOT NULL,
	[ReturnedOn] [datetime] NULL,
	[Fine] [float] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Subjects_ParentSubjectID]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[Subjects] ADD  CONSTRAINT [DF_Subjects_ParentSubjectID]  DEFAULT ((0)) FOR [ParentSubjectID]
GO
/****** Object:  Check [isbn_both_null]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[BookInfo]  WITH CHECK ADD  CONSTRAINT [isbn_both_null] CHECK  (([ISBN13] IS NULL AND [ISBN10] IS NULL OR [ISBN13] IS NOT NULL AND [ISBN10] IS NOT NULL OR [ISBN13] IS NOT NULL AND [ISBN10] IS NULL))
GO
ALTER TABLE [dbo].[BookInfo] CHECK CONSTRAINT [isbn_both_null]
GO
/****** Object:  ForeignKey [FK_Subjects_Subjects]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Subjects] FOREIGN KEY([ParentSubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Subjects]
GO
/****** Object:  ForeignKey [FK_Contacts_Cities]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_Cities]
GO
/****** Object:  ForeignKey [FK_Branches_Contacts]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Contacts] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ContactID])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Contacts]
GO
/****** Object:  ForeignKey [FK_Publishers_Contacts]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[Publishers]  WITH CHECK ADD  CONSTRAINT [FK_Publishers_Contacts] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ContactID])
GO
ALTER TABLE [dbo].[Publishers] CHECK CONSTRAINT [FK_Publishers_Contacts]
GO
/****** Object:  ForeignKey [FK_Members_Contacts]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Contacts] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ContactID])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Contacts]
GO
/****** Object:  ForeignKey [FK_StaffAccounts_Members]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[StaffAccounts]  WITH CHECK ADD  CONSTRAINT [FK_StaffAccounts_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[StaffAccounts] CHECK CONSTRAINT [FK_StaffAccounts_Members]
GO
/****** Object:  ForeignKey [FK_BookInfo_Publishers]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[BookInfo]  WITH CHECK ADD  CONSTRAINT [FK_BookInfo_Publishers] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publishers] ([PublisherID])
GO
ALTER TABLE [dbo].[BookInfo] CHECK CONSTRAINT [FK_BookInfo_Publishers]
GO
/****** Object:  ForeignKey [FK_BooksBySubject_BookInfo]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[BooksBySubject]  WITH CHECK ADD  CONSTRAINT [FK_BooksBySubject_BookInfo] FOREIGN KEY([BookInfoID])
REFERENCES [dbo].[BookInfo] ([BookInfoID])
GO
ALTER TABLE [dbo].[BooksBySubject] CHECK CONSTRAINT [FK_BooksBySubject_BookInfo]
GO
/****** Object:  ForeignKey [FK_BooksBySubject_Subjects]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[BooksBySubject]  WITH CHECK ADD  CONSTRAINT [FK_BooksBySubject_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[BooksBySubject] CHECK CONSTRAINT [FK_BooksBySubject_Subjects]
GO
/****** Object:  ForeignKey [FK_BooksByCategory_BookInfo]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[BooksByCategory]  WITH CHECK ADD  CONSTRAINT [FK_BooksByCategory_BookInfo] FOREIGN KEY([BookInfoID])
REFERENCES [dbo].[BookInfo] ([BookInfoID])
GO
ALTER TABLE [dbo].[BooksByCategory] CHECK CONSTRAINT [FK_BooksByCategory_BookInfo]
GO
/****** Object:  ForeignKey [FK_BooksByCategory_Categories]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[BooksByCategory]  WITH CHECK ADD  CONSTRAINT [FK_BooksByCategory_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[BooksByCategory] CHECK CONSTRAINT [FK_BooksByCategory_Categories]
GO
/****** Object:  ForeignKey [FK_BooksByAuthor_Authors]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[BooksByAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BooksByAuthor_Authors] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[BooksByAuthor] CHECK CONSTRAINT [FK_BooksByAuthor_Authors]
GO
/****** Object:  ForeignKey [FK_BooksByAuthor_BookInfo]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[BooksByAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BooksByAuthor_BookInfo] FOREIGN KEY([BookInfoID])
REFERENCES [dbo].[BookInfo] ([BookInfoID])
GO
ALTER TABLE [dbo].[BooksByAuthor] CHECK CONSTRAINT [FK_BooksByAuthor_BookInfo]
GO
/****** Object:  ForeignKey [FK_BookPhysicalInfo_BookInfo1]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[BookPhysicalInfo]  WITH CHECK ADD  CONSTRAINT [FK_BookPhysicalInfo_BookInfo1] FOREIGN KEY([BookInfoID])
REFERENCES [dbo].[BookInfo] ([BookInfoID])
GO
ALTER TABLE [dbo].[BookPhysicalInfo] CHECK CONSTRAINT [FK_BookPhysicalInfo_BookInfo1]
GO
/****** Object:  ForeignKey [FK_LibraryBooks_BookInfo]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[LibraryBooks]  WITH CHECK ADD  CONSTRAINT [FK_LibraryBooks_BookInfo] FOREIGN KEY([BookInfoID])
REFERENCES [dbo].[BookInfo] ([BookInfoID])
GO
ALTER TABLE [dbo].[LibraryBooks] CHECK CONSTRAINT [FK_LibraryBooks_BookInfo]
GO
/****** Object:  ForeignKey [FK_LibraryBooks_BookStatus]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[LibraryBooks]  WITH CHECK ADD  CONSTRAINT [FK_LibraryBooks_BookStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[BookStatus] ([StatusID])
GO
ALTER TABLE [dbo].[LibraryBooks] CHECK CONSTRAINT [FK_LibraryBooks_BookStatus]
GO
/****** Object:  ForeignKey [FK_LibraryBooks_Branches]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[LibraryBooks]  WITH CHECK ADD  CONSTRAINT [FK_LibraryBooks_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([BranchID])
GO
ALTER TABLE [dbo].[LibraryBooks] CHECK CONSTRAINT [FK_LibraryBooks_Branches]
GO
/****** Object:  ForeignKey [FK_AccountPrefs_StaffAccounts]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[AccountPrefs]  WITH CHECK ADD  CONSTRAINT [FK_AccountPrefs_StaffAccounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[StaffAccounts] ([AccountID])
GO
ALTER TABLE [dbo].[AccountPrefs] CHECK CONSTRAINT [FK_AccountPrefs_StaffAccounts]
GO
/****** Object:  ForeignKey [FK_Transactions_LibraryBooks]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_LibraryBooks] FOREIGN KEY([BookID])
REFERENCES [dbo].[LibraryBooks] ([BookID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_LibraryBooks]
GO
/****** Object:  ForeignKey [FK_Transactions_Members]    Script Date: 06/07/2011 20:57:28 ******/
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Members]
GO
