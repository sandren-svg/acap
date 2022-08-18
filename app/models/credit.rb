class Credit < ApplicationRecord
    belongs_to :user
    has_many :vouchers
    has_many :brands
    has_many :transactions
    belongs_to :institution
end
