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

ActiveRecord::Schema.define(:version => 20140120181215) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_alias"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["email_alias"], :name => "index_admins_on_email_alias"
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "api_keys", :force => true do |t|
    t.string   "access_token"
    t.string   "aasm_state"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "aasm_state"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "releases_count"
    t.string   "slug"
  end

  add_index "projects", ["releases_count"], :name => "index_projects_on_releases_count"
  add_index "projects", ["slug"], :name => "index_projects_on_slug"

  create_table "releases", :force => true do |t|
    t.integer  "project_id"
    t.integer  "admin_id"
    t.string   "branch"
    t.string   "environment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "created_by"
    t.datetime "deployed_at"
  end

  add_index "releases", ["admin_id"], :name => "index_releases_on_admin_id"
  add_index "releases", ["deployed_at"], :name => "index_releases_on_deployed_at"
  add_index "releases", ["project_id"], :name => "index_releases_on_project_id"

end
