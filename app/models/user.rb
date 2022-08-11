class User < ApplicationRecord
    has_many :credits
    has_many :user_vouchers
    has_many :vouchers, :through => :user_vouchers
end
