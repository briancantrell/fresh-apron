require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  include Monban::Test::Helpers
  setup do
    @ingredient = ingredients(:one)
    # user = User.create(email: "test@whatever.com")
    user = users(:test_user)
    sign_in user
  end

  test "should get index" do
    get ingredients_url
    assert_response :success
  end

  test "should get new" do
    get new_ingredient_url
    assert_response :success
  end

  test "should create ingredient" do
    assert_difference('Ingredient.count') do
      post ingredients_url, params: { ingredient: { name: "Test Ingredient", units: :ounce_volume } }
    end

    assert_redirected_to ingredients_path
  end

  test "should show ingredient" do
    get ingredient_url(@ingredient)
    assert_response :success
  end

  test "should get edit" do
    get edit_ingredient_url(@ingredient)
    assert_response :success
  end

  test "should update ingredient" do
    patch ingredient_url(@ingredient), params: {
      ingredient: {
        name: "Test Ingredient",
        units: :ounce_volume
      }
    }
    assert_redirected_to ingredients_path
  end

  test "should destroy ingredient" do
    assert_difference('Ingredient.count', -1) do
      delete ingredient_url(@ingredient)
    end

    assert_redirected_to ingredients_url
  end
end
