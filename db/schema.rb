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

ActiveRecord::Schema.define(version: 2018_11_15_211031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "residence_id"
    t.integer "maxbid"
    t.date "dateStart"
    t.date "dateEnd"
    t.index ["residence_id"], name: "index_auctions_on_residence_id"
  end

  create_table "auctions_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_auctions_users_on_auction_id"
    t.index ["user_id"], name: "index_auctions_users_on_user_id"
  end

  create_table "residences", force: :cascade do |t|
    t.string "name"
    t.string "dir"
    t.text "desc"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password"
    t.integer "credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isAdmin"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "userName"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "auctions", "residences"
  add_foreign_key "auctions_users", "auctions"
  add_foreign_key "auctions_users", "users"
end
