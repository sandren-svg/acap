class Transaction < ApplicationRecord
    belongs_to :voucher
    belongs_to :voucher_type
    belongs_to :merchant_account # isnt it supposed to be merchnat account only?
    belongs_to :user
end
