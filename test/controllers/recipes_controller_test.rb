require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "assigns :recipe" do
    get :new
    assert_assigns :recipe
  end

  test "builds ingredients" do
    get :new
    assert_equal 2, @recipe.ingredients.count
  end

  test "should get show" do
  	id = Recipe.first.id
    get :show, id: id
    assert_response :success
  end

  test "should create" do
    post :create, recipe: {name: "Stew", description: "beef"}

    assert_not_nil Recipe.find_by_name( "Stew" )
  end

  # test "should create ingredients" do
  #   post :create, recipe: {name: "Stew", description: "beef", ingredients_attributes: {0 => {name: "wine", magnitude: "1", unit: "bottle"}}}

  #   assert_equal 1, Recipe.find_by_name( "Stew" ).ingredients.count
  # end

  test "should update" do
  	r = Recipe.create name: "Berry Smoothie", description: "with toast"

  	put :update, id: r.id, recipe: {name: "Banana Smoothie", description: "without toast"}

  	r.reload
  	assert_equal "Banana Smoothie", r.name
  	assert_equal "without toast", r.description

  	assert_redirected_to recipe_path( r.id )
  end

  test "should destroy" do
    r = Recipe.create name: "Berry Smoothie", description: "with toast"

  	delete :destroy, id: r.id

  	assert_nil Recipe.find_by_id( r.id )
  end
end
