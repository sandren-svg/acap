class CreditSerializer
  include JSONAPI::Serializer
  attributes  :name,
              :user,
              :balance,
              :voucher,
              :brand,
              :institution
end
