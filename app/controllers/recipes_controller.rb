class RecipesController < ApplicationController
  def index
  	render plain: Recipe.all.inspect
  end

  def new
  end

  def create
  	@recipe = Recipe.new( params.require( :recipe ).permit( :name, :description ) )

  	@recipe.save!
  	redirect_to @recipe
  end

  def edit
  	@recipe = Recipe.find( params[:id] )
  end

  def update
  	@recipe = Recipe.find( params[:id] )

  	@recipe.name = params[:name]
  	@recipe.description = params[:description]
  end

  def show
  	@recipe = Recipe.find( params[:id] )
  end
end
