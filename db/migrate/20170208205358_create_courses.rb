class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :code
      t.integer :num_students, default: 0
      t.boolean :active, default: true
      t.belongs_to :school

      t.timestamps
    end
  end
end
