class Account < ActiveRecord::Base
  has_and_belongs_to_many :user, :join_table =>"users_accounts"
  has_many :payments
end
