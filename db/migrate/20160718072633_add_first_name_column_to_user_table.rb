class AddFirstNameColumnToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :friendly_name, :string
    add_column :users, :gender, :string
    add_column :users, :birthdate, :date
  end
end
