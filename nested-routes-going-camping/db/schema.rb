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

ActiveRecord::Schema.define(version: 20170412203038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campers", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "campsite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campground_amenities", force: :cascade do |t|
    t.integer "campground_id"
    t.integer "amenity_id"
    t.index ["amenity_id"], name: "index_campground_amenities_on_amenity_id", using: :btree
    t.index ["campground_id"], name: "index_campground_amenities_on_campground_id", using: :btree
  end

  create_table "campgrounds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.text     "description",           default: "no description yet", null: false
    t.money    "fee",         scale: 2, default: "0.0",                null: false
  end

  create_table "campsites", force: :cascade do |t|
    t.integer "campground_id"
    t.boolean "available",     default: true, null: false
    t.integer "size",                         null: false
    t.integer "campsite_num"
    t.index ["campground_id"], name: "index_campsites_on_campground_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "campground_id"
    t.integer  "camper_id"
    t.string   "title",         null: false
    t.text     "body",          null: false
    t.integer  "rating",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["camper_id"], name: "index_reviews_on_camper_id", using: :btree
    t.index ["campground_id"], name: "index_reviews_on_campground_id", using: :btree
  end

  create_table "supplies", force: :cascade do |t|
    t.string   "name"
    t.integer  "camper_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "campground_amenities", "amenities"
  add_foreign_key "campground_amenities", "campgrounds"
  add_foreign_key "campsites", "campgrounds"
  add_foreign_key "reviews", "campers"
  add_foreign_key "reviews", "campgrounds"
end
