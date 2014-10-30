class ExternalController < ApplicationController
	after_action :allow_iframe, only: :index
	def index
		@recipe_id = params['id']
		@recipe = HTTParty.get("http://api.yummly.com/v1/api/recipe/#{@recipe_id}?_app_id=8bf9c732&&_app_key=b14d7c43eeb5c83d0c62bcfebc042431")
		@external_url = @recipe['source']['sourceRecipeUrl']
		@external_url[5..-1]


	end


	private
	def allow_iframe
  response.headers['X-Frame-Options'] = "ALLOWALL"
	end

end