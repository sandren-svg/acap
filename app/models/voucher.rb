class Voucher < ApplicationRecord
    has_many: user, through: :user_vouchers
    belongs_to :brand
    belongs_to :credit
    belongs_to :merchant_account
end
