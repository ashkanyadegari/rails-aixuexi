class OngoingCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :user_id, uniqueness: { scope: :course }
end
