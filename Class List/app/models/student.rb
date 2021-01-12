class Student < ApplicationRecord

  belongs_to :user
  belongs_to :teacher


#  validates :teacher_id, presence: true
#  validates_associated :teacher
  accepts_nested_attributes_for :teacher, reject_if: lambda {|attributes| attributes['kind'].blank?}

  scope :order_by_grade, -> { order(:grade) }
  scope :search_by_grade, -> (grade) { where("grade > ?", grade) }

  def teacher_attributes=(attributes)
    teacher = Teacher.find_or_create_by(attributes)
    self.teacher = teacher
  end

end
