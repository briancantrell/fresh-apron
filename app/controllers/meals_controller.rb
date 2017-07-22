class MealsController < ApplicationController
  def update
    if Meal.find(params[:id]).update(meal_params)
      redirect_to schedule_path(id: 1)
    else
    end
  end

  def index
    @meals = Meal.all
    respond_to do |format|
      format.html
    end
  end

  private

  def meal_params
    params.permit :recipe_id
  end
end

