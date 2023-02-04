class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :customer
  enum status: { pending: 0, confirmed: 1, cancelled: 2 }
  validates :status, presence: true
  validates :description, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true

  def start_time
    self.start_at
  end
end
