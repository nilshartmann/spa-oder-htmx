@import nh.recipify.domain.web.CssClassNameUtil
@param gg.jte.Content content
@param boolean checked = false
@param boolean disabled = false

<span>
      <span
              class="${CssClassNameUtil.cssClassName(
    "mb-2 mt-2 inline-flex transform items-center justify-center rounded px-4 py-2 font-barlow font-normal text-white transition-all duration-500 ease-in-out hover:cursor-pointer hover:underline",
     !checked && !disabled ? "bg-orange_2 p-2 hover:bg-orange_2-500" : null,
     checked ?          " bg-green hover:cursor-default hover:bg-green hover:no-underline" : "",
     disabled ? " cursor-default bg-orange_2-200 hover:cursor-default hover:bg-orange_2-200" : ""
    )}"
      >
        ${content}
      </span>
</span>