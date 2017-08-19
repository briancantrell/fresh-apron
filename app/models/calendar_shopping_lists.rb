class CalendarShoppingLists
  attr_reader :shopping_days, :shopping_day

  def initialize(shopping_day: 0)
    @shopping_day = shopping_day
    @shopping_days = {} # { Date => ShoppingList }
  end

  def add_meal(meal)
    shopping_list_for_meal = get_shopping_list_for_meal(meal)
    shopping_list_for_meal.add_meal(meal)
  end

  def get_shopping_list_for_meal(meal)
    shopping_date = shopping_date_for_meal(meal)
    shopping_list_for_meal = shopping_days[shopping_date] || shopping_days[shopping_date] = ShoppingList.new

  end

  def shopping_date_for_meal(meal)
    if shopping_day > meal.scheduled_at.wday
      offset = ((7 - shopping_day)*-1) - meal.scheduled_at.wday
    else
      offset = shopping_day - meal.scheduled_at.wday
    end

    meal.scheduled_at.advance(days: offset).to_date
  end
end
