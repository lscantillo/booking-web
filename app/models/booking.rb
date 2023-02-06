class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :customer
  enum status: { pending: 0, confirmed: 1, cancelled: 2 , soft_delete: 3 }
  validates :title, presence: true
  validates :status, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :end_at, comparison: { greater_than: :start_at }



  def self.default
    where.not(status: :soft_delete)
  end

  def self.sort_by_start_at
    order(:created_at => :desc)
  end
  def start_time
    self.start_at
  end

  def destroy
    self.soft_delete
  end

  def soft_delete
    self.status = :soft_delete
    self.save
  end

end
