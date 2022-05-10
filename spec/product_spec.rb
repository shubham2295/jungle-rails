require 'rails_helper'

describe 'Product' do

  before(:each) do
    @category = Category.new(name:'Bonsai')
    @category.save
  end  

  describe 'Validations' do

    it 'should create new product with valid inputs' do      
      @product = Product.new(name:'Plant', price: 10000, quantity: 20, category: @category)
      @product.save
      expect(@product).to be_present
    end

    it 'should display error message when creating new product with empty name' do
      @product = Product.new(name: nil, price: 10000, quantity: 20, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Name can\'t be blank')
    end

    it 'should display error message when creating new product with empty price' do
      @product = Product.new(name: 'Plant', price:' ', quantity: 20, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'should display error message when creating new product with empty quantity' do
      @product = Product.new(name: 'Plant', price: 10000, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
    end

    it 'should display error message when creating new product with empty category' do
      @product = Product.new(name: 'Plant', price: 10000, quantity: 20, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Category can\'t be blank')
    end

  end
end