class Memory < ApplicationRecord
  belongs_to :baby
  belongs_to :user
  has_many_attached :photos
  has_many_attached :videos
  has_many :comments
end
