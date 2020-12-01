class Question < ApplicationRecord
  belongs_to :course
  has_many :choices
  has_many :user_answers
end
