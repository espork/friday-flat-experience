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

ActiveRecord::Schema.define(version: 20140529012622) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.integer  "category_id"
    t.boolean  "private"
    t.string   "title"
    t.text     "description"
    t.text     "included"
    t.text     "not_included"
    t.integer  "duration"
    t.string   "duration_type"
    t.integer  "max_group_size"
    t.string   "availability"
    t.text     "additional_information"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["category_id"], name: "index_experiences_on_category_id", using: :btree
  add_index "experiences", ["location_id"], name: "index_experiences_on_location_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "country"
    t.string   "city"
    t.string   "adress"
    t.string   "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.string   "when"
    t.string   "what"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programs", ["experience_id"], name: "index_programs_on_experience_id", using: :btree

end
