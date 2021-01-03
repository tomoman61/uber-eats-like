class CreateLineFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :line_foods do |t|
      t.references :food, null: false, foreign_key: true, comment: '仮注文したフードid'
      t.references :restaurant, null: false, foreign_key: true, comment: '仮注文した店舗id'
      t.references :order, foreign_key: true, comment: '仮注文した本注文id(初期値:Null)'
      t.integer :count, null: false, default: 0, comment: '仮注文したフードの個数'
      t.boolean :active, null: false, default: false, comment: '論理削除フラグ'

      t.timestamps
    end
  end
end
