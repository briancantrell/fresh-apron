class CalendarBuilder
  SHOPPING_DAY = 0

  def self.generate_calendar
    meals = Meal.all.order(:scheduled_at)
    cal = RiCal.Calendar
    create_meal_events(meals, cal)
    create_shopping_events(meals, cal)
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
  end

  def self.create_shopping_events(meals, calendar)
    calendar_shopping_lists = CalendarShoppingLists.new(shopping_day: SHOPPING_DAY)

    meals.each do |meal|
      calendar_shopping_lists.add_meal(meal)
    end

    calendar_shopping_lists.shopping_days.each do |shopping_day, shopping_list|
      calendar.events << RiCal.Event do |event|
        event.summary     = "Grocery shopping"
        event.description = shopping_list.event_description
        event.dtstart     = shopping_day
        event.dtend       = shopping_day
      end
    end
  end
end
