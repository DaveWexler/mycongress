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

ActiveRecord::Schema.define(version: 20160718191513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string   "title"
    t.integer  "bill_id"
    t.string   "chamber"
    t.string   "committee_ids"
    t.boolean  "active"
    t.boolean  "awaiting_signature"
    t.boolean  "enacted"
    t.boolean  "vetoed"
    t.string   "introduced_on"
    t.string   "pdf"
    t.integer  "politician_id"
    t.integer  "cosponsor_count"
    t.string   "url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "politician_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "politicians", force: :cascade do |t|
    t.string   "chamber"
    t.string   "bioguide_id"
    t.string   "birthday"
    t.string   "crp_id"
    t.string   "fax"
    t.string   "fec_ids"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "gender"
    t.string   "govtrack_id"
    t.boolean  "in_office"
    t.string   "leadership_role"
    t.string   "name_suffix"
    t.string   "nickname"
    t.string   "oc_email"
    t.string   "ocd_id"
    t.string   "office"
    t.string   "party"
    t.string   "phone"
    t.string   "term_end"
    t.string   "term_start"
    t.string   "thomas_id"
    t.string   "title"
    t.integer  "votesmart_id"
    t.string   "website"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "youtube"
    t.string   "state_rank"
    t.integer  "senate_class"
    t.string   "lis_id"
    t.integer  "state_id"
    t.integer  "district_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "abv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_bills", force: :cascade do |t|
    t.string   "title"
    t.integer  "bill_id"
    t.string   "chamber"
    t.string   "committee_ids"
    t.boolean  "active"
    t.boolean  "awaiting_signature"
    t.boolean  "enacted"
    t.boolean  "vetoed"
    t.string   "introduced_on"
    t.string   "pdf"
    t.integer  "politician_id"
    t.integer  "cosponsor_count"
    t.string   "url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "district_id"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
