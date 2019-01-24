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

ActiveRecord::Schema.define(version: 20190124212327) do

  create_table "claims", force: :cascade do |t|
    t.integer "price_drop", default: 0
    t.integer "percentage_drop", default: 0
    t.integer "status", default: 1
    t.integer "cap_drop", default: 0
    t.integer "company_id"
    t.integer "traded_inflation", default: 0
    t.integer "signed_losses", default: 0
    t.integer "total_potential_income", default: 0
    t.integer "current_potential_income", default: 0
    t.text "data_provided"
    t.text "likely_bookbuild"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_claims_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", default: ""
    t.string "address", default: ""
    t.string "phone", default: ""
    t.string "email", default: ""
    t.string "website", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", default: ""
    t.string "address", default: ""
    t.string "phone", default: ""
    t.string "email", default: ""
    t.string "position", default: ""
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

end
