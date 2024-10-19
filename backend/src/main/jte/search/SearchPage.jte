@param org.springframework.data.domain.Page<nh.recipify.domain.api.RecipeDto> recipes
@param String search = ""
@param boolean fresh = false
@param boolean hasMore = false
@param Integer nextPage = null

@template.layout.main(
title = "Recipify HTMX Demo",
content = @`
    @template.search.SearchPageContent(recipes = recipes,
        search = search,
        fresh = fresh,
        hasMore = hasMore,
        nextPage = nextPage)
`)


