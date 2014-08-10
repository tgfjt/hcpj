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

ActiveRecord::Schema.define(version: 20140810035229) do

  create_table "admin_users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "role"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "project_id"
    t.integer  "talent_id"
    t.integer  "user_id"
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "project_name"
  end

  add_index "favorites", ["project_id"], name: "index_favorites_on_project_id", using: :btree
  add_index "favorites", ["talent_id"], name: "index_favorites_on_talent_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "offers", force: true do |t|
    t.integer  "user_id"
    t.integer  "talent_id"
    t.integer  "project_id"
    t.string   "project_name"
    t.integer  "request"
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["project_id"], name: "index_offers_on_project_id", using: :btree
  add_index "offers", ["talent_id"], name: "index_offers_on_talent_id", using: :btree
  add_index "offers", ["user_id"], name: "index_offers_on_user_id", using: :btree

  create_table "photos", force: true do |t|
    t.integer  "photable_id"
    t.string   "photable_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name",        null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "description"
    t.string   "other"
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talents", force: true do |t|
    t.string   "company_name"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "area"
    t.string   "country"
    t.integer  "sex"
    t.integer  "age"
    t.integer  "height_feet"
    t.integer  "height_inch"
    t.string   "nationality"
    t.string   "mainimage_file_name"
    t.string   "mainimage_content_type"
    t.integer  "mainimage_file_size"
    t.datetime "mainimage_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "height_cm",              precision: 10, scale: 0
  end

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
    t.string   "name"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
