class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text          :description,            null: false
      t.string        :remark,                 null: false
      t.integer       :rating_id,              null: false
      t.references    :user,                   null: false, foreign_key: true


      t.timestamps
    end
  end
end
