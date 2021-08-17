class CreateStudentExams < ActiveRecord::Migration[6.1]
  def change
    create_table :student_exams do |t|
      t.references :student, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.timestamps
    end
  end
end
