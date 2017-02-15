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

ActiveRecord::Schema.define(version: 20170215135312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "magic_cards", force: :cascade do |t|
    t.string  "unique_id"
    t.string  "layout"
    t.string  "name"
    t.json    "names"
    t.string  "mana_cost"
    t.string  "cmc"
    t.json    "colors"
    t.json    "color_identity"
    t.string  "type_of_card"
    t.json    "supertypes"
    t.json    "types"
    t.json    "subtypes"
    t.string  "rarity"
    t.string  "text"
    t.string  "flavor"
    t.string  "artist"
    t.string  "number"
    t.string  "power"
    t.string  "toughness"
    t.string  "loyalty"
    t.string  "multiverse_id"
    t.json    "variations"
    t.string  "image_name"
    t.string  "watermark"
    t.string  "border"
    t.string  "timeshifted"
    t.string  "hand"
    t.string  "life"
    t.boolean "reserved"
    t.string  "release_date"
    t.boolean "starter"
    t.string  "mci_number"
    t.json    "rulings"
    t.json    "foreign_names"
    t.json    "printings"
    t.string  "original_text"
    t.string  "original_type"
    t.json    "legalities"
    t.string  "promo_source"
    t.string  "slug"
    t.integer "magic_set_id"
    t.index ["magic_set_id"], name: "index_magic_cards_on_magic_set_id", using: :btree
    t.index ["slug"], name: "index_magic_cards_on_slug", unique: true, using: :btree
  end

  create_table "magic_sets", force: :cascade do |t|
    t.string  "name"
    t.string  "code"
    t.string  "gatherer_code"
    t.string  "old_code"
    t.string  "magic_cards_info_code"
    t.date    "release_date"
    t.string  "border"
    t.string  "type_of_set"
    t.string  "block"
    t.boolean "online_only"
    t.json    "booster"
    t.string  "mkm_name"
    t.string  "mkm_id"
    t.string  "magic_rarities_codes"
    t.string  "slug"
    t.index ["slug"], name: "index_magic_sets_on_slug", unique: true, using: :btree
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "magic_cards", "magic_sets"
end
