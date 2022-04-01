class Rental < ApplicationRecord
  has_many :routes, dependent: :destroy
  accepts_nested_attributes_for :routes, allow_destroy:true ,reject_if: :all_blank
end
