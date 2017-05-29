class Request < ApplicationRecord
  belongs_to :customer, required: true
  belongs_to :rate, required: true

  validates :term, presence: true, numericality: { greater_than_or_equal_to: 10 }
  validates :title_value, presence: true, numericality: { greater_than_or_equal_to: 500 }
  validates :monthly_revenue, :receivable_value, presence: true, numericality: true
end
