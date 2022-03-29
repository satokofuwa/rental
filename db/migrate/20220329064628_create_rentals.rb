class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.string "property"
      t.string "price"
      t.text   "address"
      t.string "old"
      t.text   "content"
      t.index ["property"], name: "index_rentals_on_property", unique: true
    end
  end
end
