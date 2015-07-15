require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
  	id = Recipe.first.id
    get :show, id: id
    assert_response :success
  end
end
