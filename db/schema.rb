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

ActiveRecord::Schema.define(version: 20140704025313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prices", force: true do |t|
    t.integer  "product_id"
    t.integer  "price_cents"
    t.string   "currency"
    t.datetime "seen_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prices", ["product_id"], name: "index_prices_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "retailer_id"
    t.float    "hotness_score", default: 0.0
  end

  add_index "products", ["retailer_id"], name: "index_products_on_retailer_id", using: :btree

  create_table "retailers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sell_outs", force: true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_level_id"
    t.integer  "size_id"
    t.integer  "days_taken"
    t.datetime "occurred_at"
  end

  create_table "sizes", force: true do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_events", force: true do |t|
    t.string   "name"
    t.integer  "stock_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stock_events", ["name"], name: "index_stock_events_on_name", using: :btree
  add_index "stock_events", ["stock_level_id"], name: "index_stock_events_on_stock_level_id", using: :btree

  create_table "stock_levels", force: true do |t|
    t.string   "size"
    t.string   "status"
    t.datetime "seen_at"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size_id"
  end

  add_index "stock_levels", ["product_id"], name: "index_stock_levels_on_product_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
