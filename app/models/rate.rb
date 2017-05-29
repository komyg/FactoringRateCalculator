class Rate < ApplicationRecord
  has_many :requests
  validates_associated :requests

  validates :rate, numericality: true, presence: true
  validates :days, numericality: { greater_than_or_equal_to: 10 }, presence: true
  validates :rate, :days, :default_rate, presence: true
end
