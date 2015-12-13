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

ActiveRecord::Schema.define(version: 20151213070020) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,                         null: false
    t.string   "type",       limit: 255, default: "checkings", null: false
    t.integer  "balance",    limit: 4,                         null: false
    t.string   "currency",   limit: 255, default: "USD",       null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "accounts", ["user_id", "type"], name: "index_accounts_on_user_id_and_type", unique: true, using: :btree

  create_table "payees", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "user_id",    limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,                   null: false
    t.integer  "account_id", limit: 4,                   null: false
    t.integer  "amount",     limit: 4,                   null: false
    t.integer  "payee_id",   limit: 4
    t.string   "memo",       limit: 255
    t.boolean  "cleared",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255, null: false
    t.string   "name",            limit: 255, null: false
    t.string   "password_digest", limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
