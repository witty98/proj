class CreatePartybs < ActiveRecord::Migration
  def change
    create_table :partybs do |t|
      t.string :name, unique: true
      t.string :corporation
      t.string :contacts
      t.string :corporation_tel
      t.string :contacts_tel
      t.string :address
      t.string :postcode
      t.string :bank
      t.string :account

      t.timestamps null: false
    end
  end
end
