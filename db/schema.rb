# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_04_071234) do
  create_table "users", force: :cascade do |t|
    t.integer "visa_form_id"
    t.string "family_name"
    t.text "given_names"
    t.boolean "gender"
    t.date "date_of_birth"
    t.string "passport_number"
    t.string "country_of_passport"
    t.string "passport_nationality"
    t.date "date_of_issue"
    t.date "date_of_expired"
    t.text "issueing_authority"
    t.string "birth_city"
    t.string "birth_state"
    t.string "birth_country"
    t.integer "relation_ship_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visa_form_id"], name: "index_users_on_visa_form_id"
  end

  create_table "visa_forms", force: :cascade do |t|
    t.integer "applying_from"
    t.date "visit_start_date"
    t.date "visit_end_date"
    t.integer "stay_period"
    t.boolean "is_more_than_one_occasion"
    t.text "types_of_occasion"
    t.date "extend_date"
    t.text "extend_date_description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
