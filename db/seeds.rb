# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Populate development and test environments
if Rails.env == "development" || Rails.env == "test"

  avaya = Company.create!(name: "Avaya")
  microsoft = Company.create!(name: "Microsoft")
  bradesco = Company.create!(name: "Bradesco")

  customer = Customer.create!(name: "Leon Schmidt", email: "leon.schmidt@avaya.com", company_id: avaya.id)
  Customer.create!(name: "Teri Wright", email: "teri.wright@avaya.com", company_id: avaya.id)
  Customer.create!(name: "Jasmine Bush", email: "jasmine.bush@microsoft.com", company_id: microsoft.id)
  Customer.create!(name: "Jake Blair", email: "jake.blair@bradesco.com.br", company_id: bradesco.id)

  rate = Rate.create!(rate: 0.0165, days: 10, default_rate: true)

  Request.create!(title_value: 1500, term: 28, monthly_revenue: 75000, receivable_value: 1425.75, rate_id: rate.id, customer_id: customer.id)

elsif Rails.env == "production"

  Rate.create(rate: 0.0165, days: 10, default_rate: true)

end
