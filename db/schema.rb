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

ActiveRecord::Schema[7.1].define(version: 2026_08_24_070756) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "annual_subscriptions", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.integer "year", null: false
    t.integer "amount", default: 50000, null: false
    t.datetime "paid_at", null: false
    t.string "status", default: "approved", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id", "year"], name: "index_annual_subscriptions_on_member_id_and_year", unique: true
    t.index ["member_id"], name: "index_annual_subscriptions_on_member_id"
  end

  create_table "contributions", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "month", null: false
    t.integer "amount", null: false
    t.datetime "paid_at", null: false
    t.boolean "has_fine", default: false, null: false
    t.integer "fine_amount", default: 0, null: false
    t.boolean "fine_paid", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "approved", null: false
    t.index ["member_id", "month"], name: "index_contributions_on_member_id_and_month", unique: true
    t.index ["member_id"], name: "index_contributions_on_member_id"
    t.index ["status"], name: "index_contributions_on_status"
  end

  create_table "login_otps", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "code_digest"
    t.datetime "expires_at"
    t.datetime "consumed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_login_otps_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "occupation", null: false
    t.date "date_of_birth", null: false
    t.string "tel", null: false
    t.text "address", null: false
    t.string "gender", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.boolean "approved", default: false, null: false
    t.string "api_token"
    t.datetime "joined_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["api_token"], name: "index_members_on_api_token", unique: true
    t.index ["email"], name: "index_members_on_email", unique: true
  end

  create_table "next_of_kins", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "name"
    t.string "telephone"
    t.string "email"
    t.string "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_next_of_kins_on_member_id"
  end

  create_table "role_histories", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "role", null: false
    t.datetime "started_at", null: false
    t.datetime "ended_at"
    t.bigint "appointed_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointed_by_id"], name: "index_role_histories_on_appointed_by_id"
    t.index ["member_id"], name: "index_role_histories_on_member_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "annual_subscriptions", "members"
  add_foreign_key "contributions", "members"
  add_foreign_key "login_otps", "members"
  add_foreign_key "next_of_kins", "members"
  add_foreign_key "role_histories", "members"
  add_foreign_key "role_histories", "members", column: "appointed_by_id"
end
