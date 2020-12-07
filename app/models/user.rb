class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company, optional: true
  validates :open_id, uniqueness: true
  has_many :ongoing_courses
  has_many :user_answers
  # has_one_attached :avatar
  # has_many_attached :photos
end
