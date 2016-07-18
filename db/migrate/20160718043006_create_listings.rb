class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :address
      t.string :city
      t.string :country
      t.string :property_type
      t.integer :no_of_beds
      t.integer :no_of_bathrooms
      t.text :description
      t.text :price

      t.timestamps null: false
    end
  end
end
