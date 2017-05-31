require 'test_helper'

class DummyClass
  include FactoringCalculator
end

class FactoringCalculatorTest < ActiveSupport::TestCase

  setup do
    @dummy_class = DummyClass.new
  end

  test "should calculate a receivable value using the default rate" do
    value = @dummy_class.value_default_rate(1500, 28)
    assert_equal 1425.75, value

    value = @dummy_class.value_default_rate(1500, 10)
    assert_equal 1475.25, value
  end

  test "should raise an error if the title term is less or equal to 0" do
    term = 0
    assert_raises("The tilte term of: #{term} must be greater than 0") { @dummy_class.value_default_rate(1500, term) }

    term = -1
    assert_raises("The tilte term of: #{term} must be greater than 0") { @dummy_class.value_default_rate(1500, term) }
  end

  test "should raise an error if the tile value is less or equal to 0" do
    title_value = 0
    assert_raises("The title value of: #{title_value} must be greater than 0") { @dummy_class.value_default_rate(title_value, 10) }

    title_value = -1
    assert_raises("The title value of: #{title_value} must be greater than 0") { @dummy_class.value_default_rate(title_value, 10) }
  end

end
