@param nh.recipify.domain.api.DetailedRecipeDto recipe
@template.layout.main(
title = "Recipify HTMX Demo",
content = @`
        @template.recipe.RecipeBanner(recipe = recipe)
        <div class="container mx-auto mb-8 mt-8 md:flex md:space-x-12">
          <div class="md:w-2/3">
              @template.recipe.Ingredients(recipe = recipe)

              @template.recipe.Instructions(recipe = recipe)
          </div>
          <div class="md:w-1/3">
              @template.recipe.feedback.Feedback(recipeId = recipe.recipe().id())
          </div>
        </div>
`)
