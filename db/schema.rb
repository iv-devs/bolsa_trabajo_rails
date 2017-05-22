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

ActiveRecord::Schema.define(version: 20170520050819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.datetime "locked_at"
    t.string   "name",                                null: false
    t.string   "logo"
    t.string   "website"
    t.text     "descripction"
    t.string   "country"
    t.string   "tw"
    t.string   "github"
    t.string   "fanpage"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "slug"
    t.string   "linkedin"
    t.string   "city"
    t.index ["email"], name: "index_companies_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_companies_on_slug", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.integer  "job_type"
    t.integer  "salary"
    t.integer  "salary_type"
    t.text     "description"
    t.integer  "company_id"
    t.boolean  "publish_job"
    t.boolean  "find_worker"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "location_job"
    t.integer  "category_job"
    t.string   "slug"
    t.boolean  "salary_negotiable"
    t.index ["company_id"], name: "index_jobs_on_company_id", using: :btree
    t.index ["slug"], name: "index_jobs_on_slug", unique: true, using: :btree
  end

  create_table "jobs_tags", id: false, force: :cascade do |t|
    t.integer "job_id"
    t.integer "tag_id"
    t.index ["job_id"], name: "index_jobs_tags_on_job_id", using: :btree
    t.index ["tag_id"], name: "index_jobs_tags_on_tag_id", using: :btree
  end

  create_table "postulations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.text     "professional_profile"
    t.text     "academic_profile"
    t.text     "interest"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["job_id"], name: "index_postulations_on_job_id", using: :btree
    t.index ["user_id"], name: "index_postulations_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username",                            null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "avatar"
    t.integer  "role",                   default: 0,  null: false
    t.text     "description",                         null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "slug"
    t.string   "fb"
    t.string   "linkedin"
    t.string   "github"
    t.string   "web"
    t.string   "tw"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  add_foreign_key "jobs", "companies"
  add_foreign_key "postulations", "jobs"
  add_foreign_key "postulations", "users"
end
