class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :code, :unique => true
	  t.integer :monthid	  
      t.date :start_time
      t.date :end_time

      t.timestamps null: false
    end
	add_reference :projects, :user, index: true, foreign_key: true
	add_reference :projects, :ProjectType, index: true, foreign_key: true
	add_reference :projects, :ProjectStatus, index: true, foreign_key: true
  end
end
