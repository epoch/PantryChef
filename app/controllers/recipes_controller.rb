require 'uri'

class RecipesController < ApplicationController
	
	def index

		@matches = params[@matches]
	end

	def new
	end

	def search
		
		@ingredients = []
		@ingredients << params[:ingredient1]
		@ingredients << params[:ingredient2]
		@ingredients << params[:ingredient3] 
		@ingredients << params[:ingredient4] 
		@ingredients << params[:ingredient5] 

		@ingredients = @ingredients.delete_if {|i| i == ""}

		allowedIngredient = @ingredients.map {|i| "&allowedIngredient[]=#{i}"}.join("")

		allowedAllergy = params['user']['allergy'].join

		@allergy = params['user']['allergy']
		@allergy.delete_if {|a| a == ""}
		@allergy = @allergy.map {|a| a[22..-1]}.join(", ")


		url = URI.encode("http://api.yummly.com/v1/api/recipes?_app_id=8bf9c732&_app_key=b14d7c43eeb5c83d0c62bcfebc042431#{allowedIngredient}#{allowedAllergy}&requirePictures=true&maxResult=12")
		@response = HTTParty.get(url)
		@matches = @response['matches']

		@total_match_count = @response['totalMatchCount']
		
		render :index
		
	end


	def show
		@recipe_id = params['id']
		@recipe = HTTParty.get("http://api.yummly.com/v1/api/recipe/#{@recipe_id}?_app_id=8bf9c732&&_app_key=b14d7c43eeb5c83d0c62bcfebc042431")
		@external_url = @recipe['source']['sourceRecipeUrl']

		if logged_in? 
			@current_recipe = current_user.recipes.find_by('yummly_id' => @recipe_id)
		end
	end


	def add_note
		@recipe_id = params['recipe_id']
	end


	def create_note
		@recipe_id = params['recipe_id']
		selected_recipe = current_user.recipes.find_by('yummly_id' => @recipe_id)
		selected_recipe.notes = params['notes']
		selected_recipe.save

		redirect_to recipe_path(@recipe_id)
	end


	def edit_note
		@recipe_id = params['recipe_id']
		@selected_recipe = current_user.recipes.find_by('yummly_id' => @recipe_id)	
	end


	def update_note
		recipe_id = params['recipe_id']
		selected_recipe = current_user.recipes.find_by('yummly_id' => recipe_id)
		selected_recipe.notes = params['notes']
		selected_recipe.save
		redirect_to recipe_path(recipe_id)
	end


	

end