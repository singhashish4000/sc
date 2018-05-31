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

ActiveRecord::Schema.define(version: 20180526101520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "centers", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "no_of_volunters"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "district_id"
    t.integer  "sub_district_id"
    t.integer  "town_village_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "centers", ["country_id"], name: "index_centers_on_country_id", using: :btree
  add_index "centers", ["district_id"], name: "index_centers_on_district_id", using: :btree
  add_index "centers", ["state_id"], name: "index_centers_on_state_id", using: :btree
  add_index "centers", ["sub_district_id"], name: "index_centers_on_sub_district_id", using: :btree
  add_index "centers", ["town_village_id"], name: "index_centers_on_town_village_id", using: :btree

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

  add_foreign_key "centers", "countries"
  add_foreign_key "centers", "districts"
  add_foreign_key "centers", "states"
  add_foreign_key "centers", "sub_districts"
  add_foreign_key "centers", "town_villages"
  add_foreign_key "districts", "states"
  add_foreign_key "states", "countries"
  add_foreign_key "sub_districts", "districts"
  add_foreign_key "town_villages", "sub_districts"
end
