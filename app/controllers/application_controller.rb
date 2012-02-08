class ApplicationController < ActionController::Base
  protect_from_forgery
  
    force_ssl

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_path
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.url
  end
  
  def menu_cust
	if params[:controller] == 'customers' && params[:id] != nil
		return Customer.find(params[:id])
	end
	else if params[:controller] != 'customers' && params[:customer_id] != nil
		return Customer.find(params[:customer_id])
	end
	return nil
  end
  helper_method :menu_cust
  
  def menu_proj

	if params[:controller] == 'projects' && params[:id] != nil
		return Project.find(params[:id])
	end
	else if params[:controller] != 'projects' && params[:project_id] != nil
		return Project.find(params[:project_id])
	end
	return nil
  end
  helper_method :menu_proj
end
