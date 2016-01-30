class CreatePartakers < ActiveRecord::Migration
  def change
    create_table :partakers do |t|
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
	add_index :partakers, [:project_id, :user_id], unique: true
  end
end
