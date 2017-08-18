require 'test_helper'

module Meals
  class IndexTest < ActionDispatch::IntegrationTest
    def setup
      super
      @recipe = Recipe.create(title: "Test Recipe")
      MealScheduler.schedule_meals(
        Date.new(2017, 4, 2),
        Date.new(2017, 4, 30),
        [2,4]
      )
    end

    test "shows all the meals" do
      get "/meals"
      assert_select ".recipe-title", text: @recipe.title, count: 8
    end

    test "clicking the schedule button" do

    end
  end
end

