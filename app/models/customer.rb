class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :number_id, presence: true
  validates :email, presence: true
  validates :cellphone, presence: true
end
