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

ActiveRecord::Schema.define(version: 20160210230208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", force: :cascade do |t|
    t.integer  "position_id"
    t.integer  "area_id"
    t.string   "full_address", null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: :cascade do |t|
    t.integer  "building_id"
    t.string   "full_name",                               null: false
    t.string   "gender"
    t.string   "date_birth",                              null: false
    t.string   "appartment_number",                       null: false
    t.string   "phone",                   default: "-"
    t.string   "preferential_categories", default: "-"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "not_visible",             default: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "type"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subdivisions", force: :cascade do |t|
    t.string   "name"
    t.string   "number",      null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
