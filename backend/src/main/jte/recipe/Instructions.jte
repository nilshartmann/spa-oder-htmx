@param nh.recipify.domain.api.DetailedRecipeDto recipe
<h2 class="mb-8 mt-8 font-space text-3xl font-bold">Instructions</h2>
<div class="me-4 ms-4">
    @for(nh.recipify.domain.model.Instruction i : recipe.instructions())
    <div
            class="mt-8 items-start border-b border-dotted border-gray-300 pb-8 sm:flex"
    >
        <div
                class="font-space font-medium text-red sm:w-1/4"
        >
            Step ${i.getOrderNo()}
        </div>
        <div
                class="mt-4 font-inter text-gray-500 sm:mt-0 sm:w-3/4 sm:pe-1.5"
        >${i.getDescription()}</div>
    </div>
    @endfor
</div>