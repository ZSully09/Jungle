require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'is valid with valid attributes' do
      @category = Category.new(name: "Random_Category")
      @product = described_class.new(name: "Random_Product", price_cents: 100000, quantity: 10, category: @category)
      expect(@product).to be_valid
      expect(@product.errors.full_messages[0]).to be_nil
  end

  it "is invalid without a name" do
    @category = Category.new(name: "Random_Category")
    @product = described_class.new(name: nil, price_cents: 100000, quantity: 10, category: @category)
    expect(@product).not_to be_valid
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end

  it "is invalid without price" do
    @category = Category.new(name: "Random_Category")
    @product = described_class.new(name: "Random_Product", price_cents: nil, quantity: 10, category: @category)
    expect(@product).not_to be_valid
    expect(@product.errors.full_messages).to include("Price can't be blank")
  end

  it 'is invalid without a quantity' do
    @category = Category.new(name: "Random_Category")
    @product = described_class.new(name: "Random_Product", price_cents: 100000, quantity: nil, category: @category)
    expect(@product).not_to be_valid
    expect(@product.errors.full_messages[0]).to eq ("Quantity can't be blank")
  end

  it "is invalid without a category" do
  @category = Category.new(name: "Random_Category")
  @product = described_class.new(name: "Random_Product", price_cents: 100000, quantity: 10, category: nil)
    expect(@product).not_to be_valid
    expect(@product.errors.full_messages).to include("Category can't be blank")
  end

end

end



