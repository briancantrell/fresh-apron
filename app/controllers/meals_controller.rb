class MealsController < ApplicationController
  def create
    meal = current_user.meals.create(meal_params)
    redirect_to meals_path
  end

  def update
    if Meal.find(params[:id]).update(meal_params)
      redirect_to meals_path
    else
    end
  end

  def index
    @meals = Meal.all.order("scheduled_at desc")
    @planner = TwoWeekPlanner.new
    @planner.add_meals(@meals)

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
    params.require(:meal).permit :recipe_id, :scheduled_at
  end
end

