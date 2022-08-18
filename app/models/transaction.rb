class Transaction < ApplicationRecord
    belongs_to :credit
    belongs_to :merchant
    belongs_to :user
end
