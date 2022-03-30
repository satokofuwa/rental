class RemoveColumnsInRoutes < ActiveRecord::Migration[6.0]
  def change
    remove_column :routes, :route2, :string
    remove_column :routes, :station2, :string
    remove_column :routes, :walk2, :integer
  end
end
