class CreatePoliticians < ActiveRecord::Migration[5.0]
  def change
    create_table :politicians do |t|
      t.string :chamber
      t.string :bioguide_id
      t.string :birthday
      t.string :crp_id
      t.string :fax
      t.string :fec_ids
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :gender
      t.string :govtrack_id
      t.boolean :in_office
      t.string :leadership_role
      t.string :name_suffix
      t.string :nickname
      t.string :oc_email
      t.string :ocd_id
      t.string :office
      t.string :party
      t.string :phone
      t.string :term_end
      t.string :term_start
      t.string :thomas_id
      t.string :title
      t.integer :votesmart_id
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :youtube
      t.string :office
      t.string :state_rank
      t.integer :senate_class
      t.string :lis_id
      t.integer :state_id
      t.integer :district_id

      t.timestamps
    end
  end
end
