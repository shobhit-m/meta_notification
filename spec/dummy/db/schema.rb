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

ActiveRecord::Schema.define(version: 20160620052742) do

  create_table "mn_notification_settings", force: :cascade do |t|
    t.integer  "notification_type_id", limit: 4,                 null: false
    t.boolean  "is_mute",                        default: false, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "mn_notification_templates", force: :cascade do |t|
    t.integer  "notification_type_id", limit: 4,     null: false
    t.string   "in_app",               limit: 255
    t.string   "mobile",               limit: 255
    t.string   "push",                 limit: 255
    t.text     "email",                limit: 65535
    t.string   "sms",                  limit: 255
    t.string   "email_subject",        limit: 255
    t.integer  "resource_id",          limit: 4
    t.string   "resource_type",        limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "mn_notification_templates", ["notification_type_id", "resource_type", "resource_id"], name: "unique_type_resource_index", unique: true, using: :btree
  add_index "mn_notification_templates", ["resource_type", "resource_id"], name: "resource_index", using: :btree

  create_table "mn_notification_types", force: :cascade do |t|
    t.string   "name",          limit: 255, null: false
    t.string   "display_name",  limit: 255
    t.integer  "created_by_id", limit: 4,   null: false
    t.integer  "updated_by_id", limit: 4,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "mn_notifications", force: :cascade do |t|
    t.integer  "notification_template_id", limit: 4,     null: false
    t.text     "in_app",                   limit: 65535, null: false
    t.text     "mobile",                   limit: 65535, null: false
    t.string   "resource_type",            limit: 255
    t.integer  "resource_id",              limit: 4
    t.integer  "created_by_id",            limit: 4,     null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "mn_notifications", ["created_by_id"], name: "index_mn_notifications_on_created_by_id", using: :btree
  add_index "mn_notifications", ["notification_template_id"], name: "index_mn_notifications_on_notification_template_id", using: :btree

  create_table "mn_user_notification_settings", force: :cascade do |t|
    t.integer  "user_id",              limit: 4,                 null: false
    t.integer  "notification_type_id", limit: 4,                 null: false
    t.boolean  "is_mute",                        default: false, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "mn_user_notification_settings", ["notification_type_id"], name: "index_mn_user_notification_settings_on_notification_type_id", using: :btree
  add_index "mn_user_notification_settings", ["user_id", "notification_type_id"], name: "unique_user_notification_type_index", unique: true, using: :btree

  create_table "mn_user_notifications", force: :cascade do |t|
    t.integer  "user_id",         limit: 4, null: false
    t.integer  "notification_id", limit: 4, null: false
    t.boolean  "is_read",                   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "mn_user_notifications", ["notification_id"], name: "index_mn_user_notifications_on_notification_id", using: :btree
  add_index "mn_user_notifications", ["user_id"], name: "index_mn_user_notifications_on_user_id", using: :btree

end
