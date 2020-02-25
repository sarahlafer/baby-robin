class Memory < ApplicationRecord
  belongs_to :baby
  has_many_attached :photos
  has_many_attached :videos
end
