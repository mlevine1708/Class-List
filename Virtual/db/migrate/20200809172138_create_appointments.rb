class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :teacher
      t.string :student
      t.datetime :date
      
    end
  end
end
