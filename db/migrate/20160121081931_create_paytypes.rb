class CreatePaytypes < ActiveRecord::Migration
  def change
    create_table :paytypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
