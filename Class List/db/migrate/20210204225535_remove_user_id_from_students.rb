class RemoveUserIdFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :user_id
  end
end
