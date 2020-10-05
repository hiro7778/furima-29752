class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :post_code,    format: { with: /\A[0-9]+\z/, message: "半角数字のみで入力して下さい"}
    validates :city,         format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角文字を使用してください"}
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "半角数字のみで入力して下さい"}
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase_id)
  end
end