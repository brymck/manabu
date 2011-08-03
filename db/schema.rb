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

ActiveRecord::Schema.define(:version => 20110803221255) do

  create_table "answers", :force => true do |t|
    t.text    "content"
    t.boolean "correct"
    t.integer "question_id"
  end

  create_table "levels", :force => true do |t|
  end

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

  create_table "questions", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section_id", :null => false
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

end
