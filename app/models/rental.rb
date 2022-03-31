class Rental < ApplicationRecord
  has_many :routes
  accepts_nested_attributes_for :routes, allow_destroy:true
end
