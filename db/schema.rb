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

ActiveRecord::Schema.define(version: 2020_10_12_044921) do

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.integer "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_countries_on_region_id"
  end

  create_table "primary_metrics", force: :cascade do |t|
    t.integer "confirmed"
    t.integer "deaths"
    t.integer "recovered"
    t.integer "active"
    t.integer "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_primary_metrics_on_country_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "secondary_metrics", force: :cascade do |t|
    t.integer "deathPerHundred"
    t.integer "recoveredPerHundred"
    t.integer "deathPerHundredRecovered"
    t.integer "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_secondary_metrics_on_country_id"
  end

  add_foreign_key "countries", "regions"
  add_foreign_key "primary_metrics", "countries"
  add_foreign_key "secondary_metrics", "countries"
end
