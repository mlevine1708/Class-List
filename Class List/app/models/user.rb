class User < ApplicationRecord

  has_many :students
  has_many :teachers, through: :students
  
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates_uniqueness_of :uid, conditions: -> { where.not(uid: nil) }
  validates_presence_of :password_digest, conditions: -> { where(uid: nil) }
  has_secure_password

end
