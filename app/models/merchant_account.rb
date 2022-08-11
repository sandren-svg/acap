class MerchantAccount < ApplicationRecord
    has_many: brands
    belongs_to :user
    
end
