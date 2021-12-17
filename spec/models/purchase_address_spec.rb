require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '商品の出品' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      
      it 'shipment_sourceを選択していないと保存できないこと' do
        @purchase_address.shipment_source_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipment source can't be blank")
      end
      
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      
      it 'house_numberが空だと保存できないこと' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      
      it 'tel_numberが空だと保存できないこと' do
        @purchase_address.tel_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel number can't be blank")
      end
      
      it 'tel_numberが12桁以上では登録できない' do
        @purchase_address.tel_number = '028242334233'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel number is invalid')
      end
      
      it 'tel_numberが9桁以下では登録できない' do
        @purchase_address.tel_number = '02824233'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel number is invalid')
      end

      it 'tel_numberに半角数字以外が含まれている場合は登録できない（※半角数字以外が一文字でも含まれていればOK）' do
        @purchase_address.tel_number = '028-2423333'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel number is invalid')
      end
      
      it 'user_id が空では登録できない' do
       @purchase_address.user_id = ''
       @purchase_address.valid?
       expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
     
      it 'item_id が空では登録できない' do
       @purchase_address.item_id = ''
       @purchase_address.valid?
       expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
     
     it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
     end
   end
  end
end