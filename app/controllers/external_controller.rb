class ExternalController < ApplicationController
	
	def index
		@recipe_id = params['id']
		@recipe = HTTParty.get("http://api.yummly.com/v1/api/recipe/#{@recipe_id}?_app_id=8bf9c732&&_app_key=b14d7c43eeb5c83d0c62bcfebc042431")
		@external_url = @recipe['source']['sourceRecipeUrl']
	end

end