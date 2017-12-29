require 'test_helper'

class ShoppingListTest < ActiveSupport::TestCase
  def create_ingredients
    @cheese = Ingredient.create(name: "Cheese")
    @doodles = Ingredient.create(name: "Doodles")
    @pizza = Ingredient.create(name: "Pizza")
  end

  def create_cheese_doodles
    @cheese_doodles = Recipe.create(title: "Cheese doodles", servings: 2)
    @cheese_doodles.recipe_ingredients.create(ingredient: @cheese, quantity: 2)
    @cheese_doodles.recipe_ingredients.create(ingredient: @doodles, quantity: 1)
  end

  def create_cheese_pizza
    @cheese_pizza = Recipe.create(title: "Cheese pizza", servings: 2)
    @cheese_pizza.recipe_ingredients.create(ingredient: @cheese, quantity: 1)
    @cheese_pizza.recipe_ingredients.create(ingredient: @pizza, quantity: 2)
  end

  def setup
    create_ingredients
    create_cheese_doodles
    create_cheese_pizza
    @shopping_list = ShoppingList.new
  end

  test "add_meal creates a new item when it doesn't exist" do
    meal = Meal.create(recipe: @cheese_doodles, servings: 2)
    @shopping_list.add_meal(meal)
    assert_equal(
      2,
      @shopping_list.items.length
    )

    meal = Meal.create(recipe: @cheese_pizza)
    @shopping_list.add_meal(meal)
    assert_equal(
      3,
      @shopping_list.items.length
    )
  end

  test "add_meal sums ingredient quantity across recipes in the same list" do
    meal = Meal.create(recipe: @cheese_doodles, servings: 2)
    @shopping_list.add_meal(meal)
    meal = Meal.create(recipe: @cheese_pizza)
    @shopping_list.add_meal(meal)
    assert_equal(
      3,
      @shopping_list.items[@cheese]
    )
  end
end

