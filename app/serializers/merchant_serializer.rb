class MerchantSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :phone_no, :reg_no, :email, :brand_id, :created_at, :updated_at
end
