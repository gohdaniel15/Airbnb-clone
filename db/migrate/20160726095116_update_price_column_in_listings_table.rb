class UpdatePriceColumnInListingsTable < ActiveRecord::Migration
  def change
    remove_column :listings, :price, :text
  end
end
