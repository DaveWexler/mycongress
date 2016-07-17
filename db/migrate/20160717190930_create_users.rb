class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.integer :state_id
      t.integer :district_id
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
