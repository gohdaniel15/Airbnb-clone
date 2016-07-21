class AddNoOfGuestsColumnToListingsTable < ActiveRecord::Migration
  def change
    add_column :listings, :no_of_guests, :integer
  end
end
