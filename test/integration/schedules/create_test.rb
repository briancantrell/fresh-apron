require 'test_helper'

module Schedules
  class CreateTest < ActionDispatch::IntegrationTest
    include Monban::Test::Helpers

    def setup
      super
      user = User.create
      sign_in(user)

      @recipe = Recipe.create(title: "Test Recipe")
    end

    test "clicking the create button creates meals" do
      post "/schedules", params: {
        start_date: "2017-04-02",
        end_date: "2017-04-30",
        days: "2,4"
      }
      assert_redirected_to controller: "meals", action: "index"
      assert_equal(
        8,
        Meal.all.count
      )

      # get "/meals"
      # assert_select ".recipe-chooser", count: 8
    end
  end
end
