class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :question_number
      t.integer :duration

      t.timestamps null: false
    end
  end
end
