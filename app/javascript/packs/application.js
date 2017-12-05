/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Support component names relative to this directory:
var ReactRailsUJS = require("react_ujs")

// require("../components/ingredient_picker")

import { IngredientPicker } from "../components/recipe_form/recipe_ingredients_list"
import { MealForm } from "../components/meals/meal_form"

var componentRequireContext = require.context("components", true)
ReactRailsUJS.useContext(componentRequireContext)
