class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :ship_method
  belongs_to_active_hash :region
  belongs_to_active_hash :ship_date

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name, length: { maximum: 40 }
    validates :item_description
    validates :price ,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :category_id, numericality: { other_than: 1 } 
    validates :item_status_id, numericality: { other_than: 1 } 
    validates :ship_method_id , numericality: { other_than: 1 } 
    validates :region_id, numericality: { other_than: 1 } 
    validates :ship_date_id, numericality: { other_than: 1 } 
  end

end
