require 'rails_helper'

describe Item do
  describe '#create' do
    # 1
    it "name、category_id, status_id, text, burden_id, area_id, days_to_ship_id, とselling_priceが存在すれば登録できること" do
      item = build(:item)
      expect(item).to be_valid
    end

    # 2
    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    # 3
    it "textがない場合は登録できないこと" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("can't be blank")
    end

    # 4
    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    # 5
    it "status_idがない場合は登録できないこと" do
      item = build(:item, status_id: nil)
      item.valid?
      expect(item.errors[:status_id]).to include("can't be blank")
    end

    it "area_idがない場合は登録できないこと" do
      item = build(:item, area_id: nil)
      item.valid?
      expect(item.errors[:area_id]).to include("can't be blank")
    end
    
    it "burden_idがない場合は登録できないこと" do
      item = build(:item, burden_id: nil)
      item.valid?
      expect(item.errors[:burden_id]).to include("can't be blank")
    end

    it "days_to_ship_idがない場合は登録できないこと" do
      item = build(:item, days_to_ship_id: nil)
      item.valid?
      expect(item.errors[:days_to_ship_id]).to include("can't be blank")
    end
    
    it "selling_priceがない場合は登録できないこと" do
      item = build(:item, selling_price: nil)
      item.valid?
      expect(item.errors[:selling_price]).to include("can't be blank")
    end

    # 6
    it " nameが41文字以上であれば登録できないこと" do
      item = build(:item, name: "aaaaaaaaaabbbbbcbbbbbccccccccccdddddddddde")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    # 7
    it "nameが40文字以下では登録できること " do
      item = build(:item, name: "aaaaaa")
      expect(item).to be_valid
    end
    
    it "textが1000文字以下では登録できること " do
      item = build(:item, text: "bbbbbb")
      expect(item).to be_valid
    end

    it "selling_priceが9999999以下では登録できること " do
      item = build(:item, selling_price: "8000")
      expect(item).to be_valid
    end

    it "selling_priceが300以下では登録できない " do
      item = build(:item, selling_price: "200")
      item.valid?
      expect(item.errors[:selling_price]).to include("must be greater than 300")
    end
    
  end
end