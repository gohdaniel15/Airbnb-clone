class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :reservation_id
      t.integer :ref_number
      t.integer :last_four
      t.boolean :success
      
      t.timestamps null: false
    end
  end
end
