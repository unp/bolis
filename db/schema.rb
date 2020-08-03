# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_03_204707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donations", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.bigint "event_slot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "amount", precision: 8, scale: 2
    t.index ["event_slot_id"], name: "index_donations_on_event_slot_id"
  end

  create_table "event_slots", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "slot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_slots_on_event_id"
    t.index ["slot_id"], name: "index_event_slots_on_slot_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "donation_type"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "min_donation_amount", precision: 8, scale: 2
  end

  create_table "slots", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "donations", "event_slots"
  add_foreign_key "event_slots", "events"
  add_foreign_key "event_slots", "slots"
end
