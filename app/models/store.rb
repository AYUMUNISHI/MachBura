class Store < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :lunch
  belongs_to :dinner


  validates :image, :store, :product_description, :cooking_name, :phone, :city, :block, :regular_day, presence: true
  validates :category_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
end
