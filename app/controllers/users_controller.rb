class UsersController < ApplicationController

	
	def new	
		
	end

	def create
		@user = User.new
		@user.name = params['username']
		@user.password = params['password']
		@user.password_confirmation = params['password_confirmation']
		if @user.save
			redirect_to new_session_path
		else
			redirect_to new_user_path, :notice => @user.errors.full_messages.join(", ")
		end

	end

end