class AddNameColumnToListingsTable < ActiveRecord::Migration
  def change
    add_column :listings, :name, :string, limit: 100
  end
end
