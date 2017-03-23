class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :mascott
      t.string :principal 

      t.timestamps
    end
  end
end
