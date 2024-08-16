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

ActiveRecord::Schema[7.0].define(version: 2024_08_14_180312) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "block_channels", force: :cascade do |t|
    t.string "slack_channel_id"
    t.string "slack_team_id"
    t.bigint "user_id", null: false
    t.text "message_text"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_block_channels_on_user_id"
  end

  create_table "block_events", force: :cascade do |t|
    t.string "slack_id"
    t.string "event_type"
    t.bigint "user_id", null: false
    t.string "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_block_events_on_user_id"
  end

  create_table "block_users", force: :cascade do |t|
    t.string "slack_user_id"
    t.string "slack_team_id"
    t.bigint "user_id", null: false
    t.text "message_text"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_block_users_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "section_id", null: false
    t.integer "slack_message_id"
    t.string "title"
    t.text "content"
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_notifications_on_section_id"
  end

  create_table "section_storages", force: :cascade do |t|
    t.bigint "section_id", null: false
    t.string "title"
    t.string "description"
    t.string "image"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_section_storages_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.bigint "workspace_id", null: false
    t.string "name"
    t.string "slack_channel"
    t.integer "is_private"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workspace_id"], name: "index_sections_on_workspace_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "workspace_id", null: false
    t.integer "assigner_id"
    t.integer "user_id"
    t.string "multipriority"
    t.string "title"
    t.string "description"
    t.string "multitag"
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workspace_id"], name: "index_tasks_on_workspace_id"
  end

  create_table "user_assigns", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.string "slack_id"
    t.string "slack_user_id"
    t.integer "assigner_id"
    t.datetime "deadline_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_user_assigns_on_task_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "number", limit: 25
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workspace_members", force: :cascade do |t|
    t.bigint "workspace_id", null: false
    t.bigint "user_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workspace_members_on_user_id"
    t.index ["workspace_id"], name: "index_workspace_members_on_workspace_id"
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "name"
    t.integer "admin"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "block_channels", "users"
  add_foreign_key "block_events", "users"
  add_foreign_key "block_users", "users"
  add_foreign_key "notifications", "sections"
  add_foreign_key "section_storages", "sections"
  add_foreign_key "sections", "workspaces"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tasks", "workspaces"
  add_foreign_key "user_assigns", "tasks"
  add_foreign_key "workspace_members", "users"
  add_foreign_key "workspace_members", "workspaces"
end
