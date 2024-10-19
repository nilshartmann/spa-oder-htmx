@param boolean includeDetails
@param nh.recipify.domain.api.RecipeDto recipe

@if(includeDetails)
  @template.search.RecipeSummaryCard(recipe = recipe, summary = @`
      <div class="mt-4 space-y-4">
          <p>${recipe.headline()}</p>
          @template.recipe.RecipeCategories(recipe = recipe, hideTime = false)
      </div>
`)
@else
    @template.search.RecipeSummaryCard(recipe = recipe, summary = null)
@endif