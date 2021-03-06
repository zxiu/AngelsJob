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

ActiveRecord::Schema.define(version: 20160608085720) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street",         limit: 255
    t.string   "house_no",       limit: 255
    t.string   "postal_code",    limit: 255
    t.string   "city",           limit: 255
    t.integer  "country",        limit: 4
    t.integer  "locatable_id",   limit: 4
    t.string   "locatable_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "homepage",   limit: 255
    t.string   "logo",       limit: 255
    t.integer  "country",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "agents_users", id: false, force: :cascade do |t|
    t.integer "agent_id", limit: 4
    t.integer "user_id",  limit: 4
  end

  add_index "agents_users", ["agent_id"], name: "index_agents_users_on_agent_id", using: :btree
  add_index "agents_users", ["user_id"], name: "index_agents_users_on_user_id", using: :btree

  create_table "applications", force: :cascade do |t|
    t.integer  "offer_id",     limit: 4
    t.text     "cover_letter", limit: 65535
    t.datetime "applied_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "career_infos", force: :cascade do |t|
    t.string   "employer",   limit: 255,   null: false
    t.string   "position",   limit: 255
    t.text     "activity",   limit: 65535
    t.date     "begin"
    t.date     "end"
    t.text     "extra",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
    t.text     "assets",     limit: 65535
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "homepage",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name",       limit: 255
    t.string   "last_name",        limit: 255
    t.string   "email",            limit: 255
    t.integer  "title",            limit: 4
    t.integer  "gender",           limit: 4
    t.string   "tel",              limit: 255
    t.string   "mobile",           limit: 255
    t.integer  "contactable_id",   limit: 4
    t.string   "contactable_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "cv_templates", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "role",       limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "education_infos", force: :cascade do |t|
    t.string   "insititude", limit: 255,   null: false
    t.string   "subject",    limit: 255
    t.date     "begin"
    t.date     "end"
    t.string   "graduation", limit: 255
    t.string   "score",      limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "assets",     limit: 65535
  end

  add_index "education_infos", ["user_id"], name: "index_education_infos_on_user_id", using: :btree

  create_table "intents", force: :cascade do |t|
    t.string   "keywords",    limit: 255
    t.integer  "branch",      limit: 4
    t.integer  "job_type",    limit: 4
    t.integer  "user_id",     limit: 4
    t.string   "postal_code", limit: 255
    t.integer  "distance",    limit: 4
    t.boolean  "suspend",                 default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "link",       limit: 255
    t.string   "position",   limit: 255
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "company_id", limit: 4
    t.integer  "agent_id",   limit: 4
    t.date     "online_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "personal_infos", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "tel",        limit: 255
    t.string   "mobile",     limit: 255
    t.string   "email",      limit: 255
    t.date     "birthday"
    t.integer  "gender",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
    t.text     "avatar",     limit: 65535
  end

  create_table "show_cvs", force: :cascade do |t|
    t.string   "hash",           limit: 255
    t.integer  "application_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",       limit: 255,   null: false
    t.integer  "level",      limit: 4
    t.integer  "catalog",    limit: 4
    t.string   "extra",      limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "assets",     limit: 65535
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.integer  "role",                   limit: 4,   default: 0,  null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "education_infos", "users"
end
