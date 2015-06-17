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

ActiveRecord::Schema.define(version: 20150617023935) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "question_number", limit: 4
    t.integer  "duration",        limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string   "result",      limit: 255
    t.boolean  "checked",     limit: 1
    t.integer  "test_time",   limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "exams", ["category_id"], name: "index_exams_on_category_id", using: :btree
  add_index "exams", ["user_id"], name: "index_exams_on_user_id", using: :btree

  create_table "exams_questions", force: :cascade do |t|
    t.integer  "exam_id",     limit: 4
    t.integer  "question_id", limit: 4
    t.integer  "option_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "exams_questions", ["exam_id"], name: "index_exams_questions_on_exam_id", using: :btree
  add_index "exams_questions", ["option_id"], name: "index_exams_questions_on_option_id", using: :btree
  add_index "exams_questions", ["question_id"], name: "index_exams_questions_on_question_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "option",         limit: 255
    t.boolean  "correct_option", limit: 1
    t.integer  "question_id",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question",    limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",            limit: 255, default: "",    null: false
    t.boolean  "admin",               limit: 1,   default: false, null: false
    t.string   "email",               limit: 255, default: "",    null: false
    t.string   "encrypted_password",  limit: 255, default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "exams", "categories"
  add_foreign_key "exams", "users"
  add_foreign_key "exams_questions", "exams"
  add_foreign_key "exams_questions", "options"
  add_foreign_key "exams_questions", "questions"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "categories"
end
