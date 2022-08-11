class MerchantAccount < ApplicationRecord
    belongs_to :brand
    belongs_to :user # do we need user?
    has_many :products
    has_many :vouchers
    has_many :transactions
    has_many :settlements
           
end
