require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it 'item_name,item_description,price,category_id,item_status_id,ship_method_id,region_id,ship_date_idが適切に入力されれば、商品が出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_nameが41文字以上だと出品できない' do
        @item.item_name = Faker::Lorem.characters(number:41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end

      it 'item_descriptionが空では出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9999999以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが全角だと出品できない' do
        @item.price =  '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが半角英字だと出品できない' do
        @item.price =  'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'item_status_idが空では出品できない' do
        @item.item_status_id = ''
        @item.valid?

        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it 'item_status_idが1では出品できない' do
        @item.item_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end

      it 'ship_method_idが空では出品できない' do
        @item.ship_method_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship method can't be blank")
      end

      it 'ship_method_idが1では出品できない' do
        @item.ship_method_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship method must be other than 1")
      end      

      it 'region_idが空では出品できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end

      it 'region_idが1では出品できない' do
      @item.region_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 1")
      end

      it 'ship_date_idが空では出品できない' do
        @item.ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can't be blank")
      end

      it 'ship_date_idが1では出品できない' do
        @item.ship_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date must be other than 1")
      end

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
