class Item < ActiveRecord::Base
  belongs_to :payment
  belongs_to :category
  belongs_to :provider
  belongs_to :office
end
