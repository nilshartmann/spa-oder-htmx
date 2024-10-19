@param org.springframework.data.domain.Page<nh.recipify.domain.api.RecipeDto> recipes

@if(recipes.isEmpty())
    <div>
        <p>Keine Treffer!</p>
    </div>
@endif
@for(nh.recipify.domain.api.RecipeDto recipe:recipes)
    @template.search.RecipeSummaryCard(recipe = recipe)
@endfor

