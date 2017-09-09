class MealsController < ApplicationController
  def update
    if Meal.find(params[:id]).update(meal_params)
      redirect_to schedule_path(id: 1)
    else
    end
  end

  def index
    @meals = Meal.all.order("scheduled_at desc")
    respond_to do |format|
      format.html
    end
  end

  def destroy
    if current_user.meals.find(params[:id]).destroy
      redirect_to meals_path, notice: "Meal destroyed."
    else
      redirect_to meals_path, notice: "Meal could not be destroyed."
    end
  end

  private

  def meal_params
    params.permit :recipe_id
  end
end

