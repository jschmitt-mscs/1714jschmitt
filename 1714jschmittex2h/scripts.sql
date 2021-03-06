USE [master]
GO
/****** Object:  Database [Fermentation2]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE DATABASE [Fermentation2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fermentation2', FILENAME = N'C:\Users\Joe\Documents\SQL Server Management Studio\1714jeschmitt\1714jschmitt\1714jschmitt2h\AppData\Fermentation2.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Fermentation2_log', FILENAME = N'C:\Users\Joe\Documents\SQL Server Management Studio\1714jeschmitt\1714jschmitt\1714jschmitt2h\AppData\Fermentation2_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Fermentation2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fermentation2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fermentation2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fermentation2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fermentation2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fermentation2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fermentation2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fermentation2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Fermentation2] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [Fermentation2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fermentation2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fermentation2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fermentation2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fermentation2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fermentation2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fermentation2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fermentation2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Fermentation2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fermentation2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fermentation2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fermentation2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fermentation2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fermentation2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fermentation2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fermentation2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fermentation2] SET  MULTI_USER 
GO
ALTER DATABASE [Fermentation2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fermentation2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fermentation2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fermentation2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Fermentation2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Fermentation2]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11/6/2020 7:26:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentTitle] [nvarchar](75) NOT NULL,
	[CommentText] [nvarchar](250) NOT NULL,
	[CommentDate] [datetime] NOT NULL,
	[Person_Id] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients1]    Script Date: 11/6/2020 7:26:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients1](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IngredientDescription] [nvarchar](max) NOT NULL,
	[IngredientAmount] [nvarchar](max) NOT NULL,
	[UofM_Id] [int] NOT NULL,
 CONSTRAINT [PK_Ingredients1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 11/6/2020 7:26:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[EmailAddress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhLogs]    Script Date: 11/6/2020 7:26:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[phReading] [decimal](18, 0) NOT NULL,
	[Recipe_Id] [int] NOT NULL,
	[Comment_Id] [int] NOT NULL,
 CONSTRAINT [PK_PhLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeIngredients]    Script Date: 11/6/2020 7:26:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeIngredients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecipeStep_Id] [int] NOT NULL,
	[Ingredient_Id] [int] NOT NULL,
 CONSTRAINT [PK_RecipeIngredients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeReviews]    Script Date: 11/6/2020 7:26:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeReviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecipeRating] [int] NOT NULL,
	[Comment_Id] [int] NOT NULL,
	[Recipe_Id] [int] NOT NULL,
 CONSTRAINT [PK_RecipeReviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 11/6/2020 7:26:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecipeName] [nvarchar](75) NOT NULL,
	[RecipeDescription] [nvarchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Person_Id] [int] NOT NULL,
 CONSTRAINT [PK_Recipes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeSteps]    Script Date: 11/6/2020 7:26:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeSteps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StepTitle] [nvarchar](max) NOT NULL,
	[StepDescription] [nvarchar](max) NOT NULL,
	[Recipe_Id] [int] NOT NULL,
 CONSTRAINT [PK_RecipeSteps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UofMs]    Script Date: 11/6/2020 7:26:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UofMs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UofMDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UofMs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CommentTitle], [CommentText], [CommentDate], [Person_Id]) VALUES (1, N'Great Sauce', N'Wow this is cool', CAST(N'2020-11-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([Id], [CommentTitle], [CommentText], [CommentDate], [Person_Id]) VALUES (2, N'Neato', N'how awesome is this', CAST(N'2020-11-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Comments] ([Id], [CommentTitle], [CommentText], [CommentDate], [Person_Id]) VALUES (3, N'Slight Tang', N'the sauce is slightly tangy', CAST(N'2020-10-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Comments] ([Id], [CommentTitle], [CommentText], [CommentDate], [Person_Id]) VALUES (4, N'more sour', N'the sauce is getting more sour', CAST(N'2020-10-14T00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredients1] ON 

INSERT [dbo].[Ingredients1] ([Id], [IngredientDescription], [IngredientAmount], [UofM_Id]) VALUES (1, N'Water', N'4', 2)
INSERT [dbo].[Ingredients1] ([Id], [IngredientDescription], [IngredientAmount], [UofM_Id]) VALUES (3, N'Salt', N'4', 1)
INSERT [dbo].[Ingredients1] ([Id], [IngredientDescription], [IngredientAmount], [UofM_Id]) VALUES (4, N'Carrot', N'100', 2)
INSERT [dbo].[Ingredients1] ([Id], [IngredientDescription], [IngredientAmount], [UofM_Id]) VALUES (5, N'Jalapeno', N'100', 2)
SET IDENTITY_INSERT [dbo].[Ingredients1] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [EmailAddress]) VALUES (1, N'Joe', N'Schmitt', N'13jeschmitt@gmail.com')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [EmailAddress]) VALUES (2, N'Allison', N'Haan', N'ahaan13@gmail.com')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [EmailAddress]) VALUES (3, N'Robert', N'Paulson', N'robert@paulson.com')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [EmailAddress]) VALUES (4, N'Steve', N'Vaughn', N'stevie@guitarcenter.com')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [EmailAddress]) VALUES (5, N'Willie', N'Nelson', N'willie@nelson.com')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[PhLogs] ON 

INSERT [dbo].[PhLogs] ([Id], [phReading], [Recipe_Id], [Comment_Id]) VALUES (1, CAST(6 AS Decimal(18, 0)), 1, 3)
INSERT [dbo].[PhLogs] ([Id], [phReading], [Recipe_Id], [Comment_Id]) VALUES (2, CAST(5 AS Decimal(18, 0)), 1, 4)
SET IDENTITY_INSERT [dbo].[PhLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeIngredients] ON 

INSERT [dbo].[RecipeIngredients] ([Id], [RecipeStep_Id], [Ingredient_Id]) VALUES (1, 1, 1)
INSERT [dbo].[RecipeIngredients] ([Id], [RecipeStep_Id], [Ingredient_Id]) VALUES (3, 1, 3)
INSERT [dbo].[RecipeIngredients] ([Id], [RecipeStep_Id], [Ingredient_Id]) VALUES (4, 4, 1)
INSERT [dbo].[RecipeIngredients] ([Id], [RecipeStep_Id], [Ingredient_Id]) VALUES (5, 4, 3)
INSERT [dbo].[RecipeIngredients] ([Id], [RecipeStep_Id], [Ingredient_Id]) VALUES (6, 4, 5)
SET IDENTITY_INSERT [dbo].[RecipeIngredients] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeReviews] ON 

INSERT [dbo].[RecipeReviews] ([Id], [RecipeRating], [Comment_Id], [Recipe_Id]) VALUES (1, 5, 1, 1)
INSERT [dbo].[RecipeReviews] ([Id], [RecipeRating], [Comment_Id], [Recipe_Id]) VALUES (2, 4, 2, 1)
INSERT [dbo].[RecipeReviews] ([Id], [RecipeRating], [Comment_Id], [Recipe_Id]) VALUES (3, 3, 2, 1)
INSERT [dbo].[RecipeReviews] ([Id], [RecipeRating], [Comment_Id], [Recipe_Id]) VALUES (4, 4, 3, 1)
SET IDENTITY_INSERT [dbo].[RecipeReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipes] ON 

INSERT [dbo].[Recipes] ([Id], [RecipeName], [RecipeDescription], [CreationDate], [Person_Id]) VALUES (1, N'Hot Sauce', N'Spicy hot sauce', CAST(N'2020-11-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Recipes] ([Id], [RecipeName], [RecipeDescription], [CreationDate], [Person_Id]) VALUES (2, N'Fermented Carrots', N'Fermented Carrots', CAST(N'2020-11-01T00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Recipes] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeSteps] ON 

INSERT [dbo].[RecipeSteps] ([Id], [StepTitle], [StepDescription], [Recipe_Id]) VALUES (1, N'Prep ingredients', N'Chop Carrots', 2)
INSERT [dbo].[RecipeSteps] ([Id], [StepTitle], [StepDescription], [Recipe_Id]) VALUES (2, N'Get Water', N'Gather Water for recipe', 2)
INSERT [dbo].[RecipeSteps] ([Id], [StepTitle], [StepDescription], [Recipe_Id]) VALUES (3, N'Put ingredients in jar', N'Gather all of your ingredients and place in jar', 2)
INSERT [dbo].[RecipeSteps] ([Id], [StepTitle], [StepDescription], [Recipe_Id]) VALUES (4, N'Cut Jalapeno', N'Get jalapeno chopped finely', 1)
INSERT [dbo].[RecipeSteps] ([Id], [StepTitle], [StepDescription], [Recipe_Id]) VALUES (7, N'Get water', N'gather water for recipe', 1)
INSERT [dbo].[RecipeSteps] ([Id], [StepTitle], [StepDescription], [Recipe_Id]) VALUES (8, N'Put ingredients in jar', N'put all ingredients in jar', 1)
SET IDENTITY_INSERT [dbo].[RecipeSteps] OFF
GO
SET IDENTITY_INSERT [dbo].[UofMs] ON 

INSERT [dbo].[UofMs] ([Id], [UofMDescription]) VALUES (1, N'gram')
INSERT [dbo].[UofMs] ([Id], [UofMDescription]) VALUES (2, N'oz')
SET IDENTITY_INSERT [dbo].[UofMs] OFF
GO
/****** Object:  Index [IX_FK_PersonComment]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonComment] ON [dbo].[Comments]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UofMIngredient]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UofMIngredient] ON [dbo].[Ingredients1]
(
	[UofM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CommentPhLog]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CommentPhLog] ON [dbo].[PhLogs]
(
	[Comment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RecipePhLog]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RecipePhLog] ON [dbo].[PhLogs]
(
	[Recipe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_IngredientRecipeIngredients]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_IngredientRecipeIngredients] ON [dbo].[RecipeIngredients]
(
	[Ingredient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RecipeStepRecipeIngredients]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RecipeStepRecipeIngredients] ON [dbo].[RecipeIngredients]
(
	[RecipeStep_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CommentRecipeReview]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CommentRecipeReview] ON [dbo].[RecipeReviews]
(
	[Comment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RecipeRecipeReview]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RecipeRecipeReview] ON [dbo].[RecipeReviews]
(
	[Recipe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonRecipe]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonRecipe] ON [dbo].[Recipes]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RecipeRecipeStep]    Script Date: 11/6/2020 7:26:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RecipeRecipeStep] ON [dbo].[RecipeSteps]
(
	[Recipe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_PersonComment] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_PersonComment]
GO
ALTER TABLE [dbo].[Ingredients1]  WITH CHECK ADD  CONSTRAINT [FK_UofMIngredient] FOREIGN KEY([UofM_Id])
REFERENCES [dbo].[UofMs] ([Id])
GO
ALTER TABLE [dbo].[Ingredients1] CHECK CONSTRAINT [FK_UofMIngredient]
GO
ALTER TABLE [dbo].[PhLogs]  WITH CHECK ADD  CONSTRAINT [FK_CommentPhLog] FOREIGN KEY([Comment_Id])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[PhLogs] CHECK CONSTRAINT [FK_CommentPhLog]
GO
ALTER TABLE [dbo].[PhLogs]  WITH CHECK ADD  CONSTRAINT [FK_RecipePhLog] FOREIGN KEY([Recipe_Id])
REFERENCES [dbo].[Recipes] ([Id])
GO
ALTER TABLE [dbo].[PhLogs] CHECK CONSTRAINT [FK_RecipePhLog]
GO
ALTER TABLE [dbo].[RecipeIngredients]  WITH CHECK ADD  CONSTRAINT [FK_IngredientRecipeIngredients] FOREIGN KEY([Ingredient_Id])
REFERENCES [dbo].[Ingredients1] ([Id])
GO
ALTER TABLE [dbo].[RecipeIngredients] CHECK CONSTRAINT [FK_IngredientRecipeIngredients]
GO
ALTER TABLE [dbo].[RecipeIngredients]  WITH CHECK ADD  CONSTRAINT [FK_RecipeStepRecipeIngredients] FOREIGN KEY([RecipeStep_Id])
REFERENCES [dbo].[RecipeSteps] ([Id])
GO
ALTER TABLE [dbo].[RecipeIngredients] CHECK CONSTRAINT [FK_RecipeStepRecipeIngredients]
GO
ALTER TABLE [dbo].[RecipeReviews]  WITH CHECK ADD  CONSTRAINT [FK_CommentRecipeReview] FOREIGN KEY([Comment_Id])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[RecipeReviews] CHECK CONSTRAINT [FK_CommentRecipeReview]
GO
ALTER TABLE [dbo].[RecipeReviews]  WITH CHECK ADD  CONSTRAINT [FK_RecipeRecipeReview] FOREIGN KEY([Recipe_Id])
REFERENCES [dbo].[Recipes] ([Id])
GO
ALTER TABLE [dbo].[RecipeReviews] CHECK CONSTRAINT [FK_RecipeRecipeReview]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK_PersonRecipe] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK_PersonRecipe]
GO
ALTER TABLE [dbo].[RecipeSteps]  WITH CHECK ADD  CONSTRAINT [FK_RecipeRecipeStep] FOREIGN KEY([Recipe_Id])
REFERENCES [dbo].[Recipes] ([Id])
GO
ALTER TABLE [dbo].[RecipeSteps] CHECK CONSTRAINT [FK_RecipeRecipeStep]
GO
USE [master]
GO
ALTER DATABASE [Fermentation2] SET  READ_WRITE 
GO
