class CreateImplements < ActiveRecord::Migration
  def change
    create_table :implements do |t|
      t.string :job
      t.references :project, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
	add_index :implements, [:project_id, :department_id], unique: true
  end
end
