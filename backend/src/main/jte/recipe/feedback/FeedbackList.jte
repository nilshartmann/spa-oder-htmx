@import nh.recipify.domain.MinuteDurationFormatter
@import nh.recipify.domain.web.RecipeWebController
@param RecipeWebController.FeedbackResponseDto feedback
@param String recipeId
@for(nh.recipify.domain.model.Feedback f : feedback.feedback())

    <div
            class="mb-8 rounded-2xl border border-dotted border-gray-300 bg-white pb-8 pe-4 ps-4 pt-4 font-inter text-gray-500"
    >
        <div class="flex items-end justify-between">
            <div class="font-medium">${f.getCommenter()}</div>
            <div class="text-sm">
                ${MinuteDurationFormatter.formatDate(f.getCreatedAt())}
            </div>
        </div>
        <div class="mt-4">${f.getComment()}</div>
    </div>
@endfor
<div class="flex w-full justify-center space-x-12">
    <!-- todo #17:
      - in die a-Links wird eine URL geschrieben, in der die geöffnete Feedback-Seite enthalten ist

      - warum haben wir hier DREI urls? 🤔🤔🤔🤔

      - wenn wir eine Seite mit feedback_page-Aufrufen, wird der Parameter nicht ausgewertet
        - warum nicht?
        - was müssten wir tun?
        -  ⚠️ wir brauchen mehrere Endpunkte im Server (für ganze Seite und für inkrementelle Änderungen)
    -->
    @if(feedback.hasPrev())
        <a
                href="/recipes/${recipeId}?feedback_page=${feedback.prevPage()}"
                hx-get="/recipes/${recipeId}/feedback?page=${feedback.prevPage()}"
                hx-push-url="/recipes/${recipeId}?feedback_page=${feedback.prevPage()}"
                hx-target="#feedbackList"
                hx-indicator="#feedbackListIndicator"
                hx-swap="innerHTML"
                class="mb-2 mt-2 transform items-center justify-center rounded bg-orange_2 p-2 px-4 py-2 font-barlow font-normal text-white transition-all duration-500 ease-in-out hover:cursor-pointer hover:bg-orange_2-500 hover:underline hover:shadow-lg"
        >
            &lt;
        </a>
    @endif
    @if(feedback.hasNext())
        <a
                href="/recipes/${recipeId}?feedback_page=${feedback.nextPage()}"
                hx-get="/recipes/${recipeId}/feedback?page=${feedback.nextPage()}&slowdown=2400"
                hx-push-url="/recipes/${recipeId}?feedback_page=${feedback.nextPage()}"
                hx-target="#feedbackList"
                hx-indicator="#feedbackListIndicator"
                hx-swap="innerHTML"
                class="mb-2 mt-2 transform items-center justify-center rounded bg-orange_2 p-2 px-4 py-2 font-barlow font-normal text-white transition-all duration-500 ease-in-out hover:cursor-pointer hover:bg-orange_2-500 hover:underline hover:shadow-lg"
        >
            &gt;
        </a>
    @endif
</div>