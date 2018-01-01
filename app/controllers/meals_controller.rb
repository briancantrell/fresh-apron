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
    @planner = TwoWeekPlanner.new
    @meals = Meal
      .where("scheduled_at BETWEEN ? AND ?",
    @planner.weeks.first.first.beginning_of_day,
    @planner.weeks.last.last.end_of_day)
      .order("scheduled_at desc")
    @planner.add_meals(@meals)

    @available_recipe_json = Recipe.all.map(&:to_json)

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

