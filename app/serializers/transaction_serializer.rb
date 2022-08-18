class TransactionSerializer
  include JSONAPI::Serializer
  attributes  :voucher,
              :amount,
              :merchant,
              :user
end
