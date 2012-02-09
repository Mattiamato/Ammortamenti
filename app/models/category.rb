class Category < ActiveRecord::Base
	has_many :offices, :through =>:items
	acts_as_taggable
end
