class Course < ApplicationRecord
  has_many :ongoing_courses
  has_many :questions
end
