class User < ApplicationRecord
    has_many :credits
    has_many :user_vouchers
end
