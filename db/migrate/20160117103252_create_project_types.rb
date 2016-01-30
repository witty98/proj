class CreateProjectTypes < ActiveRecord::Migration
  def change
    create_table :project_types do |t|
      t.string :name
	  t.string :code

      t.timestamps null: false
    end
  end
end
