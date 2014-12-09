class Api::V1::UsersController < ApplicationController

	def index
		render :json => User.all
	end

	def recipes
		render :json => User.find(params['id']).recipes
	end

	def recipe_boxes
		render :json => User.find(params['id']).recipe_boxes
	end

end