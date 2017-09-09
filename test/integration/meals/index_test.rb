require 'test_helper'

module Meals
  class IndexTest < ActionDispatch::IntegrationTest
    include Monban::Test::Helpers
    def setup
      super

      user = users(:test_user)
      sign_in(user)

      @recipe = Recipe.create(title: "Test Recipe")
      MealScheduler.schedule_meals(
        Date.new(2017, 4, 2),
        Date.new(2017, 4, 30),
        [2,4]
      )
    end

    test "shows all the meals" do
      get "/meals"
      assert_select ".recipe-chooser", count: 8
    end
  end
end
