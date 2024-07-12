class Store < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :lunch
  belongs_to :dinner

  validate :must_have_three_images
  validates :phone, format: {with: /\A^0([0-9]-[0-9]{4}|[0-9]{2}-[0-9]{3}|[0-9]{3}-[0-9]{2}|[0-9]{4}-[0-9])-[0-9]{4}\z/}

  validates :images, :store, :product_description, :description, :cooking_name, :phone, :city, :block, :regular_day, presence: true
  validates :category_id, :prefecture_id, numericality: { other_than: 1 }

  private
  def must_have_three_images
    errors.add(:images, "must have exactly three") if images.size != 4
  end



end
