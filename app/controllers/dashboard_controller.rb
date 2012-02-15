class DashboardController < ApplicationController

  before_filter :require_user
  
  def index
	@accounts = current_user.accounts
	
  end

  def admin
  end

end
