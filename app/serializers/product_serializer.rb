class ProductSerializer
  include JSONAPI::Serializer
  attributes  :merchant,
              :brand,
              :name,
              :description,
              :image,
              :price,
              :active
end
