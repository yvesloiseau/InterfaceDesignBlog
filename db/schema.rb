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

ActiveRecord::Schema.define(version: 20170315161844) do

  create_table "articlecomments", force: :cascade do |t|
    t.integer "article_id"
    t.text    "comment"
    t.string  "posted_by"
    t.string  "email_address"
    t.date    "posted_date"
    t.string  "image_urlorvideo"
    t.index ["article_id"], name: "index_articlecomments_on_article_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "article_title"
    t.text     "article_text"
    t.string   "posted_by"
    t.date     "posted_date"
    t.string   "article_image"
    t.string   "article_video"
    t.string   "article_details"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "posted_by"
    t.string   "article_comment"
    t.string   "user_email"
    t.string   "user_imageorvideo"
    t.integer  "article_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

end
