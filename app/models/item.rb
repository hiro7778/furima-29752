class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :explain, :price, :category_id, :conditions_id, :shipping_fees_id, :prefectures_id, :shipping_date_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/, message: "半角数字のみで入力して下さい"} do
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture 
  belongs_to_active_hash :shipping_date

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :conditions_id
    validates :shipping_fees_id
    validates :prefectures_id
    validates :shipping_date_id
  end
  
end
