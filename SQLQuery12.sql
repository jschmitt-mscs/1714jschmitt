SELECT        Recipes.RecipeName, AVG(RecipeReviews.RecipeRating) AS AverageRating
FROM            Recipes INNER JOIN
                         RecipeReviews ON Recipes.Id = RecipeReviews.Recipe_Id
GROUP BY Recipes.RecipeName