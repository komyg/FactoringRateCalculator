class Request < ApplicationRecord
  include FactoringCalculator

  belongs_to :customer, required: true
  belongs_to :rate, required: true

  validates :term, presence: true, numericality: true
  validates :title_value, presence: true, numericality: true
  validates :monthly_revenue, :receivable_value, presence: true, numericality: true
  validate :validate_min_term, :validate_min_title_value

  # Craetes a new request using the default rate
  def self.new_request_default(title_value, term, monthly_revenue, customer_id)
    default_rate = Rate.find_by(default_rate: true)
    self.new_request(title_value, term, monthly_revenue, default_rate, customer_id)
  end

  # Creates a new request using the supplied rate
  def self.new_request(title_value, term, monthly_revenue, rate, customer_id)
    receivable_value = value_default_rate(title_value, term)
    customer = Customer.find_by(id: customer_id)

    request = customer.requests.new(title_value: title_value, term: term, monthly_revenue: monthly_revenue, receivable_value: receivable_value, rate: rate)
    request
  end

  private

  # Custom validations

  def validate_min_term
    if rate && term < rate.min_days
      errors.add(:term, "The term must be greater than or equal to #{rate.min_days}")
    end
  end

  def validate_min_title_value
    if rate && title_value < rate.min_title_value
      errors.add(:title_value, "The title_value must be greater than or equal to #{rate.min_title_value}")
    end
  end
end
