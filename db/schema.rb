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

ActiveRecord::Schema.define(version: 2020_05_11_114711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "nombre_categoria"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
  end

  create_table "has_categories", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_has_categories_on_category_id"
    t.index ["service_id"], name: "index_has_categories_on_service_id"
  end

  create_table "has_skills", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_has_skills_on_service_id"
    t.index ["skill_id"], name: "index_has_skills_on_skill_id"
  end

  create_table "requests", force: :cascade do |t|
    t.text "mensaje"
    t.string "contacto_mail"
    t.bigint "user_id"
    t.bigint "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_requests_on_service_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "information"
    t.text "skills"
    t.integer "precio"
    t.date "valid_until"
    t.text "aditional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "lenguaje"
    t.integer "exos_amount"
    t.string "mail_servicio"
    t.integer "horas"
    t.string "wpp"
    t.text "web"
    t.string "currency_sugest"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color_tag"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "last_name"
    t.string "mail"
    t.string "company"
    t.string "web_site"
    t.string "skill"
    t.string "lenguage"
    t.string "discord_user"
    t.string "wpp"
    t.string "udi"
    t.string "provider"
    t.integer "permission_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "has_categories", "categories"
  add_foreign_key "has_categories", "services"
  add_foreign_key "has_skills", "services"
  add_foreign_key "has_skills", "skills"
  add_foreign_key "requests", "services"
  add_foreign_key "requests", "users"
  add_foreign_key "services", "users"
end
