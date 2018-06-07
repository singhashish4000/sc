# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180603131944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "associates", force: :cascade do |t|
    t.string   "company_name"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "mobile_number"
    t.integer  "landline_number"
    t.string   "bussiness_category"
    t.string   "address_building"
    t.string   "address_street"
    t.string   "address_landmark"
    t.string   "address_area"
    t.string   "address_city"
    t.integer  "address_pincode"
    t.string   "contact_person"
    t.string   "contact_person_designation"
    t.integer  "fax_number"
    t.integer  "fax_number_two"
    t.integer  "toll_free_number"
    t.integer  "toll_free_number_two"
    t.string   "email_id"
    t.string   "website"
    t.boolean  "display_hours_status"
    t.integer  "year_of_establishment"
    t.integer  "annual_turnover"
    t.string   "number_of_employees"
    t.string   "professional_association"
    t.string   "certifications"
    t.integer  "payment_mode_id"
    t.string   "monday_from"
    t.string   "monday_to"
    t.boolean  "monday_status"
    t.string   "tuesday_from"
    t.string   "tuesday_to"
    t.boolean  "tuesday_status"
    t.string   "wednesday_from"
    t.string   "wednesday_to"
    t.boolean  "wednesday_status"
    t.string   "thursday_from"
    t.string   "thursday_to"
    t.boolean  "thursday_status"
    t.string   "friday_from"
    t.string   "friday_to"
    t.boolean  "friday_status"
    t.string   "saturday_from"
    t.string   "saturday_to"
    t.boolean  "saturday_status"
    t.string   "sunday_from"
    t.string   "sunday_to"
    t.boolean  "sunday_status"
    t.integer  "center_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "associates", ["center_id"], name: "index_associates_on_center_id", using: :btree
  add_index "associates", ["payment_mode_id"], name: "index_associates_on_payment_mode_id", using: :btree

  create_table "centers", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "center_head"
    t.integer  "no_of_volenters", default: 0
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "district_id"
    t.integer  "sub_district_id"
    t.integer  "town_village_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "volenter_id"
    t.integer  "phone_number"
  end

  add_index "centers", ["country_id"], name: "index_centers_on_country_id", using: :btree
  add_index "centers", ["district_id"], name: "index_centers_on_district_id", using: :btree
  add_index "centers", ["state_id"], name: "index_centers_on_state_id", using: :btree
  add_index "centers", ["sub_district_id"], name: "index_centers_on_sub_district_id", using: :btree
  add_index "centers", ["town_village_id"], name: "index_centers_on_town_village_id", using: :btree
  add_index "centers", ["volenter_id"], name: "index_centers_on_volenter_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "districts", ["state_id"], name: "index_districts_on_state_id", using: :btree

  create_table "payment_modes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "sub_districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sub_districts", ["district_id"], name: "index_sub_districts_on_district_id", using: :btree

  create_table "town_villages", force: :cascade do |t|
    t.integer  "sub_district_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
  end

  add_index "town_villages", ["sub_district_id"], name: "index_town_villages_on_sub_district_id", using: :btree

  create_table "volenters", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.text     "address"
    t.integer  "phone_no"
    t.string   "adhaar_no"
    t.integer  "center_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "is_admin"
    t.boolean  "is_super_admin"
  end

  add_index "volenters", ["center_id"], name: "index_volenters_on_center_id", using: :btree
  add_index "volenters", ["email"], name: "index_volenters_on_email", unique: true, using: :btree
  add_index "volenters", ["reset_password_token"], name: "index_volenters_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "associates", "centers"
  add_foreign_key "associates", "payment_modes"
  add_foreign_key "centers", "countries"
  add_foreign_key "centers", "districts"
  add_foreign_key "centers", "states"
  add_foreign_key "centers", "sub_districts"
  add_foreign_key "centers", "town_villages"
  add_foreign_key "centers", "volenters"
  add_foreign_key "districts", "states"
  add_foreign_key "states", "countries"
  add_foreign_key "sub_districts", "districts"
  add_foreign_key "town_villages", "sub_districts"
  add_foreign_key "volenters", "centers"
end
