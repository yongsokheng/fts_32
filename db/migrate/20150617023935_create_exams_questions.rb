class CreateExamsQuestions < ActiveRecord::Migration
  def change
    create_table :exams_questions do |t|
      t.references :exam, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :option, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
