class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :restaurant, null: false, foreign_key: true, comment: '本注文した店舗id'
      t.integer :total_price, null: false, default: 0, comment: '合計金額'

      t.timestamps
    end
  end
end
