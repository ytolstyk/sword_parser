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

ActiveRecord::Schema.define(version: 20150330002739) do

  create_table "swords", force: true do |t|
    t.string   "name"
    t.integer  "total_length", limit: 255
    t.integer  "hilt_length",  limit: 255
    t.integer  "blade_length", limit: 255
    t.float    "price"
    t.string   "edge"
    t.float    "weight"
    t.string   "pob"
    t.string   "thickiness"
    t.string   "in_stock"
    t.string   "width"
    t.string   "img_url"
    t.string   "manufacturer"
    t.string   "type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item"
    t.string   "page_url"
  end

  add_index "swords", ["blade_length"], name: "index_swords_on_blade_length"
  add_index "swords", ["edge"], name: "index_swords_on_edge"
  add_index "swords", ["in_stock"], name: "index_swords_on_in_stock"
  add_index "swords", ["price"], name: "index_swords_on_price"
  add_index "swords", ["total_length"], name: "index_swords_on_total_length"
  add_index "swords", ["weight"], name: "index_swords_on_weight"

end
