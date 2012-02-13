class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find_by_username(params[:username])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redir_path = dashboard_index_path
		#redir_path = session[:return_to] if session[:return_to]
		redirect_to redir_path, :notice => "Logged in!"
	else
		flash.now.alert = "Invalid email or password"
		render "new"
	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end