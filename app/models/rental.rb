class Rental < ApplicationRecord
  validates_presence_of :property,
  message: "物件名を入れてください！"

  validates_presence_of :address,
  message: "住所を入れてください！"

  validates_presence_of :old,
  message: "築年数を入力してください！"

  validates_presence_of :content,
  message: "備考欄"
  has_many :routes, dependent: :destroy
  accepts_nested_attributes_for :routes, allow_destroy: true ,reject_if: :all_blank

  
end
