class Meal < ApplicationRecord
  belongs_to :recipe
  scope :future, -> { where("scheduled_at > ?", Time.now) }

  def recipe_title
    recipe.title
  end
end

