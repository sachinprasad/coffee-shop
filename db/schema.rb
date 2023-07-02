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

ActiveRecord::Schema.define(version: 2023_07_01_172216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.decimal "tax_rate", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "discounted_item_id"
    t.boolean "is_free", default: false
    t.decimal "discount_percent", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discounted_item_id"], name: "index_offers_on_discounted_item_id"
    t.index ["item_id"], name: "index_offers_on_item_id"
  end

  create_table "ordered_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "order_id"
    t.decimal "amount_paid", precision: 8, scale: 2
    t.decimal "discount_applied", precision: 5, scale: 2
    t.decimal "tax_rate_applied", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "offer_id"
    t.integer "quantity", default: 1
    t.index ["item_id"], name: "index_ordered_items_on_item_id"
    t.index ["offer_id"], name: "index_ordered_items_on_offer_id"
    t.index ["order_id"], name: "index_ordered_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "final_total", precision: 8, scale: 2
    t.integer "order_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "user_role", default: 0
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "offers", "items", column: "discounted_item_id"
  add_foreign_key "ordered_items", "offers"
end
