class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :city, :block, :token, :user_id, :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  end
  
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, length: { maximum: 11 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
