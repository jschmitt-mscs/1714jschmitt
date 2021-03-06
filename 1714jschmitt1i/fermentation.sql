USE [master]
GO
/****** Object:  Database [Fermentation]    Script Date: 9/24/2020 7:51:30 PM ******/
CREATE DATABASE [Fermentation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fermentation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Fermentation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fermentation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Fermentation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Fermentation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fermentation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fermentation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fermentation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fermentation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fermentation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fermentation] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fermentation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fermentation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fermentation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fermentation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fermentation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fermentation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fermentation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fermentation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fermentation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fermentation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fermentation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fermentation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fermentation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fermentation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fermentation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fermentation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fermentation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fermentation] SET RECOVERY FULL 
GO
ALTER DATABASE [Fermentation] SET  MULTI_USER 
GO
ALTER DATABASE [Fermentation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fermentation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fermentation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fermentation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fermentation] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Fermentation', N'ON'
GO
ALTER DATABASE [Fermentation] SET QUERY_STORE = OFF
GO
USE [Fermentation]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/24/2020 7:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommenterID] [int] NOT NULL,
	[CommentTitle] [varchar](50) NOT NULL,
	[CommentText] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 9/24/2020 7:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[IngredientID] [int] IDENTITY(1,1) NOT NULL,
	[IngredientDescription] [nvarchar](50) NOT NULL,
	[IngredientAmount] [nvarchar](50) NOT NULL,
	[UOfMId] [int] NOT NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/24/2020 7:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](10) NOT NULL,
	[LastName] [varchar](10) NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phLog]    Script Date: 9/24/2020 7:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[RecipeID] [int] NULL,
	[Date] [smalldatetime] NULL,
	[phReading] [decimal](10, 2) NULL,
	[CommentID] [int] NULL,
 CONSTRAINT [PK_phLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 9/24/2020 7:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[RecipeID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorID] [int] NOT NULL,
	[RecipeName] [varchar](50) NOT NULL,
	[RecipeDescription] [varchar](100) NOT NULL,
	[creationDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeIngredient]    Script Date: 9/24/2020 7:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeIngredient](
	[RecipeIngredientID] [int] IDENTITY(1,1) NOT NULL,
	[IngredientID] [int] NOT NULL,
	[StepID] [int] NOT NULL,
 CONSTRAINT [PK_RecipeIngredient] PRIMARY KEY CLUSTERED 
(
	[RecipeIngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeReview]    Script Date: 9/24/2020 7:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeReview](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[CommentID] [int] NOT NULL,
	[RecipeID] [int] NOT NULL,
	[RecipeRating] [int] NOT NULL,
 CONSTRAINT [PK_RecipeReview] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeStep]    Script Date: 9/24/2020 7:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeStep](
	[RecipeStepID] [int] IDENTITY(1,1) NOT NULL,
	[RecipeID] [int] NOT NULL,
	[StepTitle] [varchar](50) NOT NULL,
	[StepDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_RecipeStep] PRIMARY KEY CLUSTERED 
(
	[RecipeStepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UofM]    Script Date: 9/24/2020 7:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UofM](
	[UnitOfMeasureID] [int] IDENTITY(1,1) NOT NULL,
	[UnitOfMeasureText] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UofM] PRIMARY KEY CLUSTERED 
(
	[UnitOfMeasureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [CommenterID], [CommentTitle], [CommentText]) VALUES (2, 1, N'Day 1 - Jalapeno ', N'On the first day it is not acidic')
INSERT [dbo].[Comment] ([CommentID], [CommenterID], [CommentTitle], [CommentText]) VALUES (3, 1, N'Day 4 Jalapeno', N'On Day 4, it is tastic a bit acidic. There is a fair amount of activity')
INSERT [dbo].[Comment] ([CommentID], [CommenterID], [CommentTitle], [CommentText]) VALUES (4, 1, N'Day 12', N'Day 12 has a lot of bubbling activity and is tasting acidic')
INSERT [dbo].[Comment] ([CommentID], [CommenterID], [CommentTitle], [CommentText]) VALUES (5, 3, N'Recipe is Tasty', N'I tried this one my self, so far so good')
INSERT [dbo].[Comment] ([CommentID], [CommenterID], [CommentTitle], [CommentText]) VALUES (6, 5, N'Not Great', N'Who even likes Sauerkraut?')
INSERT [dbo].[Comment] ([CommentID], [CommenterID], [CommentTitle], [CommentText]) VALUES (7, 6, N'Habenero is Hot', N'These peppers are spicy')
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredient] ON 

INSERT [dbo].[Ingredient] ([IngredientID], [IngredientDescription], [IngredientAmount], [UOfMId]) VALUES (1, N'Garlic', N'100', 1)
INSERT [dbo].[Ingredient] ([IngredientID], [IngredientDescription], [IngredientAmount], [UOfMId]) VALUES (2, N'Jalapeno', N'300', 1)
INSERT [dbo].[Ingredient] ([IngredientID], [IngredientDescription], [IngredientAmount], [UOfMId]) VALUES (3, N'Water', N'8', 3)
INSERT [dbo].[Ingredient] ([IngredientID], [IngredientDescription], [IngredientAmount], [UOfMId]) VALUES (4, N'Water', N'1', 4)
INSERT [dbo].[Ingredient] ([IngredientID], [IngredientDescription], [IngredientAmount], [UOfMId]) VALUES (5, N'Habenero', N'200', 1)
INSERT [dbo].[Ingredient] ([IngredientID], [IngredientDescription], [IngredientAmount], [UOfMId]) VALUES (6, N'Cabbage', N'500', 1)
INSERT [dbo].[Ingredient] ([IngredientID], [IngredientDescription], [IngredientAmount], [UOfMId]) VALUES (7, N'Salt', N'30', 1)
INSERT [dbo].[Ingredient] ([IngredientID], [IngredientDescription], [IngredientAmount], [UOfMId]) VALUES (8, N'Juice', N'1', 4)
INSERT [dbo].[Ingredient] ([IngredientID], [IngredientDescription], [IngredientAmount], [UOfMId]) VALUES (9, N'Yeast', N'7', 1)
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [EmailAddress]) VALUES (1, N'Joe', N'Schmitt', N'13jeschmitt@gmail.com')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [EmailAddress]) VALUES (2, N'Allison', N'Haan', N'ahaan13@winona.edu')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [EmailAddress]) VALUES (3, N'Mark', N'Swanson', N'mswanson@go.minnstate.edu')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [EmailAddress]) VALUES (4, N'Steve', N'Blob', N'steve@blob.com')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [EmailAddress]) VALUES (5, N'Sean', N'Jame', N'sean@gmail.com')
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [EmailAddress]) VALUES (6, N'Rene', N'Redzepi', N'rene@noma.com')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[phLog] ON 

INSERT [dbo].[phLog] ([LogID], [RecipeID], [Date], [phReading], [CommentID]) VALUES (1, 2, CAST(N'2020-09-01T00:00:00' AS SmallDateTime), CAST(7.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[phLog] ([LogID], [RecipeID], [Date], [phReading], [CommentID]) VALUES (2, 2, CAST(N'2020-09-05T00:00:00' AS SmallDateTime), CAST(6.15 AS Decimal(10, 2)), 2)
INSERT [dbo].[phLog] ([LogID], [RecipeID], [Date], [phReading], [CommentID]) VALUES (3, 2, CAST(N'2020-09-13T00:00:00' AS SmallDateTime), CAST(5.00 AS Decimal(10, 2)), 3)
SET IDENTITY_INSERT [dbo].[phLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipe] ON 

INSERT [dbo].[Recipe] ([RecipeID], [AuthorID], [RecipeName], [RecipeDescription], [creationDate]) VALUES (1, 1, N'Sauerkraut', N'Simple sauerkraut recipe', CAST(N'2020-09-24T00:00:00' AS SmallDateTime))
INSERT [dbo].[Recipe] ([RecipeID], [AuthorID], [RecipeName], [RecipeDescription], [creationDate]) VALUES (2, 2, N'Jalapeno Hot Sauce', N'Tasty Jalapeno Hot Sauce', CAST(N'2020-09-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Recipe] ([RecipeID], [AuthorID], [RecipeName], [RecipeDescription], [creationDate]) VALUES (3, 1, N'Habenero Garlic', N'Garlic Habenero Recipe', CAST(N'2020-08-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Recipe] ([RecipeID], [AuthorID], [RecipeName], [RecipeDescription], [creationDate]) VALUES (4, 3, N'Walmart Wine', N'Wine made from Walmart Ingredients', CAST(N'2020-09-20T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Recipe] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeIngredient] ON 

INSERT [dbo].[RecipeIngredient] ([RecipeIngredientID], [IngredientID], [StepID]) VALUES (1, 6, 2)
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientID], [IngredientID], [StepID]) VALUES (2, 7, 4)
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientID], [IngredientID], [StepID]) VALUES (3, 2, 7)
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientID], [IngredientID], [StepID]) VALUES (4, 7, 11)
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientID], [IngredientID], [StepID]) VALUES (5, 3, 10)
SET IDENTITY_INSERT [dbo].[RecipeIngredient] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeReview] ON 

INSERT [dbo].[RecipeReview] ([ReviewID], [CommentID], [RecipeID], [RecipeRating]) VALUES (1, 5, 2, 5)
INSERT [dbo].[RecipeReview] ([ReviewID], [CommentID], [RecipeID], [RecipeRating]) VALUES (2, 6, 1, 1)
INSERT [dbo].[RecipeReview] ([ReviewID], [CommentID], [RecipeID], [RecipeRating]) VALUES (3, 7, 3, 4)
SET IDENTITY_INSERT [dbo].[RecipeReview] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeStep] ON 

INSERT [dbo].[RecipeStep] ([RecipeStepID], [RecipeID], [StepTitle], [StepDescription]) VALUES (1, 1, N'Sauerkraut Prep', N'Gather your ingredients')
INSERT [dbo].[RecipeStep] ([RecipeStepID], [RecipeID], [StepTitle], [StepDescription]) VALUES (2, 1, N'Dice Cabbage', N'Dice the cabbage finely')
INSERT [dbo].[RecipeStep] ([RecipeStepID], [RecipeID], [StepTitle], [StepDescription]) VALUES (3, 1, N'Cabbage in Crock', N'Stick your Cabbage in a Crock')
INSERT [dbo].[RecipeStep] ([RecipeStepID], [RecipeID], [StepTitle], [StepDescription]) VALUES (4, 1, N'Add Salt', N'Add your salt to your crock')
INSERT [dbo].[RecipeStep] ([RecipeStepID], [RecipeID], [StepTitle], [StepDescription]) VALUES (5, 1, N'Wait', N'Wait for a few days as Sauerkraut is created')
INSERT [dbo].[RecipeStep] ([RecipeStepID], [RecipeID], [StepTitle], [StepDescription]) VALUES (6, 2, N'Jalapeno Prep', N'Gather your ingredients')
INSERT [dbo].[RecipeStep] ([RecipeStepID], [RecipeID], [StepTitle], [StepDescription]) VALUES (7, 2, N'Chopping Veggies', N'Dice peppers finely')
INSERT [dbo].[RecipeStep] ([RecipeStepID], [RecipeID], [StepTitle], [StepDescription]) VALUES (9, 2, N'Mason Jar', N'Place Peppers in Mason Jar')
INSERT [dbo].[RecipeStep] ([RecipeStepID], [RecipeID], [StepTitle], [StepDescription]) VALUES (10, 2, N'Water', N'Add Water to mason Jar')
INSERT [dbo].[RecipeStep] ([RecipeStepID], [RecipeID], [StepTitle], [StepDescription]) VALUES (11, 2, N'Salt', N'add Salt to Mason Jar')
SET IDENTITY_INSERT [dbo].[RecipeStep] OFF
GO
SET IDENTITY_INSERT [dbo].[UofM] ON 

INSERT [dbo].[UofM] ([UnitOfMeasureID], [UnitOfMeasureText]) VALUES (1, N'Gram(s)')
INSERT [dbo].[UofM] ([UnitOfMeasureID], [UnitOfMeasureText]) VALUES (2, N'Pound(s)')
INSERT [dbo].[UofM] ([UnitOfMeasureID], [UnitOfMeasureText]) VALUES (3, N'Ounce(s)')
INSERT [dbo].[UofM] ([UnitOfMeasureID], [UnitOfMeasureText]) VALUES (4, N'Gallon(s)')
SET IDENTITY_INSERT [dbo].[UofM] OFF
GO
USE [master]
GO
ALTER DATABASE [Fermentation] SET  READ_WRITE 
GO
