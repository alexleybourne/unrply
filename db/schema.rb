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

ActiveRecord::Schema.define(version: 2019_11_27_083841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "achievements_rooms", id: false, force: :cascade do |t|
    t.bigint "achievement_id"
    t.bigint "room_id"
    t.index ["achievement_id"], name: "index_achievements_rooms_on_achievement_id"
    t.index ["room_id"], name: "index_achievements_rooms_on_room_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_emojis", force: :cascade do |t|
    t.string "code"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_custom_emojis_on_room_id"
  end

  create_table "emojis", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emojis_rooms", id: false, force: :cascade do |t|
    t.bigint "emoji_id"
    t.bigint "room_id"
    t.index ["emoji_id"], name: "index_emojis_rooms_on_emoji_id"
    t.index ["room_id"], name: "index_emojis_rooms_on_room_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.string "emojiable_type"
    t.bigint "emojiable_id"
    t.bigint "user_id"
    t.bigint "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emojiable_type", "emojiable_id"], name: "index_reactions_on_emojiable_type_and_emojiable_id"
    t.index ["message_id"], name: "index_reactions_on_message_id"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "access_code"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_rooms_on_owner_id"
  end

  create_table "rooms_user_settings", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.string "nickname"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_rooms_user_settings_on_room_id"
    t.index ["user_id"], name: "index_rooms_user_settings_on_user_id"
  end

  create_table "table_categories_emojis", force: :cascade do |t|
    t.bigint "category_id"
    t.string "emojiable_type"
    t.bigint "emojiable_id"
    t.index ["category_id"], name: "index_table_categories_emojis_on_category_id"
    t.index ["emojiable_type", "emojiable_id"], name: "emojiable"
  end

  create_table "typing_messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_typing_messages_on_room_id"
    t.index ["user_id"], name: "index_typing_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "achievements_rooms", "achievements"
  add_foreign_key "achievements_rooms", "rooms"
  add_foreign_key "custom_emojis", "rooms"
  add_foreign_key "emojis_rooms", "emojis"
  add_foreign_key "emojis_rooms", "rooms"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "reactions", "messages"
  add_foreign_key "reactions", "users"
  add_foreign_key "rooms", "users", column: "owner_id"
  add_foreign_key "rooms_user_settings", "rooms"
  add_foreign_key "rooms_user_settings", "users"
  add_foreign_key "table_categories_emojis", "categories"
  add_foreign_key "typing_messages", "rooms"
  add_foreign_key "typing_messages", "users"
end
