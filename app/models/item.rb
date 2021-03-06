class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :image, presence: true, unless: :was_attached?

  validates :name, :explain, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "半角数字のみで入力して下さい"} 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture 
  belongs_to_active_hash :shipping_date

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
  end

  private

  def was_attached?
    self.image.attached?
  end
  
end
