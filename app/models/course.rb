class Course < ApplicationRecord
  has_many :ongoing_courses
  has_many :questions, dependent: :destroy
  has_many_attached :photos
  has_one_attached :file
end
