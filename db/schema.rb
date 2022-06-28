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

ActiveRecord::Schema.define(version: 20_220_309_184_450) do
  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.string 'slug'
    t.datetime 'approved_at'
    t.datetime 'deleted_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['name'], name: 'index_categories_on_name', unique: true
    t.index ['slug'], name: 'index_categories_on_slug', unique: true
  end

  create_table 'category_fields', force: :cascade do |t|
    t.string 'name'
    t.string 'slug'
    t.string 'type'
    t.text 'info'
    t.integer 'category_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[category_id slug], name: 'index_category_fields_on_category_id_and_slug', unique: true
    t.index ['category_id'], name: 'index_category_fields_on_category_id'
    t.index ['slug'], name: 'index_category_fields_on_slug', unique: true
  end

  create_table 'user_roles', force: :cascade do |t|
    t.string 'position'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[user_id position], name: 'index_user_roles_on_user_id_and_position', unique: true
    t.index ['user_id'], name: 'index_user_roles_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'middle_name'
    t.string 'phone', default: '', null: false
    t.string 'promo', default: '', null: false
    t.string 'gender'
    t.date 'birth_date'
    t.datetime 'deleted_at'
    t.datetime 'blocked_at'
    t.datetime 'confirmed_at'
    t.integer 'failed_confirmation_attempts', default: 0, null: false
    t.datetime 'failed_at'
    t.integer 'created_by_user_id'
    t.integer 'updated_by_user_id'
    t.integer 'deleted_by_user_id'
    t.integer 'blocked_by_user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['blocked_by_user_id'], name: 'index_users_on_blocked_by_user_id'
    t.index ['created_by_user_id'], name: 'index_users_on_created_by_user_id'
    t.index ['deleted_by_user_id'], name: 'index_users_on_deleted_by_user_id'
    t.index ['phone'], name: 'index_users_on_phone', unique: true
    t.index ['promo'], name: 'index_users_on_promo', unique: true
    t.index ['updated_by_user_id'], name: 'index_users_on_updated_by_user_id'
  end
end
