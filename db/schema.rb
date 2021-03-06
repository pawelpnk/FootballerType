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

ActiveRecord::Schema.define(version: 2022_05_09_205221) do

  create_table "matches", force: :cascade do |t|
    t.string "first_team_name"
    t.string "second_team_name"
    t.decimal "first_team_result"
    t.decimal "second_team_result"
    t.decimal "minutes"
    t.string "player"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.boolean "isActive", default: true
    t.string "best_typer"
    t.decimal "all_points", default: "0.0"
    t.string "highest_result"
    t.boolean "show_result", default: false
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.decimal "first_team"
    t.decimal "second_team"
    t.decimal "minutes"
    t.string "player"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "match_id"
    t.integer "user_id"
    t.decimal "points", default: "0.0"
    t.index ["match_id"], name: "index_pages_on_match_id"
    t.index ["user_id"], name: "index_pages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "string"
    t.integer "role"
    t.integer "rate"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "matches", "users"
  add_foreign_key "pages", "matches"
  add_foreign_key "pages", "users"
end
