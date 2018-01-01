import React from 'react';
import ReactTestUtils from 'react-dom/test-utils';

import RecipeIngredientsList from '../../app/javascript/components/recipe_form/recipe_ingredients_list';

var availableIngredients = [{id: "99", name: "Beans"}, {name: "Rice", id:  "100"}]
var currentIngredients = [
  {"ingredient_id": "100", "name": "Rice", "quantity": "", "units": ""},
  {"ingredient_id": "99", "name": "Beans", "quantity": "", "units": ""}
]

var recipeIngredientsList = ReactTestUtils.renderIntoDocument(
  <RecipeIngredientsList
    availableIngredients={availableIngredients}
    currentIngredients={currentIngredients}
    />
);

test("it renders 1 select per ingredient", () => {
  var ingredientSelects = ReactTestUtils.scryRenderedDOMComponentsWithTag(
    recipeIngredientsList, "select"
  );

  expect(ingredientSelects.length).toEqual(2);
});

test("it correctly selects the current ingredients", () => {
  var ingredientSelects = ReactTestUtils.scryRenderedDOMComponentsWithTag(
    recipeIngredientsList, "select"
  );
  var firstIngredientSelect = ingredientSelects[0];
  expect(firstIngredientSelect.value).toEqual("100");

  var secondIngredientSelect = ingredientSelects[1];
  expect(secondIngredientSelect.value).toEqual("99")
});

test("it correctly selects the current ingredients", () => {
  var ingredientSelects = ReactTestUtils.scryRenderedDOMComponentsWithTag(
    recipeIngredientsList, "select"
  );
  var firstIngredientSelect = ingredientSelects[0];
  expect(firstIngredientSelect.value).toEqual("100");

  var secondIngredientSelect = ingredientSelects[1];
  expect(secondIngredientSelect.value).toEqual("99")
});

test("it allows deleting an ingredient", () => {
  var ingredientSelects = ReactTestUtils.scryRenderedDOMComponentsWithTag(
    recipeIngredientsList, "select"
  );
  expect(ingredientSelects.length).toEqual(2);

  var deleteButtons = ReactTestUtils.scryRenderedDOMComponentsWithClass(
    recipeIngredientsList, "delete-button"
  );
  ReactTestUtils.Simulate.click(deleteButtons[0]);

  var hiddenDeleteInput = ReactTestUtils.scryRenderedDOMComponentsWithClass(
    recipeIngredientsList, "hidden-delete-input"
  );
  expect(hiddenDeleteInput.length).toEqual(1);

});
