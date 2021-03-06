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

ActiveRecord::Schema.define(version: 20150121082438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "a_type"
    t.string   "photo"
    t.integer  "user_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "zip"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "lotteries", force: :cascade do |t|
    t.datetime "open_date"
    t.string   "special"
    t.string   "first"
    t.integer  "district_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "eighth",      default: [],              array: true
    t.string   "second",      default: [],              array: true
    t.string   "third",       default: [],              array: true
    t.string   "fourth",      default: [],              array: true
    t.string   "fifth",       default: [],              array: true
    t.string   "sixth",       default: [],              array: true
    t.string   "seventh",     default: [],              array: true
    t.integer  "region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.integer  "portal_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "code"
  end

  create_table "users", force: :cascade do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "full_name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.boolean  "admin"
    t.string   "password_digest"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "avatar"
  end

end
