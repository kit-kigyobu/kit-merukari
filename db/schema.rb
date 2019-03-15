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

ActiveRecord::Schema.define(version: 2019_03_11_191246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "transaction_id", null: false
    t.integer "message_type", default: 0, null: false
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "book_name"
    t.text "content"
    t.integer "user_id"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_name1"
    t.string "image_name2"
    t.string "image_name3"
    t.integer "category"
    t.integer "price"
  end

  create_table "test_kesites", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "parchase_user_id", null: false
    t.integer "exhibit_user_id", null: false
    t.integer "parchase_status", default: 0, null: false
    t.integer "exhibit_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "content"
    t.string "image_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "club"
    t.integer "entry_year"
    t.integer "course_id"
    t.integer "exhibition_num"
    t.integer "purchase_num"
    t.integer "love_num"
    t.boolean "is_ban", default: false, null: false
    t.boolean "is_suspend", default: false, null: false
    t.integer "gender"
  end

end
