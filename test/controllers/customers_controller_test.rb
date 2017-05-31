require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @createUserUrl = "/users"
    @signUpPageUrl = "/signup"
  end

  test "should display the signup page" do
    get @signUpPageUrl
    assert_response :success
  end

  test "should create new user and new company" do
    post @createUserUrl, params: { name: "Luke Skywalker", email: "luke.skywalker@starwars.com", password: "password", company_name: "Lucasfilm" }
    assert_redirected_to "/"

    # Check if the user and company was created on the database.
    company = Company.find_by(name: "Lucasfilm")
    assert company
    customer = Customer.find_by(email: "luke.skywalker@starwars.com")
    assert customer
    puts "Password: #{customer.password}"
  end
end
