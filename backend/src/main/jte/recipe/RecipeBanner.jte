@param nh.recipify.domain.api.DetailedRecipeDto recipe

<div
        style="--recipe-bg-image: url(/images/recipes/food_${recipe.recipe().id()}.png)"
>
    <div class="recipify-header-wrap mt-8 pb-12 pe-8 ps-8 pt-4">
        <div
                class="container mx-auto flex flex-col-reverse md:flex-row md:space-x-8"
        >
            <div class="mt-8 md:mt-0 md:w-1/2">
                <div class="flex h-full flex-col justify-between">
                    <div>
                        <div class="flex justify-between">
                            <p
                                    class="font-space text-sm font-medium uppercase tracking-[2px] text-red"

                            >
                                ${recipe.recipe().mealType()}
                            </p>
                        </div>
                        <h1
                                class="mb-4 mt-4 font-space text-5xl font-bold"
                        >${recipe.recipe().title()}
                        </h1>
                        <p
                                class="text mt-2 font-inter text-gray-500"
                        >${recipe.recipe().headline()}</p>
                    </div>
                    <div>
                        <div class="mt-4 flex">
                            <div
                                    class="mt-4"
                            >
                                @template.recipe.RecipeCategories(recipe = recipe.recipe(), hideTime = true)
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="md:w-1/2">
                <div class="overflow-hidden">
                    <img
                            class="w-full transform rounded object-cover transition-all duration-1000 ease-in-out hover:scale-125 sm:mt-4 sm:max-h-80 md:mt-0"
                            src="/images/recipes/food_${recipe.recipe().id()}.png"
                    />
                </div>
            </div>
        </div>
    </div>
</div>