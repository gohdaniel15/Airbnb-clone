require_relative '20160718072633_add_first_name_column_to_user_table'

class FixupAddFirstNamesToUsersTable < ActiveRecord::Migration
  def change
    revert AddFirstNameColumnToUserTable

    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :gender, :string
    add_column :users, :birthdate, :date
  end
end
