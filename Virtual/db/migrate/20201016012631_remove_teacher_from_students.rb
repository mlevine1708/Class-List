class RemoveTeacherFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :teacher, :string
  end
end
