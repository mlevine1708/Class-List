class ChangeStudentTable < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :email, :string
    add_column :students, :phone_number, :integer 
  end
end
