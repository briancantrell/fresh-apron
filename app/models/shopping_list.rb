class ShoppingList
  attr_reader :shopping_days, :shopping_day
  def initialize(shopping_day: 0)
    @shopping_day = shopping_day
    @shopping_days = []
  end

  def add_ingredients(meal)
    # offset = meal.scheduled_at.wday - shopping_day
    byebug
  end

  def shopping_date_for_meal(meal)
    if shopping_day > meal.scheduled_at.wday
      offset = ((7 - shopping_day)*-1) - meal.scheduled_at.wday
    else
      offset = shopping_day - meal.scheduled_at.wday
    end

    meal.scheduled_at.advance(days: offset).to_date
  end

  # 3       6
end
