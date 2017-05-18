class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :address, :address_two, :city, :state, :zipcode
  has_many :tips
end
