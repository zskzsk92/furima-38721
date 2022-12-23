class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :ship_method
  belongs_to :region
  belongs_to :ship_date

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description 
    validates :price ,numericality: { only_integer: true, greater_than_or_equal_to: 300,  less_than_or_equl_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :category_id, numericality: { other_than: 1 } 
    validates :item_status_id , numericality: { other_than: 1 } 
    validates :ship_method_id, numericality: { other_than: 1 } 
    validates :region_id , numericality: { other_than: 1 } 
    validates :ship_date_id , numericality: { other_than: 1 } 
    validates :user    
  end
end
