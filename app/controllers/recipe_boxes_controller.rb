class RecipeBoxesController < ApplicationController

	before_action :authenticate

	def index
	end


	def new

		@recipe_id = params['id']
		@user_recipe_boxes = current_user.recipe_boxes
		@recipe = Recipe.new
	
	end


	def create

		@recipe_box = RecipeBox.new
		@recipe_box.name = params['name']
		@recipe_box.user_id = current_user.id
		@recipe_box.save

		@recipe_id = params['recipe_id']
		recipe = HTTParty.get("http://api.yummly.com/v1/api/recipe/#{@recipe_id}?_app_id=8bf9c732&&_app_key=b14d7c43eeb5c83d0c62bcfebc042431")
		recipe = recipe.parsed_response

		@recipe = Recipe.new
		@recipe.image_url = recipe["images"].first["imageUrlsBySize"]['90']
		@recipe.name = recipe['name']
		@recipe.rating = recipe['rating']
		@recipe.cooktime = recipe['totalTimeInSeconds'].to_i / 60
		@recipe.course = if recipe['attributes']['course'] != nil 
												recipe['attributes']['course'].first
											else
												"---"
											end
		@recipe.ingredients = recipe['ingredientLines'].join(', ')
		@recipe.yummly_id = recipe['id']
		@recipe.recipe_boxes << @recipe_box
		@recipe.save
		

		
			redirect_to recipe_box_path(@recipe_box)
		
	end

	def add_to_box
		
		@recipe_box = RecipeBox.find(params['recipe_box'])
		@recipe_id = params['recipe_id']
		recipe = HTTParty.get("http://api.yummly.com/v1/api/recipe/#{@recipe_id}?_app_id=8bf9c732&&_app_key=b14d7c43eeb5c83d0c62bcfebc042431")
		recipe = recipe.parsed_response

		@recipe = Recipe.new
		@recipe.image_url = recipe["images"].first["imageUrlsBySize"]['90']
		@recipe.name = recipe['name']
		@recipe.rating = recipe['rating']
		@recipe.cooktime = recipe['totalTimeInSeconds'].to_i / 60
		@recipe.course = if recipe['attributes']['course'] != nil 
												recipe['attributes']['course'].first
											else
												"---"
											end
		@recipe.ingredients = recipe['ingredientLines'].join(', ')
		@recipe.yummly_id = recipe['id']
		@recipe.recipe_boxes << @recipe_box
		@recipe.save
		

		
			redirect_to recipe_box_path(params['recipe_box'])

	end


	def show
		@recipe_box = RecipeBox.find(params['id'])
	end


end