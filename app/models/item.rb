class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :sipping_area
  belongs_to_active_hash :status
  belongs_to_active_hash :sipping_fee
  belongs_to_active_hash :sipping_time

  with_options presence: true do
    validates :image, :name, :description, :category, :sipping_area, :status, :sipping_fee, :sipping_time
  end

  with_options presence: true do
    validates :price, inclusion: { in: 300..9999999 }
  end
  
  with_options numericality: { other_than: 0 } do
    validates :category_id, :sipping_area_id, :status_id, :sipping_fee_id, :sipping_time_id
  end

end
