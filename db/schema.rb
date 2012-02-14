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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120214094035) do

  create_table "accounts", :force => true do |t|
    t.string   "desc"
    t.string   "account"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], :name => "index_accounts_on_user_id"

  create_table "buildings", :force => true do |t|
    t.string   "city"
    t.string   "street"
    t.string   "number"
    t.string   "nation"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "desc"
    t.float    "unit_price"
    t.string   "sn"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.float    "number"
    t.integer  "payment_id"
    t.integer  "category_id"
    t.integer  "provider_id"
    t.integer  "office_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["category_id"], :name => "index_items_on_category_id"
  add_index "items", ["office_id"], :name => "index_items_on_office_id"
  add_index "items", ["payment_id"], :name => "index_items_on_payment_id"
  add_index "items", ["provider_id"], :name => "index_items_on_provider_id"

  create_table "items_assignement", :id => false, :force => true do |t|
    t.integer "item_id",   :null => false
    t.integer "office_id", :null => false
    t.float   "number"
  end

  create_table "offices", :force => true do |t|
    t.string   "desc"
    t.string   "number"
    t.integer  "building_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offices", ["building_id"], :name => "index_offices_on_building_id"

  create_table "payments", :force => true do |t|
    t.float    "amount"
    t.string   "desc"
    t.string   "status"
    t.string   "document"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["account_id"], :name => "index_payments_on_account_id"

  create_table "providers", :force => true do |t|
    t.string   "city"
    t.string   "street"
    t.string   "number"
    t.string   "nation"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tests", :force => true do |t|
    t.string   "test"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "name"
    t.string   "family_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_accounts", :id => false, :force => true do |t|
    t.integer "user_id",    :null => false
    t.integer "account_id", :null => false
  end

  add_index "users_accounts", ["user_id", "account_id"], :name => "index_users_accounts_on_user_id_and_account_id", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
