require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "should validate the e-mail" do
    customer = Customer.new(name: "Paul Atreides", email: "paul.atreides@dune.com", password_digest: "password", company_id: Company.find_by(name: "Bradesco").id)
    assert customer.valid?

    customer = Customer.new(name: "Miles Teg", email: "miles.tegdune.com", password_digest: "password", company_id: Company.find_by(name: "Bradesco").id)
    assert_not customer.valid?
  end

  test "should create a new customer" do
    company = Company.find_by(name: "Bradesco")

    user = Customer.new(name: "AA", email: "aas@asda.com", password: "password", company_id: company.id)
    assert user.save
  end

end
