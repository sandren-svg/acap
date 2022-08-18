class SettlementSerializer
  include JSONAPI::Serializer
  attributes :amount,
             :merchant
end
