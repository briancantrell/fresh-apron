class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  scope :with_ingredients, -> { includes(:recipe_ingredients) }

  def to_json
    {
      id: id,
      title: title,
      ingredients: recipe_ingredients.map(&:to_json)
    }
  end
end
