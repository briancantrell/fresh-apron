class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, inverse_of: :recipe_ingredients
  belongs_to :ingredient

  delegate :name, to: :ingredient

  def to_json
    {
      ingredient_id: ingredient_id,
      name: name,
      quantity: quantity,
      units: units
    }
  end
end
