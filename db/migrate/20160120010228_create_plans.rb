class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :content
      t.date :start
      t.date :plan_end
      t.date :end
      t.integer :status
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
