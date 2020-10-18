class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one_attached :image

  validates :category, presence: true

  validates :category_id, numericality: { other_than: 0 }
end
