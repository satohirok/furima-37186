require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
   @item = FactoryBot.build(:item)
  end
 
 describe '商品登録' do
   
    
  context '出品登録がうまくいくとき' do
    
    it 'name,explanation,price,category_id,status_id,shipping_charge_id,shipment_source_id,days_idが存在すれば登録できる' do
      expect(@item).to be_valid
    end
    
    it 'explanationが1000文字以下で登録できる' do
     @item.explanation = 'abcdefghijabcdefghijabcdefghijabcdefghij'
     expect(@item).to be_valid
    end 
  
    it 'priceが300以上9999999以下なら登録できる' do
      @item.price = 500_000
      expect(@item).to be_valid
    end
  end


    context '出品登録がうまくいかないとき' do
    
    it '商品名が空だと登録できない' do
     @item.name = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it '商品説明が空だと登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it '商品説明が1000字を超えると登録できない' do
      text = 't' * 1001
      @item.explanation = text
      @item.valid?
      expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
    end
   
    it '値段が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  
    it '値段が300円未満では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than 299')
    end 
  
    it '値段が10000000円以上では登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 10000000')
    end

    it '値段が全角では登録できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '画像が空では登録できない' do
      @item.image = nil     # ""だとエラーが起きる
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  
    it 'カテゴリー情報が空では登録ができない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')    
    end

    it 'カテゴリー情報が「---」(id = 1)では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態が空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
    end

    it '商品の状態が「---」(id = 1)では登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it '配送料負担が空では登録できない' do
      @item.shipping_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank", 'Shipping charge is not a number')
    end

    it '配送料負担が「---」(id = 1)では登録できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
    end

    it '発送元の地域が空では登録できない' do
      @item.shipment_source_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment source can't be blank", 'Shipment source is not a number')
    end

    it '発送元の地域が「---」(id = 1)では登録できない' do
      @item.shipment_source_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipment source must be other than 1')
    end

    it '発送までの日数が空では登録できない' do
      @item.days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank",  'Days is not a number')
    end
    
    it '発送まで日数が「---」(id = 1)では登録できない' do
      @item.days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days must be other than 1')
    end
  end
 end
end
