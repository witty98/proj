class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :name
      t.string :code,:unique => true
      t.string :partyc
      t.string :director
      t.string :director_tel
      t.decimal :total,:precision => 12, :scale => 2  
      t.decimal :surplus,:precision => 12, :scale => 2  
      t.text :detail
      t.date :sign_time
      t.integer :time_limit
	  t.boolean :status,:default => true
      t.references :project, index: true, foreign_key: true
      t.references :partyb, index: true, foreign_key: true
      t.references :paytype, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
