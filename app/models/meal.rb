class Meal < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :recipe
  belongs_to :user

  validates :recipe, presence: true
  validates :servings, presence: true
  validates :user, presence: true
  validates :scheduled_at, presence: true

  scope :future, -> { where("scheduled_at > ?", Time.now) }

  def recipe_title
    recipe.title
  end

  def serving_adjusted_quantity(recipe_ingredient)
    adjustment_factor = (servings / recipe.servings)
    adjusted_quantity = adjustment_factor * recipe_ingredient.quantity
    # number_with_precision(adjusted_quantity, strip_insignificant_zeros: true) returns string
    adjusted_quantity
  end

  def event_description
    recipe
      .recipe_ingredients
      .map { |ri| "#{serving_adjusted_quantity(ri).to_s} #{ri.units_abbreviation} #{ri.name}" }
      .join("\n") + recipe.instructions.to_s
  end
end

