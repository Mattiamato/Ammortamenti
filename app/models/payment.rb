class Payment < ActiveRecord::Base
  belongs_to :account
  has_many :providers, :through =>:items
end
