class Company < ApplicationRecord
  has_many :customers

  validates_associated :customers
  validates :name, presence: true
end
