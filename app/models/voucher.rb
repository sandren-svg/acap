class Voucher < ApplicationRecord
    has_many: user_vouchers
    has_many :users, :through => :user_vouchers
    belongs_to :brand # do wee ned this?
    belongs_to :credit
    belongs_to :merchant_account
end
