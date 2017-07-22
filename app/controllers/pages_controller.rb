class PagesController < ApplicationController
  def home
    @meals = Meal.future
  end
end
