class Room < ApplicationRecord
  has_one_attached :image
  has_many :rates
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  enum status: { available: 0, unavailable: 1, soft_delete: 2 }
  scope :default, -> { where.not(status: :soft_delete) }
  def destroy
    self.soft_delete
  end

  def soft_delete
    self.status = :soft_delete
    self.save
  end

end
