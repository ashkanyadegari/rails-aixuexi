class Course < ApplicationRecord
  has_many :ongoing_courses
  has_many :questions
  has_many_attached :photos
end
