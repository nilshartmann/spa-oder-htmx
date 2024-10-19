@param org.springframework.data.domain.Page<nh.recipify.domain.api.RecipeDto> recipes
@param boolean fresh = false

<div
        id="searchResult"
        class="container mx-auto mt-2 w-1/4 space-y-8 rounded-lg pb-8 pt-8"
>
    @if(!fresh)
        @template.search.RecipeSearch(recipes = recipes)
    @endif
</div>