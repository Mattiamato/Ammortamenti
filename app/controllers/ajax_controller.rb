class AjaxController < ApplicationController
	def users
	#print "\n\n\n\nPOLDOOOOOOOOOOOOOOOOOOOOOOOOOOOOO\n"
	if params[:term] then
		like= "%".concat(params[:term].concat("%"))
		users = User.where("username like ? or family_name like ? or name like ?", like, like, like)
	else
		users = User.all
	end
   	#print users
	
	
	@user = Array.new
	users.map do |u| 
		@user << u.username+" - "+u.family_name+" "+u.name
	end
	
    render :json => @user
   end
end
