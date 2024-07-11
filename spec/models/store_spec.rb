require 'rails_helper'


RSpec.describe Store, type: :model do
  before do
    @store = FactoryBot.build(:store)
  end
  
 
 describe 'お店紹介機能' do
  context 'お店紹介登録できるとき' do
    it '必要な項目が正しく存在すれば登録できる' do
      expect(@store).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @store.building = ''
      expect(@store).to be_valid
    end

   end
  context '商品出品登録できないとき' do
    it 'storeが空だと登録できない' do
      @store.store = ''
      @store.valid?
      expect(@store.errors.full_messages).to include("Store can't be blank")
    end
    
    it 'imagesが空では登録できない' do
      @store.images = nil
      @store.valid?
      expect(@store.errors.full_messages).to include("Images can't be blank")
    end
    it 'product_descriptionが空では登録できない' do
      @store.product_description = ''
      @store.valid?
      expect(@store.errors.full_messages).to include("Product description can't be blank")
    end
     it 'descriptionが空では登録できない' do
      @store.description = ''
      @store.valid?
      expect(@store.errors.full_messages).to include("Description can't be blank")
    end
     it 'category_idが1の場合は登録できない' do
      @store.category_id = '1'
      @store.valid?
      expect(@store.errors.full_messages).to include( "Category must be other than 1")
    end
    it 'cooking_nameが空では登録できない' do
      @store.cooking_name = ''
      @store.valid?
      expect(@store.errors.full_messages).to include("Cooking name can't be blank")
    end
    it 'phoneが空では登録できない' do
      @store.phone = ''
      @store.valid?
      expect(@store.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneは最初は2桁では登録できない' do
      @store.phone = '02-4444-4444'
      @store.valid?
      expect(@store.errors.full_messages).to include('Phone is invalid')
    end
    it 'phoneは最初は5桁では登録できない' do
      binding.pry
      @store.phone = '02655-4444-4444'
      @store.valid?
      expect(@store.errors.full_messages).to include('Phone is invalid')
    end
    it 'phoneはハイフン後は1桁では登録できない' do
      @store.phone = '0265-4-4444'
      @store.valid?
      expect(@store.errors.full_messages).to include('Phone is invalid')
    end
    it 'phoneはハイフン後は3桁では登録できない' do
      @store.phone = '0265-444-4444'
      @store.valid?
      expect(@store.errors.full_messages).to include('Phone is invalid')
    end
    it 'phoneはハイフン後は4桁以外では登録できない' do
      @store.phone = '0265-4444-44444'
      @store.valid?
      expect(@store.errors.full_messages).to include('Phone is invalid')
    end
    it 'prefecture_idが1の場合では登録できない' do
      @store.prefecture_id = '1'
      @store.valid?
      expect(@store.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空では登録できない' do
      @store.city = ''
      @store.valid?
      expect(@store.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空では登録できない' do
      @store.block = ''
      @store.valid?
      expect(@store.errors.full_messages).to include("Block can't be blank")
    end
    it 'regular_dayが空では登録できない' do
      @store.regular_day = ''
      @store.valid?
      expect(@store.errors.full_messages).to include("Regular day can't be blank")
    end
    it 'userが紐付いていないと保存できない' do
      @store.user = nil
      @store.valid?
      expect(@store.errors.full_messages).to include('User must exist')
    end
  end
 end
end
