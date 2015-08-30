class RecipesController < ApplicationController
  def index
  	@recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.ingredients.build }
  end

  def create
    @recipe = Recipe.new( params.require( :recipe ).permit( :name, :description, ingredients_attributes: [:name, :magnitude, :unit] ) )

  	@recipe.save!
  	redirect_to @recipe
  end

  def edit
  	@recipe = Recipe.find( params[:id] )
  end

  def update
  	@recipe = Recipe.find( params[:id] )

  	@recipe.name = params[:recipe][:name]
  	@recipe.description = params[:recipe][:description]
    @recipe.save!
    redirect_to @recipe
  end

  def show
  	@recipe = Recipe.find( params[:id] )
  end

  def destroy
    Recipe.destroy( params[:id] )

    redirect_to recipes_path
  end
end
