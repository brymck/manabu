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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110806011450) do

  create_table "answers", :force => true do |t|
    t.text    "content"
    t.boolean "correct"
    t.integer "question_id"
  end

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], :name => "index_authentications_on_provider_and_uid", :unique => true

  create_table "exam_translations", :force => true do |t|
    t.integer  "exam_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_translations", ["exam_id"], :name => "index_exam_translations_on_exam_id"

  create_table "exams", :force => true do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "cached_slug"
  end

  add_index "exams", ["cached_slug"], :name => "index_exams_on_cached_slug", :unique => true

  create_table "exams_locations", :id => false, :force => true do |t|
    t.integer "exam_id",     :null => false
    t.integer "location_id", :null => false
  end

  add_index "exams_locations", ["exam_id", "location_id"], :name => "index_exams_locations_on_exam_id_and_location_id", :unique => true

  create_table "exams_users", :id => false, :force => true do |t|
    t.integer "exam_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "exams_users", ["exam_id", "user_id"], :name => "index_exams_users_on_exam_id_and_user_id", :unique => true

  create_table "levels", :force => true do |t|
    t.string  "name"
    t.integer "exam_id"
    t.string  "abbreviation"
    t.string  "cached_slug"
  end

  add_index "levels", ["cached_slug"], :name => "index_levels_on_cached_slug", :unique => true

  create_table "levels_questions", :id => false, :force => true do |t|
    t.integer "level_id",    :null => false
    t.integer "question_id", :null => false
  end

  add_index "levels_questions", ["level_id", "question_id"], :name => "index_levels_questions_on_level_id_and_question_id", :unique => true

  create_table "levels_sections", :id => false, :force => true do |t|
    t.integer "level_id",   :null => false
    t.integer "section_id", :null => false
  end

  add_index "levels_sections", ["level_id", "section_id"], :name => "index_levels_sections_on_level_id_and_section_id", :unique => true

  create_table "levels_sites", :id => false, :force => true do |t|
    t.integer "level_id", :null => false
    t.integer "site_id",  :null => false
  end

  add_index "levels_sites", ["level_id", "site_id"], :name => "index_levels_sites_on_level_id_and_site_id", :unique => true

  create_table "location_translations", :force => true do |t|
    t.integer  "location_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "location_translations", ["location_id"], :name => "index_location_translations_on_location_id"

  create_table "locations", :force => true do |t|
    t.string "name"
  end

  add_index "locations", ["name"], :name => "index_locations_on_name", :unique => true

  create_table "locations_users", :id => false, :force => true do |t|
    t.integer "location_id", :null => false
    t.integer "user_id",     :null => false
  end

  add_index "locations_users", ["location_id", "user_id"], :name => "index_locations_users_on_location_id_and_user_id", :unique => true

  create_table "questions", :force => true do |t|
    t.text     "content"
    t.integer  "section_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_translations", :force => true do |t|
    t.integer  "section_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "section_translations", ["section_id"], :name => "index_section_translations_on_section_id"

  create_table "sections", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "site_translations", :force => true do |t|
    t.integer  "site_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_translations", ["site_id"], :name => "index_site_translations_on_site_id"

  create_table "sites", :force => true do |t|
    t.string  "name"
    t.string  "address"
    t.float   "lat"
    t.float   "lng"
    t.integer "location_id"
  end

  add_index "sites", ["name"], :name => "index_sites_on_name", :unique => true

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "name",                           :null => false
    t.string   "email",                          :null => false
    t.string   "cached_slug"
    t.boolean  "admin",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["cached_slug"], :name => "index_users_on_cached_slug", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
