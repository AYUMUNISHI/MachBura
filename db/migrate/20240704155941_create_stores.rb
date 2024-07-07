class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string     :store,                  null: false
      t.text       :product_description,    null: false
      t.integer    :category_id,            null: false
      t.string     :cooking_name,           null: false
      t.integer    :lunch_id,               null: false
      t.integer    :dinner_id,              null: false
      t.string     :phone,                  null: false
      t.integer    :prefecture_id,          null: false
      t.string     :city,                   null: false
      t.string     :block,                  null: false
      t.string     :building              
      t.string     :regular_day,            null: false
      t.references :user,                   null: false, foreign_key: true


      t.timestamps
    end
  end
end
