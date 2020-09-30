class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :explain, :price, :category_id, :conditions_id, :shipping_fees_id, :prefectures_id, :shipping_date_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture 
  belongs_to_active_hash :shipping_date

  validates :category_id, numericality: { other_than: 1 }
  validates :conditions_id, numericality: { other_than: 1 }
  validates :shipping_fees_id, numericality: { other_than: 1 }
  validates :prefectures_id, numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }
end
