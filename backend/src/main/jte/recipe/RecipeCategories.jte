@import nh.recipify.domain.MinuteDurationFormatter
@import nh.recipify.domain.api.CategoryDto
@param boolean hideTime = false
@param nh.recipify.domain.api.RecipeDto recipe


<div class="space-y-2">
    @if(!hideTime)
        <p
                class="me-2 inline-block rounded border border-green bg-white p-2 text-[15px] text-green"
        >
            <i class="fa-regular fa-clock mr-2"></i>
            ${MinuteDurationFormatter.formatMinutes(recipe.cookTime() +
          recipe.preparationTime())}
        </p>
    @endif


    @for(CategoryDto c : recipe.categories())
        <p
                class="me-2 inline-block rounded border border-green bg-white p-2 text-[15px] text-green"
        >
            <i class="${c.icon()}"></i>
            <span class="ms-2">${c.title()}</span>
        </p>
    @endfor
</div>