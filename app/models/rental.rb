class Rental < ApplicationRecord
  accepts_nested_attributes_for :routes, allow_destroy:true
end
