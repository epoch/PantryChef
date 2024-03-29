class SessionController < ApplicationController
	skip_before_action :authenticate

	def new
		@user = User.new
	end


	def create	
		@user = User.find_by(name: params[:username])

		if @user.present? && @user.authenticate(params[:password])
	 		session[:user_id] = @user.id
	 		redirect_to session[:prev_url]
	 	else
	 		redirect_to new_session_path, :notice => 'Incorrect login. Try again.'
	 	end

	end


	def destroy
		session[:user_id] = nil
 		redirect_to root_path
	end

end