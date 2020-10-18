class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :prefecture, :status, :sipping_fee, :sipping_time
  has_one_attached :image

  validates :category, :prefecture, :status, :sipping_fee, :sipping_time, presence: true

  validates :category_id, :prefecture_id, :status_id, :sipping_fee_id, :sipping_time_id, numericality: { other_than: 0 }
end
