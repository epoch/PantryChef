class ShoppingListController < ApplicationController

	def show	
		@ingredients = params['ingredients']
	end

end