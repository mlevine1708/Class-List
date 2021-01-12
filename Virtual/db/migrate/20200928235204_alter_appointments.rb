class AlterAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :teacher
    remove_column :appointments, :student
    add_column :appointments, :teacher_id, :integer
    add_column :appointments, :student_id, :integer
    add_column :appointments, :user_id, :integer
  end
end
