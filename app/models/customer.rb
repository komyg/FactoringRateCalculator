class Customer < ApplicationRecord
  has_secure_password

  belongs_to :company
  has_many :requests

  validates_associated :requests
  validates :name, presence: true
  validates :email, presence: true, email: true
end
