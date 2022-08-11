class Credit < ApplicationRecord
    belongs_to :user
    has_many :user_vouchers
    has_many :brands
    belongs_to :institution 
end
