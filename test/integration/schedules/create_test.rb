require 'test_helper'

module Schedules
  class CreateTest < ActionDispatch::IntegrationTest
    def setup
      super
      @recipe = Recipe.create(title: "Test Recipe")
    end

    test "clicking the create button creates meals" do
      post "/schedules", params: {
        start_date: "2017-04-02",
        end_date: "2017-04-30",
        days: "2,4"
      }
      assert_redirected_to controller: "meals", action: "index"

      get "/meals"
      assert_select ".recipe-title", text: @recipe.title, count: 8
    end
  end
end
