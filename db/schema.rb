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

ActiveRecord::Schema.define(version: 20170312115750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "label_is"
    t.string   "label_en"
    t.text     "body_is"
    t.text     "body_en"
    t.string   "image"
    t.string   "youtube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitors", force: :cascade do |t|
    t.integer "group_id"
    t.string  "name"
    t.integer "laps"
    t.time    "total_time"
    t.time    "finish_time"
    t.integer "place_in_group"
    t.integer "year"
    t.index ["group_id"], name: "index_competitors_on_group_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string  "name"
    t.string  "name_en"
    t.string  "info_is"
    t.string  "info_en"
    t.string  "participants"
    t.string  "bikes"
    t.string  "prices"
    t.boolean "hide"
    t.integer "priority"
  end

  create_table "index_videos", force: :cascade do |t|
    t.string   "youtube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.text     "info_is"
    t.text     "info_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kids", force: :cascade do |t|
    t.text     "info_is"
    t.text     "info_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laptimes", force: :cascade do |t|
    t.integer "competitor_id"
    t.integer "lap_number"
    t.text    "laptime"
    t.index ["competitor_id"], name: "index_laptimes_on_competitor_id", using: :btree
  end

  create_table "rules", force: :cascade do |t|
    t.string   "rule_is"
    t.string   "rule_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "competitors", "groups"
  add_foreign_key "laptimes", "competitors"
end
