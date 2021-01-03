class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false, comment: '店舗名'
      t.integer :fee, null: false, default: 0, comment: '配送手数料'
      t.integer :time_required, null: false,comment: '配送にかかる時間'

      t.timestamps
    end
  end
end
