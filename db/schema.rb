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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130401154941) do

  create_table "people", :force => true do |t|
    t.integer "vendor_id",             :precision => 38, :scale => 0
    t.integer "fmno",                  :precision => 38, :scale => 0
    t.string  "first_name"
    t.string  "preferred_name"
    t.string  "last_name"
    t.string  "full_name"
    t.string  "ads_login_name"
    t.string  "person_status"
    t.string  "email"
    t.string  "location_code"
    t.string  "location_office"
    t.string  "position_code"
    t.string  "mckinsey_career_title"
  end

end
