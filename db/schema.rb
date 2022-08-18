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

ActiveRecord::Schema.define(version: 2022_08_17_025507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credits", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.integer "balance"
    t.bigint "voucher_id"
    t.bigint "brand_id"
    t.bigint "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_credits_on_brand_id"
    t.index ["institution_id"], name: "index_credits_on_institution_id"
    t.index ["user_id"], name: "index_credits_on_user_id"
    t.index ["voucher_id"], name: "index_credits_on_voucher_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "phone_no"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "phone_no"
    t.string "reg_no"
    t.string "email"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_merchants_on_brand_id"
  end

  create_table "merchants_users", force: :cascade do |t|
    t.bigint "merchant_id"
    t.bigint "user_id"
    t.string "status"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_merchants_users_on_merchant_id"
    t.index ["user_id"], name: "index_merchants_users_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "merchant_id"
    t.bigint "brand_id"
    t.string "name"
    t.string "description"
    t.string "image"
    t.integer "price"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["merchant_id"], name: "index_products_on_merchant_id"
  end

  create_table "settlements", force: :cascade do |t|
    t.integer "amount"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_settlements_on_merchant_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "voucher_id"
    t.integer "amount"
    t.bigint "merchant_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_transactions_on_merchant_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
    t.index ["voucher_id"], name: "index_transactions_on_voucher_id"
  end

  create_table "user_vouchers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "voucher_id"
    t.boolean "redeemed"
    t.datetime "redeem_at"
    t.integer "amount"
    t.integer "amount_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_vouchers_on_user_id"
    t.index ["voucher_id"], name: "index_user_vouchers_on_voucher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "ic_no"
    t.string "email"
    t.string "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vouchers", force: :cascade do |t|
    t.bigint "merchant_id"
    t.bigint "brand_id"
    t.string "name"
    t.string "description"
    t.string "image"
    t.datetime "start_date"
    t.datetime "expiry_date"
    t.integer "capped_amount"
    t.integer "min_purchase"
    t.bigint "credit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_vouchers_on_brand_id"
    t.index ["credit_id"], name: "index_vouchers_on_credit_id"
    t.index ["merchant_id"], name: "index_vouchers_on_merchant_id"
  end

end
