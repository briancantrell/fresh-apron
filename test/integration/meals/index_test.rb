require 'test_helper'

module Meals
  class IndexTest < ActionDispatch::IntegrationTest
    include Monban::Test::Helpers
    def setup
      super

      user = users(:test_user)
      sign_in(user)

      @recipe = Recipe.create!(title: "Test Recipe", servings: 2)
      beginning_of_week = Date.today.beginning_of_week
      MealScheduler.schedule_meals(
        beginning_of_week,
        beginning_of_week + 14.days,
        [2,4],
        user
      )
    end

    test "shows all the meals" do
      get "/meals"
      assert_select ".recipe-chooser", count: 4
    end
  end
end
