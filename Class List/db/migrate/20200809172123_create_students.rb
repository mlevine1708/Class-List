class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :parent
      t.string :teacher
      t.integer :grade
      t.integer :user_id
      t.integer :teacher_id
      
    end
  end
end
