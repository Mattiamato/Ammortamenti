class Office < ActiveRecord::Base
  belongs_to :building
  has_many :items
end
