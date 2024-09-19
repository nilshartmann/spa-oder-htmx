import { createFileRoute } from "@tanstack/react-router";
import { useGetRecipeQuery } from "../../../components/use-queries.ts";
import z from "zod";
import { RecipeBanner } from "./-components/RecipeBanner.tsx";
import { CookingTime } from "./-components/CookingTime.tsx";
import { Ingredients } from "./-components/Ingredients.tsx";
import { Instructions } from "./-components/Instructions.tsx";
import { Sidebar } from "../../../components/Sidebar.tsx";
import { H2 } from "../../../components/Heading.tsx";
import React, { Suspense } from "react";
import LoadingIndicator from "../../../components/LoadingIndicator.tsx";
import FeedbackList from "./-components/FeedbackList.tsx";
import "./-components/RecipePage.css";
import { useRecipifyWindowTitle } from "../../../components/useRecipifyWindowTitle.tsx";

const RecipePageParams = z.object({
  feedback_page: z.number().optional().default(0),
});

export const Route = createFileRoute("/recipes/$recipeId/")({
  component: RecipePage,
  validateSearch: (s) => RecipePageParams.parse(s),
});

function RecipePage() {
  const { recipeId } = Route.useParams();
  const { data } = useGetRecipeQuery(recipeId);
  const recipe = data.recipe;

  useRecipifyWindowTitle(recipe.title);

  return (
    <div className={"mb-20"}>
      <RecipeBanner recipe={recipe} />
      <div className={"container mx-auto mb-8 mt-8 md:flex md:space-x-12"}>
        <div className={"md:w-2/3"}>
          <CookingTime
            cookTime={recipe.cookTime}
            preparationTime={recipe.preparationTime}
          />
          <Ingredients recipe={recipe} />
          <Instructions recipe={recipe} />
        </div>
        <div className={"md:w-1/3"}>
          <FeedbackSidebar />
        </div>
      </div>
    </div>
  );
}

// Unabängig davon, ob die Seite initial gerendert wird, oder nur
// ein "Mikro-Update" erfolgt: hier wird immer derselbe Code
// ausgeführt
//
//  - Daten werden in FeedbackList geladen
//    - es werden DATEN, keine UI geladen
function FeedbackSidebar() {
  // Rezept-Id aus URL holen
  const { recipeId } = Route.useParams();

  // Feedback-Page aus SearchParams
  const feedbackPage = Route.useSearch({
    select: (s) => s.feedback_page,
  });

  // mit einem Fullstack-Framework könnte das Laden
  // sogar auf dem Server schon beginnen, und auf dem Client
  // "enden"

  return (
    <Sidebar>
      <H2>Feedback</H2>
      <Suspense
        fallback={<LoadingIndicator>Loading feedback...</LoadingIndicator>}
      >
        <FeedbackList recipeId={recipeId} feedbackPage={feedbackPage} />
      </Suspense>
    </Sidebar>
  );
}
