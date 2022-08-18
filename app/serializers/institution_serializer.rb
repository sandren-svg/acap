class InstitutionSerializer
  include JSONAPI::Serializer
  attributes  :name,
              :phone_no,
              :email
end
