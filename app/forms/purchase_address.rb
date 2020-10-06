class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :post_code,    format: { with: /\A\d{3}[-]\d{4}\z/, message: "半角数字とハイフンで入力して下さい"}
    validates :city,         format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角文字を使用してください"}

    validates :phone_number, format: { with: /\A\d{11}\z/, message: "半角数字11桁で入力して下さい"}
  end

  validates :token, presence: true
  validates :house_number, presence: true
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end