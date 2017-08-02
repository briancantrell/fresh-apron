class Meal < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :recipe
  scope :future, -> { where("scheduled_at > ?", Time.now) }

  def recipe_title
    recipe.title
  end

  def event_description
    recipe
      .recipe_ingredients
      .map { |ri| "#{number_with_precision(ri.quantity, strip_insignificant_zeros: true)} #{ri.units_abbreviation} #{ri.name}" }
      .join("\n") + recipe.instructions.to_s
  end
end

