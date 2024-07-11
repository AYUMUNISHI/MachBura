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


end
