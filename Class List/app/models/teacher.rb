class Teacher < ApplicationRecord

  has_many :students
  has_many :users, through: :students


  def ordered_students
    students.order_by_grade
  end

  def self.search(p)
    Teacher.where("name LIKE ?", "%" + "p" + "%")
  end
  
end
