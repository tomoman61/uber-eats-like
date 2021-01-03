class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.integer :restaurant_id, null: false, comment: 'フードの店舗id'
      t.string :name, null: false, comment: 'フード名'
      t.integer :price, null: false, comment: 'フード１個あたりの値段'
      t.text :description, null: false, comment: 'フードの説明'

      t.timestamps
    end
  end
end
