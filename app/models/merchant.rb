class Merchant < ApplicationRecord
    belongs_to :brand, optional: true
    has_many :products
    has_many :vouchers
    has_many :transactions
    has_many :settlements
    has_many :merchants_users
    has_many :users, :through => :merchants_users

    validates :name, :phone_no, :reg_no, :email, presence: true
end
