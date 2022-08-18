class VoucherSerializer
  include JSONAPI::Serializer
  attributes  :name, 
              :description, 
              :image, 
              :start_date, 
              :expiry_date, 
              :amount, 
              :amount_used, 
              :capped_amount, 
              :min_purchase, 
              :user, 
              :merchant, 
              :brand,
              :credit
end




#attributes :user do |obj| 
  #user = obj.user
  #{attributes :name, username:, :email }
#end