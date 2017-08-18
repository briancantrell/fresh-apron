class MealCalendarService
  SHOPPING_DAY = 0

  def self.generate_calendar
    meals = Meal.all.order(:scheduled_at)
    cal = RiCal.Calendar
    create_meal_events(meals, cal)
    create_shopping_events(meals)
    cal
  end

  def self.create_meal_events(meals, calendar)
    meals.each do |meal|
      calendar.events << RiCal.Event do |event|
        event.summary     = meal.recipe.title
        event.description = meal.event_description
        event.dtstart     = meal.scheduled_at
        event.dtend       = (meal.scheduled_at + 1.hour)
      end
    end
    calendar
  end

  def self.create_shopping_events(meals, calendar)
    shopping_list = ShoppingList.new(shopping_day: SHOPPING_DAY)

    meals.each do |meal|
      shopping_list.add_ingredients(meal)
    end

    shopping_list.shopping_days.each do |shopping_day|
      calendar.events << RiCal.Event do |event|
        event.summary     = "Grocery shopping"
        event.description = shopping_day.event_description
        event.dtstart     = "10:00"
        event.dtend       = "11:00"
      end
    end
  end
end
