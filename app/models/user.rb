class User < ApplicationRecord
    has_many :credits
    has_many :user_vouchers
    has_many :vouchers, :through => :user_vouchers
    has_many :merchants_users
    has_many :merchants, :through => :merchants_users
end
