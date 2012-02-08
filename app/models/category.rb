class Category < ActiveRecord::Base
	has_many :offices, :through =>:items
end
