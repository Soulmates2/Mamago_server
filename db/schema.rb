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

ActiveRecord::Schema.define(version: 2020_02_11_173642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "dialogs", force: :cascade do |t|
    t.integer "source", default: 0, null: false
    t.integer "target", default: 1, null: false
    t.bigint "user_id"
    t.boolean "complete", default: false, null: false
    t.boolean "feedback", default: true, null: false
    t.bigint "question_id", comment: "대화를 시작하는 질문"
    t.text "original", comment: "원본 문장"
    t.text "translated", comment: "번역 문장"
    t.text "comprehanded", comment: "예상한 의도"
    t.text "user_intention", comment: "실제 의도"
    t.text "user_intention_translated", comment: "의도한 문장"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_dialogs_on_question_id"
    t.index ["user_id"], name: "index_dialogs_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "source", default: 0, null: false
    t.integer "target"
    t.text "content", default: "", null: false, comment: "질문의 내용"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
