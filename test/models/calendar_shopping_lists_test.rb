require 'test_helper'

class CalendarShoppingListsTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.create(title: "Cheese doodles")
  end

  test "get_shopping_list_for_meal creates a new shopping list when one doesn't exist" do
    Timecop.freeze("2017-08-05") do
      calendar_shopping_lists = CalendarShoppingLists.new

      meal = Meal.create(recipe: @recipe, scheduled_at: 4.days.from_now)
      calendar_shopping_lists.add_meal(meal)
      assert_equal(
        1,
        calendar_shopping_lists.shopping_days.length
      )

      meal = Meal.create(recipe: @recipe, scheduled_at: 14.days.from_now)
      calendar_shopping_lists.add_meal(meal)
      assert_equal(
        2,
        calendar_shopping_lists.shopping_days.length
      )
    end
  end

  test "get_shopping_list_for_meal doesn't create a new shopping list when one already exist" do
    Timecop.freeze("2017-08-05") do
      calendar_shopping_lists = CalendarShoppingLists.new

      meal = Meal.create(recipe: @recipe, scheduled_at: 4.days.from_now)
      calendar_shopping_lists.add_meal(meal)
      assert_equal(
        1,
        calendar_shopping_lists.shopping_days.length
      )

      meal = Meal.create(recipe: @recipe, scheduled_at: 5.days.from_now)
      assert_equal(
        1,
        calendar_shopping_lists.shopping_days.length
      )
    end
  end

  test "shopping day for meal when shopping day is prev week" do
    Timecop.freeze("2017-08-05") do
      shopping_list =CalendarShoppingLists .new(shopping_day: 6)
      meal = Meal.create(recipe: @recipe, scheduled_at: 4.days.from_now)

      assert_equal(
        Date.new(2017, 8, 5),
        shopping_list.shopping_date_for_meal(meal)
      )
    end
  end

  test "shopping day for meal when shopping day is same week" do
    Timecop.freeze("2017-08-05") do # saturday
      wed = Time.new(2017, 8, 9, 12)
      meal = Meal.create(recipe: @recipe, scheduled_at: wed)
      shopping_list = CalendarShoppingLists.new(shopping_day: 1)

      assert_equal(
        Date.new(2017, 8, 7), # mon
        shopping_list.shopping_date_for_meal(meal)
      )
    end

  end
end

