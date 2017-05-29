require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "should validate the e-mail" do

    #(name: "Jake Blair", email: "jake.blair@bradesco.com.br", company_id: bradesco.id)
    customer = Customer.new(name: "Paul Atreides", email: "paul.atreides@dune.com", company_id: Company.find_by(name: "Bradesco").id)
    assert customer.valid?

    customer = Customer.new(name: "Miles Teg", email: "miles.tegdune.com", company_id: Company.find_by(name: "Bradesco").id)
    assert_not customer.valid?

  end

end
