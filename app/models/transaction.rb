class Transaction < ApplicationRecord
    belongs_to :voucher
    belongs_to :merchant # isnt it supposed to be merchnat account only?
    belongs_to :user
end
