class Course < ApplicationRecord
  has_many :ongoing_courses
  has_many :questions, dependent: :destroy
  belongs_to :chapter, optional: true
  has_many_attached :photos
  has_one_attached :file
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
