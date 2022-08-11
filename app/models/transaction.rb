class Transaction < ApplicationRecord
    belongs_to :voucher
    belongs_to :voucher_type
    belongs_to :merchant_account
    belongs_to :user
end
