class Store < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :lunch
  belongs_to :dinner

  validates :phone, format: {with: /\A^\d[0-9]{3,4}[-][0-9]{4}[-][0-9]{4}\z/}

  validates :images, :store, :product_description, :description, :cooking_name, :phone, :city, :block, :regular_day, presence: true
  validates :category_id, :prefecture_id, numericality: { other_than: 1 }

  def save
    store.create(store: store, product_description: product_description, description: description, category_id: category_id, cooking_name: cooking_name, lunch_id: lunch_id, dinner_id: dinner_id, phone: phone, prefecture_id: prefecture_id, city: city, block: block, building: "", regular_day: regular_day, user_id: user.id)
  end
end
