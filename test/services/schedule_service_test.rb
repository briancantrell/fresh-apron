require 'test_helper'

class MealSchedulerTest < ActiveSupport::TestCase
  setup do
    @user = users(:test_user)
  end
  test "the start and end dates are correct" do
    Recipe.create(title: "Test Recipe")
    MealScheduler.schedule_meals(
      Date.new(2017, 4, 16),
      Date.new(2017, 4, 22),
      [2,4],
      @user
    )

    assert_equal Meal.first.scheduled_at,
      Time.new(2017, 4, 18, 19, 0, 0)

    assert_equal Meal.last.scheduled_at,
      Time.new(2017, 4, 20, 19, 0, 0)
  end

  test "it creates the right number of meals" do
    Recipe.create(title: "Test Recipe")
    assert_difference 'Meal.count', 8 do
      MealScheduler.schedule_meals(
        Date.new(2017, 4, 2),
        Date.new(2017, 4, 30),
        [2,4],
        @user
      )
    end
  end

  test "it doesn't create duplicates" do
    Recipe.create(title: "Test Recipe")
    MealScheduler.schedule_meals(
      Date.new(2017, 4, 2),
      Date.new(2017, 4, 30),
      [2,4],
      @user
    )
    assert_difference 'Meal.count', 0 do
      MealScheduler.schedule_meals(
        Date.new(2017, 4, 2),
        Date.new(2017, 4, 30),
        [2,4],
        @user
      )
    end
  end
end

