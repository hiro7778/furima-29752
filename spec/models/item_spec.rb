require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it "priceがあれば保存ができること" do
    expect(@item).to be_valid
  end

  it "priceが空では保存ができないこと" do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
end
