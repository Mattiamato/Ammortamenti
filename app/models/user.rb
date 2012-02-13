class User < ActiveRecord::Base  
	has_secure_password
	validates_presence_of :username, :on => :create
	validates_presence_of :password, :on => :create
	validates :username, :uniqueness => true
	has_many :activities
	has_and_belongs_to_many :accounts, :join_table => "users_accounts"
	
	def prj_role?(base_role)
	  ""
  end
	
	def admin?
	
		if self.assignments.where("role = ?",'manager').length > 0 then
	
			true
		else
			false
		end
	end
	
end
