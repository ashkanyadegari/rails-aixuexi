class Question < ApplicationRecord
  belongs_to :course
  has_many :choices, dependent: :destroy
  has_many :user_answers
end
