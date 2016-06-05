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

ActiveRecord::Schema.define(version: 20160604232806) do

  create_table "languages", force: :cascade do |t|
    t.string   "langname",   limit: 50, null: false
    t.string   "langcode",   limit: 10, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "root_strings", force: :cascade do |t|
    t.text     "string",     limit: 65535, null: false
    t.string   "comment",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "translated_strings", force: :cascade do |t|
    t.text     "translation",    limit: 65535, null: false
    t.string   "comment",        limit: 255
    t.integer  "root_string_id", limit: 4
    t.integer  "language_id",    limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "translated_strings", ["language_id"], name: "index_translated_strings_on_language_id", using: :btree
  add_index "translated_strings", ["root_string_id"], name: "index_translated_strings_on_root_string_id", using: :btree

  add_foreign_key "translated_strings", "languages"
  add_foreign_key "translated_strings", "root_strings"
end
