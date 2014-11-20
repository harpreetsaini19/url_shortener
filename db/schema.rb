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

ActiveRecord::Schema.define(version: 20141120115930) do

  create_table "shorties", force: true do |t|
    t.string   "shortened_url"
    t.text     "actual_url"
    t.integer  "http_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alias"
    t.integer  "hits",          default: 0
  end

  add_index "shorties", ["shortened_url"], name: "index_shorties_on_shortened_url"

end
