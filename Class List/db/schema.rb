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

ActiveRecord::Schema.define(version: 2020_10_16_012631) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.integer "teacher_id"
    t.integer "student_id"
    t.integer "user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "parent"
    t.integer "grade"
    t.integer "user_id"
    t.integer "teacher_id"
    t.string "email"
    t.integer "phone_number"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.integer "grade"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "student"
    t.string "password_digest"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "name"
    t.text "image"
  end

end
