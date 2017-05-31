module FactoringCalculator
  extend ActiveSupport::Concern

  module ClassMethods

    # Calculates a receivable value using the default rate.
    def value_default_rate(title_value, term)
      validate_input(title_value, term)

      default_rate = Rate.find_by(default_rate: true)
      calc_receivable_value(title_value, term, default_rate.rate, default_rate.days)
    end

    # Calculates a receivable value using a variable rate
    def value_variable_rate(title_value, term)
      raise "Method not yet implemented"
    end

    private

    def validate_input(title_value, term)
      if term <= 0
        raise "The tilte term of: #{term} must be greater than 0"
      end

      if title_value <= 0
        raise "The title value of: #{title_value} must be greater than 0"
      end
    end

    # Calculates a receivable value using any rate.
    def calc_receivable_value(title_value, term, rate, days)
      # Calculates the final rate that will be applied after a given number of days.
      final_rate = rate * (term / days.to_f).ceil

      value = title_value * (1 - final_rate)
      value
    end
    
  end
end
