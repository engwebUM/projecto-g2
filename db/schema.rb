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

ActiveRecord::Schema.define(version: 20150624153141) do

  create_table "badges", force: :cascade do |t|
    t.integer  "participant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "badges", ["participant_id"], name: "index_badges_on_participant_id"

  create_table "extras", force: :cascade do |t|
    t.string   "kind"
    t.integer  "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partextras", force: :cascade do |t|
    t.integer  "extra_id"
    t.integer  "participant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "kind"
  end

  add_index "partextras", ["extra_id"], name: "index_partextras_on_extra_id"
  add_index "partextras", ["participant_id"], name: "index_partextras_on_participant_id"

  create_table "participants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "ticket_id"
    t.boolean  "appeared"
    t.integer  "extra_id"
  end

  add_index "participants", ["extra_id"], name: "index_participants_on_extra_id"
  add_index "participants", ["ticket_id"], name: "index_participants_on_ticket_id"

  create_table "tickets", force: :cascade do |t|
    t.string   "kind"
    t.integer  "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
