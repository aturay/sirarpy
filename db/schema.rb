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

ActiveRecord::Schema.define(version: 20190101224827) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_admin_managed_resources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "class_name", null: false
    t.string "action", null: false
    t.string "name"
    t.index ["class_name", "action", "name"], name: "active_admin_managed_resources_index", unique: true
  end

  create_table "active_admin_permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "managed_resource_id", null: false
    t.integer "role", limit: 1, default: 0, null: false
    t.integer "state", limit: 1, default: 0, null: false
    t.index ["managed_resource_id", "role"], name: "active_admin_permissions_index", unique: true
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", limit: 1, default: 0, null: false
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.text "addres"
    t.string "social_url"
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean "staff", default: false
    t.index ["confirmation_token"], name: "index_admin_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_admin_users_on_unlock_token", unique: true
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email"
    t.string "phones"
    t.bigint "language_id"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_contacts_on_language_id"
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "fullname"
    t.string "email"
    t.string "phone"
    t.string "addres"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "language"
    t.integer "position", default: 1
    t.boolean "published", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language"], name: "index_languages_on_language", unique: true
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_messages_on_customer_id"
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "position", default: 1
    t.boolean "published", default: true
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "description"
    t.text "owerview"
    t.integer "price"
    t.bigint "type_id"
    t.bigint "admin_user_id"
    t.bigint "language_id"
    t.boolean "published", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_products_on_admin_user_id"
    t.index ["language_id"], name: "index_products_on_language_id"
    t.index ["type_id"], name: "index_products_on_type_id"
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sliders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "sub_title"
    t.text "description"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "position", default: 1
    t.boolean "published", default: true
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_sliders_on_language_id"
  end

  create_table "types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "description"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "position", default: 1
    t.boolean "published", default: true
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "progress"
    t.index ["language_id"], name: "index_types_on_language_id"
  end

  create_table "we_dos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "description"
    t.string "icon_file_name"
    t.string "icon_content_type"
    t.integer "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer "position", default: 1
    t.boolean "published", default: true
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_we_dos_on_language_id"
  end

  add_foreign_key "contacts", "languages"
  add_foreign_key "messages", "customers"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "admin_users"
  add_foreign_key "products", "languages"
  add_foreign_key "products", "types"
  add_foreign_key "sliders", "languages"
  add_foreign_key "types", "languages"
  add_foreign_key "we_dos", "languages"
end
