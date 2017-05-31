# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170529145303) do

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_customers_on_company_id"
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "rate", precision: 8, scale: 5
    t.integer "days"
    t.decimal "monthy_revenue", precision: 15, scale: 3
    t.integer "min_days"
    t.decimal "min_title_value", precision: 15, scale: 3
    t.boolean "default_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "title_value", precision: 15, scale: 3
    t.integer "term"
    t.decimal "monthly_revenue", precision: 15, scale: 3
    t.decimal "receivable_value", precision: 15, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rate_id"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_requests_on_customer_id"
    t.index ["rate_id"], name: "index_requests_on_rate_id"
  end

  add_foreign_key "customers", "companies"
  add_foreign_key "requests", "customers"
  add_foreign_key "requests", "rates"
end
