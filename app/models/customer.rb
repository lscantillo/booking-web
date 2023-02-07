class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :number_id, presence: true
  validates :email, presence: true
  validates :cellphone, presence: true
  has_many :bookings
  enum status: { active: 0, inactive: 1, soft_delete: 2 }
  def self.full_name
    select(:first_name, :last_name,:id).map { |customer| ["#{customer.first_name} #{customer.last_name}", customer.id] }
  end

  def self.default
    where.not(status: :soft_delete)
  end

  def destroy
    self.soft_delete
  end

  def soft_delete
    self.status = :soft_delete
    self.save
  end
end
