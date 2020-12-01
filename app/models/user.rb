class User < ApplicationRecord
  belongs_to :company, optional: true
  has_many :ongoing_courses
  has_many :user_answers
end
