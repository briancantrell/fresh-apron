class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients

  scope :with_ingredients, -> { includes(:recipe_ingredients) }

  def to_json
    {
      title: title,
      ingredients: recipe_ingredients.map(&:to_json)
    }
  end
end
