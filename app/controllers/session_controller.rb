class SessionController < ApplicationController
	skip_before_action :authenticate

	def new
	end


	def create	
		user = User.find_by(name: params[:username])

		if user.present? && user.authenticate(params[:password])
	 		session[:user_id] = user.id
	 		redirect_to root_path
	 	else
	 		redirect_to new_session_path, :notice => 'incorrect login'
	 	end

	end


	def destroy
		session[:user_id] = nil
 		redirect_to new_session_path
	end

end