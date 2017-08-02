# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or find_or_create_byd alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create_by(name: 'Luke', movie: movies.first)

sardines = Ingredient.find_or_create_by(name: "sardines", units: :ounce_weight)
bread_crumbs = Ingredient.find_or_create_by(name: "bread crumbs", units: :ounce_volume)
parsley = Ingredient.find_or_create_by(name: "parsley", units: :ounce_volume)
pasta = Ingredient.find_or_create_by(name: "pasta", units: :ounce_weight)
capers = Ingredient.find_or_create_by(name: "capers", units: :ounce_volume)
olive_oil = Ingredient.find_or_create_by(name: "olive oil", units: :ounce_volume)
lemon = Ingredient.find_or_create_by(name: "lemon", units: :item_count)
onion = Ingredient.find_or_create_by(name: "onion", units: :item_count)


sardine_recipe = Recipe.find_or_create_by(
  title: "Pasta With Sardines, Bread Crumbs and Capers",
  instructions: "Step 1
  Bring a large pot of water to a boil and salt it. Put half the oil (2 tablespoons) in a medium skillet over medium heat. When it’s hot, add the bread crumbs and cook, stirring frequently, until golden and fragrant, less than 5 minutes, and then remove. Add the remaining oil and the onion to the pan, sprinkle with salt and pepper, and cook, stirring occasionally, until softened, about 5 minutes.

  Step 2
  Meanwhile, add the pasta to the boiling water and cook until just tender; drain, reserving some of the cooking liquid. Turn the heat under the onions to medium-high and add the lemon zest, capers and sardines; cook, stirring occasionally, until just heated through, about 2 minutes.


  Step 3
  Add the pasta to the sardine mixture and toss well to combine. Add the parsley, most of the bread crumbs and some reserved water, if necessary, to moisten. Taste and adjust seasoning, garnishing with more parsley and bread crumbs.")

sardine_recipe.recipe_ingredients.find_or_create_by(ingredient: sardines, quantity: 16)
sardine_recipe.recipe_ingredients.find_or_create_by(ingredient: bread_crumbs, quantity: 0.5)
sardine_recipe.recipe_ingredients.find_or_create_by(ingredient: parsley, quantity: 4)
sardine_recipe.recipe_ingredients.find_or_create_by(ingredient: pasta, quantity: 16)
sardine_recipe.recipe_ingredients.find_or_create_by(ingredient: capers, quantity: 1)
sardine_recipe.recipe_ingredients.find_or_create_by(ingredient: olive_oil, quantity: 1)
sardine_recipe.recipe_ingredients.find_or_create_by(ingredient: lemon, quantity: 0.25)
sardine_recipe.recipe_ingredients.find_or_create_by(ingredient: onion, quantity: 1)
