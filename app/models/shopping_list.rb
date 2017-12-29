class ShoppingList
  include ActionView::Helpers::NumberHelper
  attr_reader :items
  def initialize
    @items = {} #{ Ingredient => quantity in decimal }
  end

  def event_description
    @items.map do |ingredient, quantity|
      [
        number_with_precision(quantity.to_s, strip_insignificant_zeros: true),
        ingredient.units_abbreviation,
        ingredient.name].join(" ")
    end
      .join("\n")
  end

  def add_meal(meal)
    meal.recipe.recipe_ingredients.each do |recipe_ingredient|
      if @items[recipe_ingredient.ingredient]
        @items[recipe_ingredient.ingredient] += meal.serving_adjusted_quantity(recipe_ingredient)
      else
        @items[recipe_ingredient.ingredient] = meal.serving_adjusted_quantity(recipe_ingredient)
      end
    end
  end
end
