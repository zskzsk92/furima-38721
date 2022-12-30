class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :town, :region_id, :street_address, :name_of_building, :phone_number , :user_id, :item_id

  with_options presence: true do
    # shipping_addressモデルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :town
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :street_address
    validates :phone_number , format: { with: /\A[0-9]{11}\z/, message: 'is input error' }

    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, town: town, region_id: region_id, street_address: street_address, name_of_building: name_of_building, phone_number: phone_number,order_id: order.id)
  end

end