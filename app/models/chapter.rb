class Chapter < ApplicationRecord
  has_many :courses
  has_one_attached :photo
end
