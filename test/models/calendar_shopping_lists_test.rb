require 'test_helper'

class CalendarShoppingListsTest < ActiveSupport::TestCase
  test "shopping day for meal when shopping day is prev week" do
    Timecop.freeze("2017-08-05") do
      recipe = Recipe.create(title: "Cheese doodles")
      meal = Meal.create(recipe: recipe, scheduled_at: 4.days.from_now)
      shopping_list =CalendarShoppingLists .new(shopping_day: 6)

      assert_equal(
        Date.new(2017, 8, 5),
        shopping_list.shopping_date_for_meal(meal)
      )
    end
  end

  test "shopping day for meal when shopping day is same week" do
    Timecop.freeze("2017-08-05") do # saturday
      wed = Time.new(2017, 8, 9, 12)
      recipe = Recipe.create(title: "Cheese doodles")
      meal = Meal.create(recipe: recipe, scheduled_at: wed)
      shopping_list = CalendarShoppingLists.new(shopping_day: 1)

      assert_equal(
        Date.new(2017, 8, 7), # mon
        shopping_list.shopping_date_for_meal(meal)
      )
    end

  end
end

