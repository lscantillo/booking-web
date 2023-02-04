class Room < ApplicationRecord
  has_one_attached :image
  has_many :rates, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
