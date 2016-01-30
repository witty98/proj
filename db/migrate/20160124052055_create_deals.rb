class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.decimal :plan_amount,:precision => 12, :scale => 2  
      t.decimal :amount,:precision => 12, :scale => 2 
      t.date :deal_time
      t.references :user, index: true, foreign_key: true
      t.references :contract, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
