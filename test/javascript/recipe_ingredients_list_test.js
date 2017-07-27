import React from 'react';
import ReactTestUtils from 'react-dom/test-utils';

import RecipeIngredientsList from '../../app/javascript/components/recipe_form/recipe_ingredients_list';

test("it renders 1 select per ingredient", () => {
  var availableIngredients = [{id: "1", name: "Beans"}, {name: "Rice", id:  "2"}]
  var currentIngredients = [
    {"ingredient_id": 1, "name": "Navy bean", "quantity": null, "units": null},
    {"ingredient_id": 2, "name": "Sauce", "quantity": null, "units": null}
  ]

  var recipeIngredientsList = ReactTestUtils.renderIntoDocument(
    <RecipeIngredientsList
      availableIngredients={availableIngredients}
      currentIngredients={currentIngredients}
      />
  );

  var ingredientSelects = ReactTestUtils.scryRenderedDOMComponentsWithTag(
    recipeIngredientsList, "select"
  );

  expect(ingredientSelects.length).toEqual(2);
});
