# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_30_152723) do

  create_table "foods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "restaurant_id", null: false, comment: "フードの店舗id"
    t.string "name", null: false, comment: "フード名"
    t.integer "price", null: false, comment: "フード１個あたりの値段"
    t.text "description", null: false, comment: "フードの説明"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "line_foods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "food_id", null: false, comment: "仮注文したフードid"
    t.bigint "restaurant_id", null: false, comment: "仮注文した店舗id"
    t.bigint "order_id", comment: "仮注文した本注文id(初期値:Null)"
    t.integer "count", default: 0, null: false, comment: "仮注文したフードの個数"
    t.boolean "active", default: false, null: false, comment: "論理削除フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_line_foods_on_food_id"
    t.index ["order_id"], name: "index_line_foods_on_order_id"
    t.index ["restaurant_id"], name: "index_line_foods_on_restaurant_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "restaurant_id", null: false, comment: "本注文した店舗id"
    t.integer "total_price", default: 0, null: false, comment: "合計金額"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
  end

  create_table "restaurants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false, comment: "店舗名"
    t.integer "fee", default: 0, null: false, comment: "配送手数料"
    t.integer "time_required", null: false, comment: "配送にかかる時間"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "line_foods", "foods"
  add_foreign_key "line_foods", "orders"
  add_foreign_key "line_foods", "restaurants"
  add_foreign_key "orders", "restaurants"
end
