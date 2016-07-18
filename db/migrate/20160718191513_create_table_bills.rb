class CreateTableBills < ActiveRecord::Migration[5.0]
  def change
    create_table :table_bills do |t|
    t.string  :title
      t.integer :bill_id
      t.string  :chamber
      t.string  :committee_ids
      t.boolean :active
      t.boolean :awaiting_signature
      t.boolean :enacted
      t.boolean :vetoed
      t.string  :introduced_on
      t.string  :pdf
      t.integer :politician_id
      t.integer :cosponsor_count
      t.string  :url
      
      t.timestamps
    end
  end
end
