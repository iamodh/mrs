class CreateCourses < ActiveRecord::Migration[8.1]
  def change
    create_table :courses do |t|
      t.references :marathon, null: false, foreign_key: true
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
