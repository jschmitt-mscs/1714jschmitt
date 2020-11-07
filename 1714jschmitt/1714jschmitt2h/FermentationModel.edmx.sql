
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/06/2020 18:17:44
-- Generated from EDMX file: C:\Users\Joe\Documents\SQL Server Management Studio\1714jeschmitt\1714jschmitt\1714jschmitt2h\FermentationModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Fermentation2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Person'
CREATE TABLE [dbo].[Person] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(25)  NOT NULL,
    [LastName] nvarchar(25)  NOT NULL,
    [EmailAddress] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Recipes'
CREATE TABLE [dbo].[Recipes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RecipeName] nvarchar(75)  NOT NULL,
    [RecipeDescription] nvarchar(250)  NOT NULL,
    [CreationDate] datetime  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [dbo].[Comments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CommentTitle] nvarchar(75)  NOT NULL,
    [CommentText] nvarchar(250)  NOT NULL,
    [CommentDate] datetime  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'UofMs'
CREATE TABLE [dbo].[UofMs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UofMDescription] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RecipeReviews'
CREATE TABLE [dbo].[RecipeReviews] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RecipeRating] int  NOT NULL,
    [Comment_Id] int  NOT NULL,
    [Recipe_Id] int  NOT NULL
);
GO

-- Creating table 'RecipeSteps'
CREATE TABLE [dbo].[RecipeSteps] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StepTitle] nvarchar(max)  NOT NULL,
    [StepDescription] nvarchar(max)  NOT NULL,
    [Recipe_Id] int  NOT NULL
);
GO

-- Creating table 'Ingredients1'
CREATE TABLE [dbo].[Ingredients1] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IngredientDescription] nvarchar(max)  NOT NULL,
    [IngredientAmount] nvarchar(max)  NOT NULL,
    [UofM_Id] int  NOT NULL
);
GO

-- Creating table 'RecipeIngredients'
CREATE TABLE [dbo].[RecipeIngredients] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RecipeStep_Id] int  NOT NULL,
    [Ingredient_Id] int  NOT NULL
);
GO

-- Creating table 'PhLogs'
CREATE TABLE [dbo].[PhLogs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [phReading] decimal(18,0)  NOT NULL,
    [Recipe_Id] int  NOT NULL,
    [Comment_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Person'
ALTER TABLE [dbo].[Person]
ADD CONSTRAINT [PK_Person]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Recipes'
ALTER TABLE [dbo].[Recipes]
ADD CONSTRAINT [PK_Recipes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UofMs'
ALTER TABLE [dbo].[UofMs]
ADD CONSTRAINT [PK_UofMs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RecipeReviews'
ALTER TABLE [dbo].[RecipeReviews]
ADD CONSTRAINT [PK_RecipeReviews]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RecipeSteps'
ALTER TABLE [dbo].[RecipeSteps]
ADD CONSTRAINT [PK_RecipeSteps]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ingredients1'
ALTER TABLE [dbo].[Ingredients1]
ADD CONSTRAINT [PK_Ingredients1]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RecipeIngredients'
ALTER TABLE [dbo].[RecipeIngredients]
ADD CONSTRAINT [PK_RecipeIngredients]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PhLogs'
ALTER TABLE [dbo].[PhLogs]
ADD CONSTRAINT [PK_PhLogs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Person_Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_PersonComment]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[Person]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonComment'
CREATE INDEX [IX_FK_PersonComment]
ON [dbo].[Comments]
    ([Person_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'Recipes'
ALTER TABLE [dbo].[Recipes]
ADD CONSTRAINT [FK_PersonRecipe]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[Person]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonRecipe'
CREATE INDEX [IX_FK_PersonRecipe]
ON [dbo].[Recipes]
    ([Person_Id]);
GO

-- Creating foreign key on [Comment_Id] in table 'RecipeReviews'
ALTER TABLE [dbo].[RecipeReviews]
ADD CONSTRAINT [FK_CommentRecipeReview]
    FOREIGN KEY ([Comment_Id])
    REFERENCES [dbo].[Comments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommentRecipeReview'
CREATE INDEX [IX_FK_CommentRecipeReview]
ON [dbo].[RecipeReviews]
    ([Comment_Id]);
GO

-- Creating foreign key on [Recipe_Id] in table 'RecipeReviews'
ALTER TABLE [dbo].[RecipeReviews]
ADD CONSTRAINT [FK_RecipeRecipeReview]
    FOREIGN KEY ([Recipe_Id])
    REFERENCES [dbo].[Recipes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RecipeRecipeReview'
CREATE INDEX [IX_FK_RecipeRecipeReview]
ON [dbo].[RecipeReviews]
    ([Recipe_Id]);
GO

-- Creating foreign key on [Recipe_Id] in table 'RecipeSteps'
ALTER TABLE [dbo].[RecipeSteps]
ADD CONSTRAINT [FK_RecipeRecipeStep]
    FOREIGN KEY ([Recipe_Id])
    REFERENCES [dbo].[Recipes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RecipeRecipeStep'
CREATE INDEX [IX_FK_RecipeRecipeStep]
ON [dbo].[RecipeSteps]
    ([Recipe_Id]);
GO

-- Creating foreign key on [UofM_Id] in table 'Ingredients1'
ALTER TABLE [dbo].[Ingredients1]
ADD CONSTRAINT [FK_UofMIngredient]
    FOREIGN KEY ([UofM_Id])
    REFERENCES [dbo].[UofMs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UofMIngredient'
CREATE INDEX [IX_FK_UofMIngredient]
ON [dbo].[Ingredients1]
    ([UofM_Id]);
GO

-- Creating foreign key on [RecipeStep_Id] in table 'RecipeIngredients'
ALTER TABLE [dbo].[RecipeIngredients]
ADD CONSTRAINT [FK_RecipeStepRecipeIngredients]
    FOREIGN KEY ([RecipeStep_Id])
    REFERENCES [dbo].[RecipeSteps]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RecipeStepRecipeIngredients'
CREATE INDEX [IX_FK_RecipeStepRecipeIngredients]
ON [dbo].[RecipeIngredients]
    ([RecipeStep_Id]);
GO

-- Creating foreign key on [Ingredient_Id] in table 'RecipeIngredients'
ALTER TABLE [dbo].[RecipeIngredients]
ADD CONSTRAINT [FK_IngredientRecipeIngredients]
    FOREIGN KEY ([Ingredient_Id])
    REFERENCES [dbo].[Ingredients1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IngredientRecipeIngredients'
CREATE INDEX [IX_FK_IngredientRecipeIngredients]
ON [dbo].[RecipeIngredients]
    ([Ingredient_Id]);
GO

-- Creating foreign key on [Recipe_Id] in table 'PhLogs'
ALTER TABLE [dbo].[PhLogs]
ADD CONSTRAINT [FK_RecipePhLog]
    FOREIGN KEY ([Recipe_Id])
    REFERENCES [dbo].[Recipes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RecipePhLog'
CREATE INDEX [IX_FK_RecipePhLog]
ON [dbo].[PhLogs]
    ([Recipe_Id]);
GO

-- Creating foreign key on [Comment_Id] in table 'PhLogs'
ALTER TABLE [dbo].[PhLogs]
ADD CONSTRAINT [FK_CommentPhLog]
    FOREIGN KEY ([Comment_Id])
    REFERENCES [dbo].[Comments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommentPhLog'
CREATE INDEX [IX_FK_CommentPhLog]
ON [dbo].[PhLogs]
    ([Comment_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------