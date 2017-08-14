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

ActiveRecord::Schema.define(version: 20170813055449) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address",                         null: false
    t.string   "name",                            null: false
    t.string   "cellphone",                       null: false
    t.boolean  "default_address", default: false
    t.integer  "user_id",                         null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "address_type"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "weight",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",                            null: false
    t.integer  "product_id",                          null: false
    t.integer  "amount",                              null: false
    t.decimal  "price",      precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",                              null: false
    t.integer  "address_id",                           null: false
    t.string   "status"
    t.decimal  "total_money", precision: 10, scale: 2
    t.datetime "payment_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                                                                null: false
    t.text     "description"
    t.string   "status",                                              default: "Off"
    t.integer  "amount",                                              default: 0,     null: false
    t.decimal  "price",                      precision: 10, scale: 2,                 null: false
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.string   "product_cover_file_name"
    t.string   "product_cover_content_type"
    t.integer  "product_cover_file_size"
    t.datetime "product_cover_updated_at"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shopping_carts_on_product_id"
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.boolean  "is_admin",         default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
