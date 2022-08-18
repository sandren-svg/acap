class UserSerializer
  include JSONAPI::Serializer
  attributes  :name, 
              :ic_no, 
              :email, 
              :phone_no
end
