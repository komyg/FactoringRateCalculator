require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  test "shold create new valid request" do
    request = Request.new_request_default(1500, 28, 75000, 1)

    assert request.valid?
    assert_equal 1425.75, request.receivable_value
  end

  test "should not create a request when term is less than rate.min_days" do
    request = Request.new_request_default(1500, 9, 75000, 1)
    assert_not request.valid?
    assert_empty request.errors[:days]
  end

  test "should not create a request when the title_value is less than rate.min_title_value" do
    request = Request.new_request_default(200, 28, 75000, 1)
    assert_not request.valid?
  end
end
