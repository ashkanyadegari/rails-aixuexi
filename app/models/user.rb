class User < ApplicationRecord
  belongs_to :company, optional: true
  has_one_attached :avatar
  has_many_attached :photos
end
