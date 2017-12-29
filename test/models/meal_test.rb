require 'test_helper'

class MealTest < ActiveSupport::TestCase
  def create_ingredients
    @cheese = Ingredient.create!(name: "Cheese", units: "ounce_weight")
    @pizza = Ingredient.create!(name: "Pizza", units: "item_count")
  end

  def create_cheese_pizza
    @cheese_pizza = Recipe.create!(title: "Cheese pizza", servings: 2)
    @cheese_pizza.recipe_ingredients.create!(ingredient: @cheese, quantity: 2)
    @cheese_pizza.recipe_ingredients.create!(ingredient: @pizza, quantity: 4)
  end

  def setup
    create_ingredients
    create_cheese_pizza
  end

  def user
    @user ||= User.create!(email: "wat@wat.com", password_digest: "asdf1234")
  end

  def schedule_pizza_meal(servings)
    Meal.create!(
      recipe: @cheese_pizza,
      servings: servings,
      scheduled_at: 1.day.from_now,
      user: user)
  end

  test "serving adjusted quantity math" do
    meal = schedule_pizza_meal(2)
    aq = meal.serving_adjusted_quantity(meal.recipe.recipe_ingredients.find_by(ingredient: @cheese))
    assert_equal(aq, 2)

    meal = schedule_pizza_meal(4)
    aq = meal.serving_adjusted_quantity(meal.recipe.recipe_ingredients.find_by(ingredient: @pizza))
    assert_equal(aq, 8)
  end

  test "event description uses serving adjusted quantities" do
    meal = schedule_pizza_meal(4)
    assert meal.event_description.match /8\.0 ct Pizza/
  end
end
