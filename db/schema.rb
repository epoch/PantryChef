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

ActiveRecord::Schema.define(version: 20141029225601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: true do |t|
    t.string   "allergy_name"
    t.string   "api_request"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.text     "search_ingredients"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_boxes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "recipe_boxes_recipes", id: false, force: true do |t|
    t.integer "recipe_box_id", null: false
    t.integer "recipe_id",     null: false
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.string   "course"
    t.integer  "cooktime"
    t.integer  "rating"
    t.text     "ingredients"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "image_url"
    t.text     "yummly_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
