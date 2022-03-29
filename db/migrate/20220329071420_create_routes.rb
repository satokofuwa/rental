class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string "route1"
      t.string "station1"
      t.integer "walk1"
      t.string "route2"
      t.string "station2"
      t.integer "walk2"
      t.references :rental, foreign_key: true
    end
  end
end
