class Rate < ApplicationRecord
  belongs_to :room
  validates :name, presence: { :message => "El nombre de la tarifa no puede estar vacío" }
  validates :start_at, presence: { :message => "La fecha de inicio no puede estar vacía" }
  validates :end_at, presence: { :message => "La fecha de fin no puede estar vacía" }
  validates :price, presence: { :message => "El precio no puede estar vacío" }
  validates :price, numericality: { :message => "El precio debe ser un número" }
end
