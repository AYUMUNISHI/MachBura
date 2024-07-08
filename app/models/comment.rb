class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :rating
  belongs_to :count
  belongs_to :charge
  belongs_to :hours

  validates :image, :comment, :remark, presence: true
  validates :rating_id, :count_id, :hours_id, numericality: { other_than: 1 , message: "can't be blank" }


end
