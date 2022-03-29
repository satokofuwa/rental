# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_29_071420) do

  create_table "rentals", force: :cascade do |t|
    t.string "property"
    t.string "price"
    t.text "address"
    t.string "old"
    t.text "content"
    t.index ["property"], name: "index_rentals_on_property", unique: true
  end

  create_table "routes", force: :cascade do |t|
    t.string "route1"
    t.string "station1"
    t.integer "walk1"
    t.string "route2"
    t.string "station2"
    t.integer "walk2"
    t.integer "rental_id"
    t.index ["rental_id"], name: "index_routes_on_rental_id"
  end

  add_foreign_key "routes", "rentals"
end
