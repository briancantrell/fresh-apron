require 'test_helper'

class TwoWeekPlannerTest < ActiveSupport::TestCase
  test "it returns 2 weeks" do
    Timecop.freeze("2017-09-09") do
      planner = TwoWeekPlanner.new
      assert_equal(
        2,
        planner.weeks.length
      )
    end
  end

  test "the first day is Sun Sept 3" do
    Timecop.freeze("2017-09-09") do
      planner = TwoWeekPlanner.new
      assert_equal(
        Time.zone.parse("2017-09-03"),
        planner.weeks.first.first
      )
    end
  end

  test "the last day of the first week is Sat Sept 9" do
    Timecop.freeze("2017-09-09") do
      planner = TwoWeekPlanner.new
      assert_equal(
        Time.zone.parse("2017-09-09"),
        planner.weeks.first.last
      )
    end
  end


  test "the first day of the 2nd week is Sun Sept 10" do
    Timecop.freeze("2017-09-09") do
      planner = TwoWeekPlanner.new
      assert_equal(
        Time.zone.parse("2017-09-10"),
        planner.weeks.last.first
      )
    end
  end

  test "the last day of the 2nd week is Sat Sept 16" do
    Timecop.freeze("2017-09-09") do
      planner = TwoWeekPlanner.new
      assert_equal(
        Time.zone.parse("2017-09-16"),
        planner.weeks.last.last
      )
    end
  end

  test "add_meals adds meals" do
    Timecop.freeze("2017-09-09") do
      planner = TwoWeekPlanner.new
      last_wednesday = Time.new(2017, 9, 6)
      next_wednesday = Time.new(2017, 9, 13)
      meals = []
      meals << Meal.new(scheduled_at: last_wednesday)
      meals << Meal.new(scheduled_at: next_wednesday)
      planner.add_meals(meals)

      assert_equal(
        1,
        planner.weeks.first[last_wednesday].meals.length
      )
      assert_equal(
        1,
        planner.weeks.last[next_wednesday].meals.length
      )
    end

  end
end


