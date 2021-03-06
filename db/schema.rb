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

ActiveRecord::Schema.define(version: 20180920170628) do

  create_table "people", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "age"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "tags_id"
    t.string   "product_name"
    t.string   "image"
    t.text     "info"
    t.float    "price"
    t.integer  "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "products", ["tags_id"], name: "index_products_on_tags_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.integer  "std_class"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_upload_data", force: :cascade do |t|
    t.integer "users_id"
    t.text    "shopName",      null: false
    t.text    "offers",        null: false
    t.float   "startingPrice", null: false
    t.date    "endDate",       null: false
  end

  add_index "user_upload_data", ["users_id"], name: "index_user_upload_data_on_users_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",      null: false
    t.text     "email",         null: false
    t.string   "password_hash", null: false
    t.string   "password_salt", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
